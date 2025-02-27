function [ V_threshold, AP_Width, AP_AHP, AP_Amplitude, Maxi_depol_rate, Maxi_repol_rate] = phase_analysis( V, f_Acqui)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

derivative_V = zeros(length(V),1);
dt = 1/f_Acqui*2;


for j = 1 : length(V)-2
    derivative_V (j) = (V (j+2) - V (j))/dt; % Units: V/s
end

fh=figure;
plot(V);
temp=input('If you dont need to zoom any longer, just press enter');


[selected_T,selected_V]=ginput(2);

close(fh)

s_V=V(round(selected_T(1)):round(selected_T(2)));
s_dV=derivative_V(round(selected_T(1)):round(selected_T(2)));

clear index
index = find(s_dV > 35); %????????????????????????????????????????????????????????????????????????
index_bottom = index(2);
V_threshold = s_V(index_bottom); % Units: mV
index_top = find ( s_dV (index_bottom : end) <0, 1) + index_bottom -1; % find the first derivative that declines to zero

% AP_Width

V_mid = (s_V(index_top) + s_V(index_bottom))/2; % Find the middle level of action potential

index_up_t1 = find( s_V (index_bottom: index_top) > V_mid, 1);
index_up_t1 = index_up_t1 + index_bottom -1;
index_up_t2 = index_up_t1 - 1;
index_up = (index_up_t1 + index_up_t2)/2;

t_up_mid = index_up;% Units: ms

index_down_t1 = find( s_V (index_top : end) < V_mid, 1);
index_down_t1 = index_down_t1 + index_top - 1;
index_down_t2 = index_down_t1 - 1;
index_down = (index_down_t1 + index_down_t2)/2;

t_down_mid = index_down;% Units: ms

AP_Width = (t_down_mid - t_up_mid)/f_Acqui; % Units: sec

% Hyperpolarization of action potential
clear index_hyper

index_hyper = find ( s_dV (index_top : end) > 0, 1); % find the first derivative that reverses to positive : hyperpolarization

index_hyper = index_top + index_hyper -1;

%index_hyper = (196)*f_Acqui*1e-3; % Find manually the hyperpolar peak

index_rebound = find( s_dV (index_hyper: end) < 0, 1); % find the first derivative that declines to zero : rebound
index_rebound = index_hyper + index_rebound -1;

index_repolar = find( s_dV (index_rebound: end) < s_V(index_bottom), 1); % find the first derivative that reverses to positive : end of an action potential
index_repolar = index_rebound + index_repolar -1;

AP_Amplitude = (s_V(index_top) - s_V (index_bottom)) ; % Units: V

AP_AHP = (s_V(index_hyper) - s_V (index_bottom)) ; % Units: V

Maxi_depol_rate = max(s_dV(1 : index_repolar));
Maxi_repol_rate = min(s_dV(1 : index_repolar));

figure
subplot(1,2,1);

plot((1:length(s_V))/f_Acqui*1e3, s_V*1e3)
hold on

plot(index_bottom/f_Acqui*1e3, s_V(index_bottom)*1e3,'rdiamond')
plot(index_top/f_Acqui*1e3, s_V(index_top)*1e3,'go')
plot(index_hyper/f_Acqui*1e3, s_V(index_hyper)*1e3, 'cx')
plot(t_up_mid/f_Acqui*1e3, s_V(round(index_up))*1e3, 'bo')
plot(t_down_mid/f_Acqui*1e3, s_V(round(index_down))*1e3, 'bo')

xlabel('time','FontSize',16);
ylabel('Membrane potential (mV) ','FontSize',16);
title('Rheobase action potential','FontSize',20);

text(10, -50, ['threshold = ', num2str(V_threshold*1000),' mV'],'FontSize',12);
text(10, 10, ['AP width = ', num2str(AP_Width*1000),' ms'],'FontSize',12);
text(10, 20, ['AP rise amplitude = ', num2str(AP_Amplitude*1000),' mV'],'FontSize',12);
text(10, 30, ['AP AHP = ', num2str(AP_AHP*1000),'mV'],'FontSize',12);

%Choosing the interval you want to plot!

axis([0 length(s_V)/f_Acqui*1e3 -80 80])
%axis([100 300 -80 80])

%% Phase plot of first AP at rheobase

subplot(1,2,2); 

plot( s_V(1 : index_repolar)*1e3, s_dV(1  : index_repolar),'b') % Units: mV - V/s

xlabel('Membrane potential (mV) ','FontSize',16);
ylabel('first derivative of Membrane potential (V/s) ','FontSize',16);
title(' Rheobase AP Phase plot','FontSize',20);

hline = refline(0,Maxi_depol_rate);
set(hline,'Color','g')
hline = refline(0,Maxi_repol_rate);
set(hline,'Color','c')
axis([-80 70 -300 600])

text(-50, 250, ['Maximum depolarization rate = ', num2str(Maxi_depol_rate),' V/s'],'FontSize',12);
text(-50, -150, ['Maximum repolarization rate = ', num2str(Maxi_repol_rate),' V/s'],'FontSize',12);

output_args=NaN;
end

