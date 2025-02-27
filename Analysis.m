%% Frequency Estimation

f_est = nb_spike./ delta_t_stimul; % Units: Hz

f_max = max(f_est);

% Rheobase current

episode_rheobase = find (nb_spike > 0, 1);

I_rheobase = delta_I (episode_rheobase);% Units: pA


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Firing rate at 200 pA

[~, index_200pA] = min( abs( delta_I - 200));
%[~, index_400pA] = min( abs( delta_I - 400));

f_200_pA = f_est(index_200pA); % Units: Hz
%f_400_pA = f_est(index_400pA);

% Maximal firing rate

firing_rate = zeros(1, nb_episode);

for k = 1: nb_episode-1
    
    firing_rate (k) = (f_est (k+1)- f_est(k))./ (delta_I(k+1) - delta_I(k))*1e3; % Units: Hz/nA
    
end

firing_rate (nb_episode) = (f_est (nb_episode)- f_est(nb_episode-1))./ (delta_I(nb_episode) - delta_I(nb_episode-1));

%% Find onset delay at rheobase

 V_rheobase = V (:, episode_rheobase);

 derivative_V_rheobase = zeros(length(T),1); dt = 1/f_Acqui*2; % Units: s

 clear index

 for k = round(t_response_initial*f_Acqui) : round(t_response_end*f_Acqui)

    derivative_V_rheobase (k) = (V_rheobase (k+2) - V_rheobase (k))./dt; % Units: V/s

 end

 index = find(derivative_V_rheobase > 40);
 index_bottom_rheobase = index(2);
 
 Latency_onset = (index_bottom_rheobase/f_Acqui*1e3 - t_response_initial*1e3); % Units: ms

%% Confine AP to the first 100 ms of response

for k = episode_rheobase: nb_episode
    
    clear V_k
    
    V_k = V (:, k);

    derivative_V_k = zeros(length(T),1); dt = 1/f_Acqui*2; % Units: s

    clear index

    for j = round(t_response_initial*f_Acqui) : round(t_response_end*f_Acqui)

    derivative_V_k (j) = (V_k (j+2) - V_k (j))./dt; % Units: V/s

    end

    index = find(derivative_V_k > 40);
    index_bottom = index(2);
    
    if (index_bottom/f_Acqui*1e3 - t_response_initial*1e3) < 100 % Units: ms
        
        episode_AP = k;
        
        V_AP = V(:, episode_AP);
        
        derivative_V_AP = derivative_V_k;
        
        break
    end 
end

%% AP shape (first AP in the previous 100 ms)
    
V_threshold = V_AP(index_bottom)*1e3; % Units: mV


index_top = find ( derivative_V_AP (index_bottom : t_response_end*f_Acqui) <0, 1) ; % find the first derivative that declines to zero

index_top = index_top + index_bottom -1;

% AP_Width

V_mid = (V_AP(index_top) + V_AP(index_bottom))/2; % Find the middle level of action potential

index_up_t1 = find( V_AP (index_bottom: index_top) > V_mid, 1);
index_up_t1 = index_up_t1 + index_bottom -1;
index_up_t2 = index_up_t1 - 1;
index_up = (index_up_t1 + index_up_t2)/2;

t_up_mid = index_up/f_Acqui*1e3;% Units: ms

index_down_t1 = find( V_AP (index_top : t_response_end*f_Acqui) < V_mid, 1);
index_down_t1 = index_down_t1 + index_top - 1;
index_down_t2 = index_down_t1 - 1;
index_down = (index_down_t1 + index_down_t2)/2;

t_down_mid = index_down/f_Acqui*1e3;% Units: ms

AP_Width = t_down_mid - t_up_mid; % Units: ms

% OLD WAY

%index_t1 = interp1(V_rheobase(index:index_top), index:index_top, V_mid);
%index_t2 = find( V_rheobase (index_top: t_response_end*f_Acqui) < V_mid, 1);
%index_t2 = index_top + index_t2 -1;
%AP_Width = (index_t2 - index_t1)/f_Acqui*1e3; % Units: ms

%% Adaptation/ Fast-doublet ratio

