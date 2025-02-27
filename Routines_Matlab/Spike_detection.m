%% Defining sources
%Load your .mat data file translated from .abf before starting routine
name_data = 18607042 %You have to type in the name yourself. 

% Number of episode
nb_episode = 44; 

% Resting membrane potential
RMP = -75;

%Episode for measuring time constant
episode_tau = 18;

% The frequency of acquisition
f_Acqui = 20000; % Hz

% Data source: 1 = Multi1, 2 = Multi2(Liwen), 3 = V_m_scaled(Jean), 4 = Merie/Louis_ch0, 5 =
% Merie/Louis_ch1, 6 = CC5/CC6, 7= only Merie_ch1
source = 4; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Defining initial and end points
% Period of Time for baseline membrane potential % units: s
t_baseline_initial = 0.001; % Louis
t_baseline_end = 0.1;

%t_baseline_initial = 0.001; % Jean
%t_baseline_end = 0.1;          
                                        
%t_baseline_initial = 1;
%t_baseline_end = 2;

%t_baseline_initial = 0.5;
%t_baseline_end = 1;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Period of Time for sag ratio

%t_min_initial = 2.08;% DF
%t_min_end = 2.5;

%t_min_initial = 1.23;% MERIE
%t_min_end = 1.35;

%t_min_initial = 2.23;% MERIE
%t_min_end = 2.28;

%t_min_initial = 3.26;% MERIE
%t_min_end = 3.4;

%t_min_initial = 2.15;% LIWEN
%t_min_end = 2.2;

%t_min_initial = 0.135;% JEAN
%t_min_end = 0.4;

%t_min_initial = 0.117;% JEAN Rat's
%t_min_end = 0.2;

%t_min_initial = 0.1315;% JEAN Rat's
%t_min_end = 0.4;

%t_min_initial = 0.679;% Louis
%t_min_end = 1.079;

t_min_initial = 0.532;% Louis
t_min_end = 0.932;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Period of Time for the output voltage, i.e. second half of the rapid steps 

%t_step_initial = 2.5;% DF
%t_step_end = 2.87;

%t_step_initial = 2.6;% MERIE
%t_step_end = 3;

%t_step_initial = 1.8;% MERIE
%t_step_end = 2.02;

%t_step_initial = 3.6;% MERIE
%t_step_end = 4;

%t_step_initial = 2.4;% LIWEN
%t_step_end = 2.8;

%t_step_initial = 0.5;% JEAN
%t_step_end = 0.9;

%t_step_initial = 1.079; % Louis
%t_step_end = 1.478;

t_step_initial = 0.932; % Louis
t_step_end = 1.33;

%t_step_initial =  1.2 ; % Louis adapted for spont activity
%t_step_end = 1.275;

% Interval of response (Units:s)

%t_response_initial = 2.08; % DF 
%t_response_end = 2.88;

%t_response_initial = 1.23; % MERIE 
%t_response_end = 2.02;

%t_response_initial = 2.23; % MERIE 
%t_response_end = 3.1;

%t_response_initial = 3.245; % MERIE 
%t_response_end = 4.2;

%t_response_initial = 2.08;% LIWEN
%t_response_end = 3;

%t_response_initial = 0.135;% JEAN
%t_response_end = 1;

%t_response_initial = 0.117;% JEAN Rat's
%t_response_end = 1;

%t_response_initial = 0.1315;% JEAN Rat's
%t_response_end = 1;

t_response_initial = 0.532;% Louis
t_response_end = 1.35;

%t_response_initial = 0.679;% Louis
%t_response_end = 1.478;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Duration for frequency estimation, i.e. stimulation duration (Units: s)
delta_t_stimul = 0.8; 

% accelerate rate for Spike selection 
delta_spike = 10; % Units: mV  *10 = rate (V/s)

% Threshold for the beginning of a spike (Units: V/s)
threshold = 35;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Defining matrices of [nb_episode x length(T)] for V and I
T = c001_Time;
V = zeros(length(T),nb_episode); % V
I = zeros(length(T),nb_episode); % A