clear index

[~, episode_15Hz] = min( abs(f_est-15)); % Find the episode gave the frequency closest to 15Hz

%episode_15Hz = episode_15Hz+1;% Find the next episode for 15 Hz
%episode_15Hz = 19; %Find any episode you want for 15 Hz analysis

index_spike_15Hz = find ( V(:, episode_15Hz)*1e3 > 0);% It is where the spikes really are

index = find( diff(index_spike_15Hz) >1) +1;

% Find the original time points

spike_timing = zeros(1, length(index)+1);% Find the original time points

spike_timing(1) = index_spike_15Hz (1);

for i = 1 : length(index)
        
    spike_timing (i+1) = index_spike_15Hz( index(i));
    
end  

t_1 = spike_timing (2) - spike_timing(1); % first interspike interval % Units: ms
t_2 = spike_timing (3) - spike_timing(2); 
t_10 = spike_timing (11) - spike_timing(10); % tenth interval


t_mean = mean( diff(spike_timing)); 
t_min = min( diff(spike_timing));


Adaptation_ratio = t_10/t_2;
Fast_doublet_ratio = t_2/t_1;

Adaptation_index = t_10/t_mean;
Fast_doublet_index = t_mean/t_1;
%
Bursting_index = t_min/t_mean;

%% AP phase plot

% Hyperpolarization of action potential
clear index_hyper

index_hyper = find ( derivative_V_AP (index_top : t_response_end*f_Acqui) > 0, 1); % find the first derivative that reverses to positive : hyperpolarization

index_hyper = index_top + index_hyper -1;

%index_hyper = (196)*f_Acqui*1e-3; % Find manually the hyperpolar peak

index_rebound = find( derivative_V_AP (index_hyper: t_response_end*f_Acqui) < 0, 1); % find the first derivative that declines to zero : rebound
index_rebound = index_hyper + index_rebound -1;

index_repolar = find( derivative_V_AP (index_rebound: t_response_end*f_Acqui) < V_AP(index_bottom), 1); % find the first derivative that reverses to positive : end of an action potential
index_repolar = index_rebound + index_repolar -1;

AP_Amplitude = (V_AP(index_top) - V_AP (index_bottom))*1e3 ; % Units: mV

AP_AHP = (V_AP(index_hyper) - V_AP (index_bottom))*1e3 ; % Units: mV

Maxi_depol_rate = max(derivative_V_AP(round(t_response_initial*f_Acqui) : index_repolar));
Maxi_repol_rate = min(derivative_V_AP(round(t_response_initial*f_Acqui) : index_repolar));

%%% ALL the Plotting

%% I-V CURVE

colordef white

subplot(2,4,1); 

plot(delta_I, V_mean, 'b*')  % Units: pA, mV

hold on 

fit_start_iv = -75;
fit_end_iv = -55;

[~, start_index_iv] = min(abs(V_mean - fit_start_iv));
[~, end_index_iv] = min(abs(V_mean - fit_end_iv));

fitobject_iv = fit(delta_I(start_index_iv:end_index_iv)',V_mean(start_index_iv:end_index_iv)','poly1');

plot(fitobject_iv,'r')

fit_coefficients_iv = coeffvalues(fitobject_iv);

slope_iv = fit_coefficients_iv(1)*1e3; % Units: MegaOhm

set(gca,'FontSize',8)
xlabel('current(pA)','FontSize',16);
ylabel('membrane potential(mV)','FontSize',16);
title(['I-V curve of ',num2str(eval('name_data'))],'FontSize',20);
grid on
hline = refline(0,-65);
set(hline,'Color','g')
axis([-600 800 -120 0])
text(-500, -50, ['Neuronal input resistance = ', num2str(slope_iv), ' M\Omega'],'FontSize',12);
text(-500, -30, ['Resting membrane potential = ', num2str(RMP), ' mV'],'FontSize',12);

%% Time constant

%JeanJeanJeanJeanJeanJeanJeanJeanJeanJeanJeanJeanJeanJeanJeanJean

subplot(2,4,2);

%t_tau_initial = 0.129;% JEAN
%t_tau_end = 0.4;

%t_tau_initial = 1.235;% MERIE
%t_tau_end = 1.35;

%t_tau_initial = 2.16;% MERIE
%t_tau_end = 2.2;

%t_tau_initial = 0.114;% JEAN Rat's
%t_tau_end = 0.4;

%t_tau_initial = 0.131;% JEAN Rat's
%t_tau_end = 0.5;

%t_tau_initial = 0.03215;% Louis RS Init
%t_tau_end = 0.100;

t_tau_initial = 0.532;% Louis
t_tau_end = 0.632;

%t_tau_initial = 0.6785;% Louis RS Normal
%t_tau_end = 0.7085;

plot(-T(t_tau_initial*f_Acqui).*1e3+T(t_tau_initial*f_Acqui : t_tau_end*f_Acqui)'.*1e3, smooth(V(t_tau_initial*f_Acqui : t_tau_end*f_Acqui, episode_tau)*1e3, 20), 'b');
hold on 

% fitobject_tau = fit(T(t_tau_initial*f_Acqui : t_tau_end*f_Acqui)'.*1e3, smooth(V(t_tau_initial*f_Acqui : t_tau_end*f_Acqui, episode_tau)*1e3, 20), 'exp2');
% plot(fitobject_tau, 'r')

%%%%%%
fitobject_tau = fit(-T(t_tau_initial*f_Acqui).*1e3+T(t_tau_initial*f_Acqui : t_tau_end*f_Acqui)'.*1e3, smooth(V(t_tau_initial*f_Acqui : t_tau_end*f_Acqui, episode_tau)*1e3, 20), 'exp2');
plot(fitobject_tau, 'r')

fit_coefficients_tau = coeffvalues(fitobject_tau);
tau1 = -1./fit_coefficients_tau (4);% Units: ms
tau2 = -1./fit_coefficients_tau (2);

set(gca,'FontSize',8)
xlabel('Time (ms)','FontSize',16);
ylabel('Membranne potential(mV)','FontSize',16);
title('Time constant ','FontSize',20);

%axis([round(t_tau_initial.*1e3) round(t_tau_end.*1e3) -85 -60])
%text(1240, -75, ['tau 1 = ', num2str(tau1), ' ms'],'FontSize',12);
%text(1240, -70, ['tau 2 = ', num2str(tau2), ' ms'],'FontSize',12);

axis([0  round(t_tau_end.*1e3)-round(t_tau_initial.*1e3) -85 -60])
text(10, -75, ['tau 1 = ', num2str(tau1), ' ms'],'FontSize',12);
text(10, -80, ['tau 2 = ', num2str(tau2), ' ms'],'FontSize',12);

%LiWenLiWenLiWenLiWenLiWenLiWenLiWenLiWenLiWenLiWenLiWenLiWenLiWen

%t_tau_initial = 0.0785;% Merie
%t_tau_end = 0.22 ;

%t_tau_initial = 0.094;% Merie
%t_tau_end = 0.225 ;

%t_tau_initial = 0.278; % Li-Wen
%t_tau_end = 0.45;

%t_tau_initial = 0.13;% JEAN
%t_tau_end = 0.2;


%V_tau = mean(V(t_tau_initial*f_Acqui : t_tau_end*f_Acqui, :)'*1e3)'; % mV
%T_tau = T(t_tau_initial*f_Acqui : t_tau_end*f_Acqui)'*1e3; % ms

%[a, b, c, d , baseline] = fit_exp2 ( T_tau, V_tau, 5);

%[a, b, baseline] = fit_exp1 ( T_tau, V_tau, 10);

%subplot(2,4,2);

%plot(T_tau, V_tau, 'b');
%hold on 

%fitobject_tau = fit(T_tau, V_tau, 'exp2');

%plot(fitobject_tau)

%plot(T_tau, a*exp(b*T_tau)+c*exp(d*T_tau)+baseline, 'r')

%plot(T_tau, a*exp(b*T_tau)+baseline, 'r')

%fit_coefficients_tau = coeffvalues(fitobject_tau);

%tau1 = -1./d;% Units: ms
%tau2 = -1./b;

%tau1 = -1./fit_coefficients_tau(4);% Units: ms
%tau2 = -1./fit_coefficients_tau(2);


%set(gca,'FontSize',8)
%xlabel('Time (ms)','FontSize',16);
%ylabel('Membranne potential(mV)','FontSize',16);
%title('Time constant ','FontSize',20);

%text(300, -65, ['tau 1 = ', num2str(tau1), ' ms'],'FontSize',12);
%text(300, -70, ['tau 2 = ', num2str(tau2), ' ms'],'FontSize',12);

%axis([round(t_tau_initial.*1e3) round(t_tau_end.*1e3) -80 -60])

%% sag ratio

clear index

[~, index] = min(abs(V_mean - (-100)));
Ih_100 = mean(Ratio_Ih(index: index+1));    % Adjust it if the first episode is already -100 mV
%Ih_100 = Ratio_Ih(index);

subplot(2,4,3);
plot(T((t_response_initial-0.01)*f_Acqui:t_response_end*f_Acqui).*1e3, V((t_response_initial-0.01)*f_Acqui:t_response_end*f_Acqui, index)*1e3);
xlabel('Time (ms)','FontSize',16);
ylabel('Membrane potential (mV) ','FontSize',16);
title('Hyperpolarization activated current','FontSize',20);
text((t_min_initial)*1e3, -80, ['Sag ratio = ', num2str(Ih_100)],'FontSize',12)
 
clear index

%% Onset latency at rheobase

subplot(2,4,4); 

plot(T(t_baseline_end*f_Acqui:t_response_end*f_Acqui).*1e3, V_rheobase(t_baseline_end*f_Acqui:t_response_end*f_Acqui)*1e3)
hold on

plot(index_bottom_rheobase/f_Acqui*1e3, V_rheobase(index_bottom_rheobase)*1e3,'rdiamond')

xlabel('time','FontSize',16);
ylabel('Membrane potential (mV) ','FontSize',16);
title('Onset latency at rheobase','FontSize',20);
%text(1300, 50, ['Onset latency = ', num2str(Latency_onset),' ms'],'FontSize',12);
text(550, 50, ['Onset latency = ', num2str(Latency_onset),' ms'],'FontSize',12);

%Choosing the interval you want to plot!

%axis([1200 2100 -80 80])
axis([500 1400 -80 80])

%% Input-output CURVE

subplot(2,4,5); 
plot(delta_I, f_est, 'b*') % Units: pA, Hz
hold on 

%index_start_io = episode_rheobase +2;
%index_end_io = episode_rheobase + 6;

index_start_io = episode_rheobase ;
index_end_io = episode_rheobase + 4;        

fitobject_io = fit(delta_I(index_start_io:index_end_io)',f_est(index_start_io:index_end_io)','poly1');

plot(fitobject_io,'r')

fit_coefficients_io = coeffvalues(fitobject_io);
slope_io = fit_coefficients_io(1)*1e3; % Units: Hz/nA

set(gca,'FontSize',8)
xlabel('Current input (pA)','FontSize',16);
ylabel('Firing frequency (Hz)','FontSize',16);
title('Input-output curve','FontSize',20);
grid on
axis([-800 2000 0 100])
text(-600, 50, ['Firing rate at 200 pA = ', num2str(f_200_pA), ' Hz'],'FontSize',12);
%text(-600, 50, ['Firing rate at 400 pA = ', num2str(f_400_pA), ' Hz'],'FontSize',12);
text(-600, 60, ['Rheobase current = ', num2str(I_rheobase), ' pA'],'FontSize',12);
text(-600, 70, ['Input-output slope = ', num2str(slope_io), ' Hz/ nA'],'FontSize',12); % Units: Hz/nA
text(-600, 80, ['Maximum firing frequency = ', num2str(f_max), ' Hz'],'FontSize',12);



%% First Action potential

subplot(2,4,6);

plot(T(t_baseline_end*f_Acqui:t_response_end*f_Acqui).*1e3, V_AP(t_baseline_end*f_Acqui:t_response_end*f_Acqui)*1e3)
hold on

plot(index_bottom/f_Acqui*1e3, V_AP(index_bottom)*1e3,'rdiamond')
plot(index_top/f_Acqui*1e3, V_AP(index_top)*1e3,'go')
plot(index_hyper/f_Acqui*1e3, V_AP(index_hyper)*1e3, 'cx')
plot(t_up_mid, V_AP(round(index_up))*1e3, 'bo')
plot(t_down_mid, V_AP(round(index_down))*1e3, 'bo')

xlabel('time','FontSize',16);
ylabel('Membrane potential (mV) ','FontSize',16);
title('Rheobase action potential','FontSize',20);
%text(t_response_initial*1e3+25, -60, ['threshold = ', num2str(V_threshold),' mV'],'FontSize',12);
%text(t_response_initial*1e3+25, 50, ['AP width = ', num2str(AP_Width),' ms'],'FontSize',12);
%text(t_response_initial*1e3+25, 70, ['AP rise amplitude = ', num2str(AP_Amplitude),' mV'],'FontSize',12);
%text(t_response_initial*1e3+25, 60, ['AP AHP = ', num2str(AP_AHP),' mV'],'FontSize',12);


text(610, -60, ['threshold = ', num2str(V_threshold),' mV'],'FontSize',12);
text(610, 50, ['AP width = ', num2str(AP_Width),' ms'],'FontSize',12);
text(610, 70, ['AP rise amplitude = ', num2str(AP_Amplitude),' mV'],'FontSize',12);
text(610, 60, ['AP AHP = ', num2str(AP_AHP),'mV'],'FontSize',12);

%text(1200, -60, ['threshold = ', num2str(V_threshold),' mV'],'FontSize',12);
%text(1200, 50, ['AP width = ', num2str(AP_Width),' ms'],'FontSize',12);
%text(1200, 70, ['AP rise amplitude = ', num2str(AP_Amplitude),' mV'],'FontSize',12);
%text(1200, 60, ['AP AHP = ', num2str(AP_AHP),'mV'],'FontSize',12);

%Choosing the interval you want to plot!

axis([500 700 -80 80])
%axis([1200 1800 -80 80])

%% Adaptation/fastdoublet-ratio 

subplot(2,4,7); 

plot(T((t_baseline_end)*f_Acqui:t_response_end*f_Acqui).*1e3, V((t_baseline_end)*f_Acqui:t_response_end*f_Acqui, episode_15Hz)*1e3);
hold on

plot(T(spike_timing).*1e3, V(spike_timing, episode_15Hz)*1e3,'rdiamond')

xlabel('time (ms)','FontSize',16);
ylabel('Membrane potential (mV) ','FontSize',16);
title('Action potentials at 15 Hz','FontSize',20);

text(t_response_initial*1e3+10, 70, ['Fast-doublet ratio (t2/t1)  = ', num2str(Fast_doublet_ratio)], 'FontSize',12)
text(t_response_initial*1e3+10, 50, ['Adaptation ratio (t10/t2)  = ', num2str(Adaptation_ratio)], 'FontSize',12)

%Choosing the interval you want to plot!

axis([(t_baseline_end)*1e3 t_response_end*1e3 -80 80])

%% Phase plot of first AP at rheobase

subplot(2,4,8); 

plot( V_AP(round(t_response_initial*f_Acqui) : index_repolar)*1e3, derivative_V_AP(round(t_response_initial*f_Acqui)  : index_repolar),'b') % Units: mV - V/s

xlabel('Membrane potential (mV) ','FontSize',16);
ylabel('first derivative of Membrane potential (V/s) ','FontSize',16);
title(' Rheobase AP Phase plot','FontSize',20);

hline = refline(0,Maxi_depol_rate);
set(hline,'Color','g')
hline = refline(0,Maxi_repol_rate);
set(hline,'Color','c')
axis([-60 70 -300 600])

text(-50, 250, ['Maximum depolarization rate = ', num2str(Maxi_depol_rate),' V/s'],'FontSize',12);
text(-50, -150, ['Maximum repolarization rate = ', num2str(Maxi_repol_rate),' V/s'],'FontSize',12);