% Importing
if source == 1
   for k = 1:nb_episode;
       if k+1 < 10
          V(:,k) = eval(['c00', num2str(k+1),'_Multi1Pri'])';
       elseif k+1 >= 10 && k+1 < 100;
          V(:,k) = eval(['c0', num2str(k+1), '_Multi1Pri'])';            
       else V(:,k) = eval(['c', num2str(k+1), '_Multi1Pri'])';    
       end
   end
   for k = 1:nb_episode;
       if  nb_episode+k+1 < 10
           I(:,k) = eval(['c00', num2str(nb_episode+k+1),'_Multi1Sec'])';   
       elseif  nb_episode+k+1 >= 10 && nb_episode+k+1 < 100;
            I(:,k) = eval(['c0', num2str(nb_episode+k+1), '_Multi1Sec'])';
       else I(:,k) = eval(['c', num2str(nb_episode+k+1), '_Multi1Sec'])';       
       end
   end
  
end
   
if source == 2
   for k = 1:nb_episode;
       if k+1 < 10
          V(:,k) = eval(['c00', num2str(k+1),'_Multi2Pri'])';
       elseif k+1 >= 10 && k+1 < 100;
          V(:,k) = eval(['c0', num2str(k+1), '_Multi2Pri'])';     
       else V(:,k) = eval(['c', num2str(k+1), '_Multi2Pri'])';
       end
   end
   for k = 1:nb_episode;
       if  nb_episode+k+1 < 10
           I(:,k) = eval(['c00', num2str(nb_episode+k+1),'_Multi2Sec'])';
       elseif  nb_episode+k+1 >= 10 && nb_episode+k+1 < 100;
           I(:,k) = eval(['c0', num2str(nb_episode+k+1), '_Multi2Sec'])';
       else I(:,k) = eval(['c', num2str(nb_episode+k+1), '_Multi2Sec'])';
       end
   end
end

if source == 3
   for k = 1:nb_episode;
       if k+1 < 10
          V(:,k) = eval(['c00', num2str(k+1),'_Vm_scaled'])';    
       elseif k+1 >= 10 && k+1 < 100;    
          V(:,k) = eval(['c0', num2str(k+1), '_Vm_scaled'])';
       else V(:,k) = eval(['c', num2str(k+1), '_Vm_scaled'])';
       end
    end
   for k = 1:nb_episode;
       if  nb_episode+k+1 < 10
        I(:,k) = eval(['c00', num2str(nb_episode+k+1),'_I_output'])';
       elseif  nb_episode+k+1 >= 10 && nb_episode+k+1 < 100;
        I(:,k) = eval(['c0', num2str(nb_episode+k+1), '_I_output'])';
       else I(:,k) = eval(['c', num2str(nb_episode+k+1), '_I_output'])';
       end
    end
end

if source == 4
   for k = 1:nb_episode;
       if k+1 < 10
          V(:,k) = eval(['c00', num2str(k+1), '_IN_0'])'; 
       elseif k+1 >= 10 && k+1 < 100;
          V(:,k) = eval(['c0', num2str(k+1), '_IN_0'])';   
       else V(:,k) = eval(['c', num2str(k+1), '_IN_0'])';
       end
   end
   for k = 1:nb_episode;
       if  nb_episode+k+1 < 10
           I(:,k) = eval(['c00', num2str(nb_episode+k+1),'_IN_1'])';   
       elseif  nb_episode+k+1 >= 10 && nb_episode+k+1 < 100;
           I(:,k) = eval(['c0', num2str(nb_episode+k+1), '_IN_1'])';       
       else I(:,k) = eval(['c', num2str(nb_episode+k+1), '_IN_1'])'; 
       end 
   end
end

if source == 5
   for k = 1:nb_episode;
       if 2*nb_episode+k+1 < 10
          V(:,k) = eval(['c00', num2str(2*nb_episode+k+1), '_IN_2'])';
       elseif 2*nb_episode+k+1 >= 10 && 2*nb_episode+k+1 < 100;
          V(:,k) = eval(['c0', num2str(2*nb_episode+k+1), '_IN_2'])';   
       else V(:,k) = eval(['c', num2str(2*nb_episode+k+1), '_IN_2'])';       
       end
   end
   for k = 1:nb_episode;
       if 3*nb_episode+k+1 < 10
          I(:,k) = eval(['c00', num2str(3*nb_episode+k+1), '_IN_3'])';
       elseif 3*nb_episode+k+1 >= 10 && 3*nb_episode+k+1 < 100;
          I(:,k) = eval(['c0', num2str(3*nb_episode+k+1), '_IN_3'])';      
       else I(:,k) = eval(['c', num2str(3*nb_episode+k+1), '_IN_3'])';
       end
   end   
end

if source == 6
   for k = 1:nb_episode;
       if  2*nb_episode+k+1 < 10
           I(:,k) = eval(['c00', num2str(2*nb_episode+k+1),'_I_CC5'])';
       elseif  2*nb_episode+k+1 >= 10 && 2*nb_episode+k+1 < 100;
           I(:,k) = eval(['c0', num2str(2*nb_episode+k+1), '_I_CC5'])';    
       else I(:,k) = eval(['c', num2str(2*nb_episode+k+1), '_I_CC5'])';  
       end
   end
   for k = 1:nb_episode;
       if 3*nb_episode+k+1 < 10
          V(:,k) = eval(['c00', num2str(3*nb_episode+k+1),'_V_CC6'])';
       elseif 3*nb_episode+k+1 >= 10 && 3*nb_episode+k+1 < 100;
          V(:,k) = eval(['c0', num2str(3*nb_episode+k+1), '_V_CC6'])';     
       else V(:,k) = eval(['c', num2str(3*nb_episode+k+1), '_V_CC6'])';
       end
   end
end



if source == 7
   for k = 1:nb_episode;
       if k+1 < 10
          V(:,k) = eval(['c00', num2str(k+1), '_IN_2'])';
       elseif k+1 >= 10 && k+1 < 100;
          V(:,k) = eval(['c0', num2str(k+1), '_IN_2'])';   
       else V(:,k) = eval(['c', num2str(k+1), '_IN_2'])';       
       end
   end
   for k = 1:nb_episode;
       if nb_episode+k+1 < 10
          I(:,k) = eval(['c00', num2str(nb_episode+k+1), '_IN_3'])';
       elseif nb_episode+k+1 >= 10 && nb_episode+k+1 < 100;
          I(:,k) = eval(['c0', num2str(nb_episode+k+1), '_IN_3'])';      
       else I(:,k) = eval(['c', num2str(nb_episode+k+1), '_IN_3'])';
       end
   end   
end


%% I-V CURVE 

% Baseline
           
V_baseline = mean(V((t_baseline_initial*f_Acqui):(t_baseline_end*f_Acqui),:)*1e3); % Units: mV ; % Measuring the average baseline potential of every episode  

delta_V_baseline = V_baseline - (-65); % Measuring the baseline deviation to -65mV of every episode  

I_baseline = mean(I((t_baseline_initial*f_Acqui):(t_baseline_end*f_Acqui),:)*1e12); % Units: pA ; % Measuring the average baseline current of every episode  

% Calculating the mean current/potential during rapid steps

I_mean = mean(I((t_step_initial*f_Acqui):(t_step_end*f_Acqui),:)*1e12);  % Units: pA
       
V_mean = mean(V((t_step_initial*f_Acqui):(t_step_end*f_Acqui),:)*1e3) - delta_V_baseline;  % Units: mV

% Calculating current input relative to holding current (for input-output curve)

delta_I = I_mean - I_baseline;



%% Sag ratio

V_min = zeros(1, nb_episode);

% Find the minimun of voltage

for k = 1:nb_episode
    
    V_min(k) = abs(min(V((t_min_initial*f_Acqui):(t_min_end*f_Acqui), k))*1e3 - V_baseline(k)); % Units: mV
    
end

% Calculating the Ih ratio

Ratio_Ih = zeros(1, nb_episode);

for k = 1:nb_episode
    
    %Ratio_Ih(k) = V_min(k)./ abs(V_mean(k)-V_baseline(k));
    Ratio_Ih(k) = V_min(k)./ abs(V_mean(k)+delta_V_baseline(k)-V_baseline(k));
    
end

%% Spike detection

delta_V = diff( V (t_response_initial*f_Acqui: 5: t_response_end*f_Acqui, :))*1e3; % Units: mV
nb_spike = zeros(1,nb_episode);

for k = 1:nb_episode
     
    clear index_spike
    
    index_spike = find(delta_V(:,k) > delta_spike);
    
  if isempty( index_spike ) ~= 1
    
     nb_spike(k)= nb_spike(k)+1; % If something in index, it means at least one spike exists.
     
  end
     
  for j = 1: length( index_spike )-1;
              
      if index_spike (j+1) - index_spike(j) > 1
         
         nb_spike(k)= nb_spike(k)+1; % Switch to another spike, count one more
      
      else
          
         nb_spike(k)= nb_spike(k); % Still at the same spike, then don't count
         
      end   
  end 
end
