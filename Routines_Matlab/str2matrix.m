% Type in your data names first 

cell_name_MEC = [15401024 15401031 15401508 15401513 15401517 15401521 15401525 15420020 15513027 15513037 15519005 15519023 15527008 15529003 15529019]; % N = 15

%cell_name_Layer3 = [15225009 15226013 15316014 15318026 15409023 15409029 15409038 15302521 15303519 15303540 15303559 15303560 15303581 15310552 15310553 15310580 15313503 15313547 15316532];

cell_name_LMN = [121010009 121010033 121122016 121122037 121127005 121127017 121206008 121206054 13109024 13116006 13411012 13411037 13411049 13411079 15430012 15430019 15430027 15430032]; % N = 18

cell_name_ADN = [121218008 121218015 121218016 121218026 13115005 13115042 14220008 14220023 14220028 14220041 14220046]; % N = 11


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
RMP_MEC = zeros(1, length(cell_name_MEC));
Resistance_MEC = zeros(1, length(cell_name_MEC));
Tau_MEC = zeros(1, length(cell_name_MEC));
Sag_Ratio_MEC = zeros(1, length(cell_name_MEC));
Rheobase_Current_MEC = zeros(1, length(cell_name_MEC));
Firing_Rate_200pA_MEC = zeros(1, length(cell_name_MEC));
Maximum_Firing_Frequency_MEC = zeros(1, length(cell_name_MEC));
Input_Output_Slope_MEC = zeros(1, length(cell_name_MEC));
Bursting_Index_MEC = zeros(1, length(cell_name_MEC));

Adaptation_Ratio_MEC = zeros(1, length(cell_name_MEC));
Fast_Doublet_Ratio_MEC = zeros(1, length(cell_name_MEC));
Adaptation_Index_MEC = zeros(1, length(cell_name_MEC));
Fast_Doublet_Index_MEC = zeros(1, length(cell_name_MEC));

AP_Threshold_MEC = zeros(1, length(cell_name_MEC));
AP_Width_MEC = zeros(1, length(cell_name_MEC));
AP_AHP_MEC = zeros(1, length(cell_name_MEC));
AP_Amplitude_MEC = zeros(1, length(cell_name_MEC));
AP_Maxi_Depol_Rate_MEC = zeros(1, length(cell_name_MEC));
AP_Maxi_Repol_Rate_MEC = zeros(1, length(cell_name_MEC));

Latency_onset_MEC = zeros(1, length(cell_name_MEC));

for k = 1: length(cell_name_MEC)
    
    RMP_MEC(k) = eval(['MEC_', num2str(cell_name_MEC(k)), '.RMP']);
    Resistance_MEC(k) = eval(['MEC_', num2str(cell_name_MEC(k)), '.Resistance']);
    Tau_MEC(k) = eval(['MEC_', num2str(cell_name_MEC(k)), '.Tau']);
    Sag_Ratio_MEC(k) = eval(['MEC_', num2str(cell_name_MEC(k)), '.Sag_Ratio']);
    Rheobase_Current_MEC(k)  = eval(['MEC_', num2str(cell_name_MEC(k)), '.Rheobase_Current']);
    Firing_Rate_200pA_MEC(k) = eval(['MEC_', num2str(cell_name_MEC(k)), '.Firing_Rate_200pA']);
    Maximum_Firing_Frequency_MEC(k) = eval(['MEC_', num2str(cell_name_MEC(k)), '.Maximum_Firing_Frequency']);
    Input_Output_Slope_MEC(k) = eval(['MEC_', num2str(cell_name_MEC(k)), '.Input_Output_Slope']);
    
    Bursting_Index_MEC(k) = eval(['MEC_', num2str(cell_name_MEC(k)), '.Bursting_Index']);
    Adaptation_Ratio_MEC(k) = eval(['MEC_', num2str(cell_name_MEC(k)), '.Adaptation_Ratio']);
    Fast_Doublet_Ratio_MEC(k) = eval(['MEC_', num2str(cell_name_MEC(k)), '.Fast_Doublet_Index']);
    Adaptation_Index_MEC(k) = eval(['MEC_', num2str(cell_name_MEC(k)), '.Adaptation_Index']);
    Fast_Doublet_Index_MEC(k) = eval(['MEC_', num2str(cell_name_MEC(k)), '.Fast_Doublet_Index']);

    AP_Threshold_MEC(k) = eval(['MEC_', num2str(cell_name_MEC(k)), '.AP_threshold']);
    AP_Width_MEC(k) = eval(['MEC_', num2str(cell_name_MEC(k)), '.AP_Width']);
    AP_AHP_MEC(k) = eval(['MEC_', num2str(cell_name_MEC(k)), '.AP_AHP']);
    AP_Amplitude_MEC(k) = eval(['MEC_', num2str(cell_name_MEC(k)), '.AP_Amplitude']);
    AP_Maxi_Depol_Rate_MEC(k) = eval(['MEC_', num2str(cell_name_MEC(k)), '.AP_Maxi_Depol_Rate']);
    AP_Maxi_Repol_Rate_MEC(k) = eval(['MEC_', num2str(cell_name_MEC(k)), '.AP_Maxi_Repol_Rate']);
    
    Latency_onset_MEC (k) = eval(['MEC_', num2str(cell_name_MEC(k)), '.Latency_onset']);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

RMP_LMN = zeros(1, length(cell_name_LMN));
Resistance_LMN = zeros(1, length(cell_name_LMN));
Tau_LMN = zeros(1, length(cell_name_LMN));
Sag_Ratio_LMN = zeros(1, length(cell_name_LMN));
Rheobase_Current_LMN = zeros(1, length(cell_name_LMN));
Firing_Rate_200pA_LMN = zeros(1, length(cell_name_LMN));
Maximum_Firing_Frequency_LMN = zeros(1, length(cell_name_LMN));
Input_Output_Slope_LMN = zeros(1, length(cell_name_LMN));

Bursting_Index_LMN = zeros(1, length(cell_name_LMN));
Adaptation_Ratio_LMN = zeros(1, length(cell_name_LMN));
Fast_Doublet_Ratio_LMN = zeros(1, length(cell_name_LMN));
Adaptation_Index_LMN = zeros(1, length(cell_name_LMN));
Fast_Doublet_Index_LMN = zeros(1, length(cell_name_LMN));

AP_Threshold_LMN = zeros(1, length(cell_name_LMN));
AP_Width_LMN = zeros(1, length(cell_name_LMN));
AP_AHP_LMN = zeros(1, length(cell_name_LMN));
AP_Amplitude_LMN = zeros(1, length(cell_name_LMN));
AP_Maxi_Depol_Rate_LMN = zeros(1, length(cell_name_LMN));
AP_Maxi_Repol_Rate_LMN = zeros(1, length(cell_name_LMN));

Latency_onset_LMN = zeros(1, length(cell_name_LMN)); 

for k = 1: length(cell_name_LMN)
    
    RMP_LMN(k) = eval(['LMN_', num2str(cell_name_LMN(k)), '.RMP']);
    Resistance_LMN(k) = eval(['LMN_', num2str(cell_name_LMN(k)), '.Resistance']);
    Tau_LMN(k) = eval(['LMN_', num2str(cell_name_LMN(k)), '.Tau']);
    Sag_Ratio_LMN(k) = eval(['LMN_', num2str(cell_name_LMN(k)), '.Sag_Ratio']);
    Rheobase_Current_LMN(k)  = eval(['LMN_', num2str(cell_name_LMN(k)), '.Rheobase_Current']);
    Firing_Rate_200pA_LMN(k) = eval(['LMN_', num2str(cell_name_LMN(k)), '.Firing_Rate_200pA']);
    Maximum_Firing_Frequency_LMN(k) = eval(['LMN_', num2str(cell_name_LMN(k)), '.Maximum_Firing_Frequency']);
    Input_Output_Slope_LMN(k) = eval(['LMN_', num2str(cell_name_LMN(k)), '.Input_Output_Slope']);
    
    %Bursting_Index_LMN(k) = eval(['LMN_', num2str(cell_name_LMN(k)), '.Bursting_Index']);
    %Adaptation_Ratio_LMN(k) = eval(['LMN_', num2str(cell_name_LMN(k)), '.Adaptation_Ratio']);
    %Fast_Doublet_Ratio_LMN(k) = eval(['LMN_', num2str(cell_name_LMN(k)), '.Fast_Doublet_Index']);
    %Adaptation_Index_LMN(k) = eval(['LMN_', num2str(cell_name_LMN(k)), '.Adaptation_Index']);
    %Fast_Doublet_Index_LMN(k) = eval(['LMN_', num2str(cell_name_LMN(k)), '.Fast_Doublet_Index']);

    AP_Threshold_LMN(k) = eval(['LMN_', num2str(cell_name_LMN(k)), '.AP_threshold']);
    AP_Width_LMN(k) = eval(['LMN_', num2str(cell_name_LMN(k)), '.AP_Width']);
    AP_AHP_LMN(k) = eval(['LMN_', num2str(cell_name_LMN(k)), '.AP_AHP']);
    AP_Amplitude_LMN(k) = eval(['LMN_', num2str(cell_name_LMN(k)), '.AP_Amplitude']);
    AP_Maxi_Depol_Rate_LMN(k) = eval(['LMN_', num2str(cell_name_LMN(k)), '.AP_Maxi_Depol_Rate']);
    AP_Maxi_Repol_Rate_LMN(k) = eval(['LMN_', num2str(cell_name_LMN(k)), '.AP_Maxi_Repol_Rate']);
    
    Latency_onset_LMN (k) = eval(['LMN_', num2str(cell_name_LMN(k)), '.Latency_onset']);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


RMP_ADN = zeros(1, length(cell_name_ADN));
Resistance_ADN = zeros(1, length(cell_name_ADN));
Tau_ADN = zeros(1, length(cell_name_ADN));
Sag_Ratio_ADN = zeros(1, length(cell_name_ADN));
Rheobase_Current_ADN = zeros(1, length(cell_name_ADN));
Firing_Rate_200pA_ADN = zeros(1, length(cell_name_ADN));
Maximum_Firing_Frequency_ADN = zeros(1, length(cell_name_ADN));
Input_Output_Slope_ADN = zeros(1, length(cell_name_ADN));

Bursting_Index_ADN = zeros(1, length(cell_name_ADN));
Adaptation_Ratio_ADN = zeros(1, length(cell_name_ADN));
Fast_Doublet_Ratio_ADN = zeros(1, length(cell_name_ADN));
Adaptation_Index_ADN = zeros(1, length(cell_name_ADN));
Fast_Doublet_Index_ADN = zeros(1, length(cell_name_ADN));

AP_Threshold_ADN = zeros(1, length(cell_name_ADN));
AP_Width_ADN = zeros(1, length(cell_name_ADN));
AP_AHP_ADN = zeros(1, length(cell_name_ADN));
AP_Amplitude_ADN = zeros(1, length(cell_name_ADN));
AP_Maxi_Depol_Rate_ADN = zeros(1, length(cell_name_ADN));
AP_Maxi_Repol_Rate_ADN = zeros(1, length(cell_name_ADN));

Latency_onset_ADN = zeros(1, length(cell_name_ADN)); 

for k = 1: length(cell_name_ADN)
    
    RMP_ADN(k) = eval(['ADN_', num2str(cell_name_ADN(k)), '.RMP']);
    Resistance_ADN(k) = eval(['ADN_', num2str(cell_name_ADN(k)), '.Resistance']);
    Tau_ADN(k) = eval(['ADN_', num2str(cell_name_ADN(k)), '.Tau']);
    Sag_Ratio_ADN(k) = eval(['ADN_', num2str(cell_name_ADN(k)), '.Sag_Ratio']);
    Rheobase_Current_ADN(k)  = eval(['ADN_', num2str(cell_name_ADN(k)), '.Rheobase_Current']);
    Firing_Rate_200pA_ADN(k) = eval(['ADN_', num2str(cell_name_ADN(k)), '.Firing_Rate_200pA']);
    Maximum_Firing_Frequency_ADN(k) = eval(['ADN_', num2str(cell_name_ADN(k)), '.Maximum_Firing_Frequency']);
    Input_Output_Slope_ADN(k) = eval(['ADN_', num2str(cell_name_ADN(k)), '.Input_Output_Slope']);
    
    Bursting_Index_ADN(k) = eval(['ADN_', num2str(cell_name_ADN(k)), '.Bursting_Index']);
    Adaptation_Ratio_ADN(k) = eval(['ADN_', num2str(cell_name_ADN(k)), '.Adaptation_Ratio']);
    Fast_Doublet_Ratio_ADN(k) = eval(['ADN_', num2str(cell_name_ADN(k)), '.Fast_Doublet_Index']);
    Adaptation_Index_ADN(k) = eval(['ADN_', num2str(cell_name_ADN(k)), '.Adaptation_Index']);
    Fast_Doublet_Index_ADN(k) = eval(['ADN_', num2str(cell_name_ADN(k)), '.Fast_Doublet_Index']);

    AP_Threshold_ADN(k) = eval(['ADN_', num2str(cell_name_ADN(k)), '.AP_threshold']);
    AP_Width_ADN(k) = eval(['ADN_', num2str(cell_name_ADN(k)), '.AP_Width']);
    AP_AHP_ADN(k) = eval(['ADN_', num2str(cell_name_ADN(k)), '.AP_AHP']);
    AP_Amplitude_ADN(k) = eval(['ADN_', num2str(cell_name_ADN(k)), '.AP_Amplitude']);
    AP_Maxi_Depol_Rate_ADN(k) = eval(['ADN_', num2str(cell_name_ADN(k)), '.AP_Maxi_Depol_Rate']);
    AP_Maxi_Repol_Rate_ADN(k) = eval(['ADN_', num2str(cell_name_ADN(k)), '.AP_Maxi_Repol_Rate']);
    
    Latency_onset_ADN (k) = eval(['ADN_', num2str(cell_name_ADN(k)), '.Latency_onset']);
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%RMP_Layer3 = zeros(1, length(cell_name_Layer3));
%Resistance_Layer3 = zeros(1, length(cell_name_Layer3));
%Tau_Layer3 = zeros(1, length(cell_name_Layer3));
%Sag_Ratio_Layer3 = zeros(1, length(cell_name_Layer3));
%Rheobase_Current_Layer3 = zeros(1, length(cell_name_Layer3));
%Firing_Rate_200pA_Layer3 = zeros(1, length(cell_name_Layer3));
%Maximum_Firing_Frequency_Layer3 = zeros(1, length(cell_name_Layer3));
%Input_Output_Slope_Layer3 = zeros(1, length(cell_name_Layer3));

%Bursting_Index_Layer3 = zeros(1, length(cell_name_Layer3));
%Adaptation_Ratio_Layer3 = zeros(1, length(cell_name_Layer3));
%Fast_Doublet_Ratio_Layer3 = zeros(1, length(cell_name_Layer3));
%Adaptation_Index_Layer3 = zeros(1, length(cell_name_Layer3));
%Fast_Doublet_Index_Layer3 = zeros(1, length(cell_name_Layer3));

%AP_Threshold_Layer3 = zeros(1, length(cell_name_Layer3));
%AP_Width_Layer3 = zeros(1, length(cell_name_Layer3));
%AP_AHP_Layer3 = zeros(1, length(cell_name_Layer3));
%AP_Amplitude_Layer3 = zeros(1, length(cell_name_Layer3));
%AP_Maxi_Depol_Rate_Layer3 = zeros(1, length(cell_name_Layer3));
%AP_Maxi_Repol_Rate_Layer3 = zeros(1, length(cell_name_Layer3));

%for k = 1: length(cell_name_Layer3)
    
    %RMP_Layer3(k) = eval(['Layer3_', num2str(cell_name_Layer3(k)), '.RMP']);
    %Resistance_Layer3(k) = eval(['Layer3_', num2str(cell_name_Layer3(k)), '.Resistance']);
    %Tau_Layer3(k) = eval(['Layer3_', num2str(cell_name_Layer3(k)), '.Tau']);
    %Sag_Ratio_Layer3(k) = eval(['Layer3_', num2str(cell_name_Layer3(k)), '.Sag_Ratio']);
    %Rheobase_Current_Layer3(k)  = eval(['Layer3_', num2str(cell_name_Layer3(k)), '.Rheobase_Current']);
    %Firing_Rate_200pA_Layer3(k) = eval(['Layer3_', num2str(cell_name_Layer3(k)), '.Firing_Rate_200pA']);
    %Maximum_Firing_Frequency_Layer3(k) = eval(['Layer3_', num2str(cell_name_Layer3(k)), '.Maximum_Firing_Frequency']);
    %Input_Output_Slope_Layer3(k) = eval(['Layer3_', num2str(cell_name_Layer3(k)), '.Input_Output_Slope']);
    
    %Bursting_Index_Layer3(k) = eval(['Layer3_', num2str(cell_name_Layer3(k)), '.Bursting_Index']);
    %Adaptation_Ratio_Layer3(k) = eval(['Layer3_', num2str(cell_name_Layer3(k)), '.Adaptation_Ratio']);
    %Fast_Doublet_Ratio_Layer3(k) = eval(['Layer3_', num2str(cell_name_Layer3(k)), '.Fast_Doublet_Index']);
    %Adaptation_Index_Layer3(k) = eval(['Layer3_', num2str(cell_name_Layer3(k)), '.Adaptation_Index']);
    %Fast_Doublet_Index_Layer3(k) = eval(['Layer3_', num2str(cell_name_Layer3(k)), '.Fast_Doublet_Index']);

    %AP_Threshold_Layer3(k) = eval(['Layer3_', num2str(cell_name_Layer3(k)), '.AP_threshold']);
    %AP_Width_Layer3(k) = eval(['Layer3_', num2str(cell_name_Layer3(k)), '.AP_Width']);
    %AP_AHP_Layer3(k) = eval(['Layer3_', num2str(cell_name_Layer3(k)), '.AP_AHP']);
    %AP_Amplitude_Layer3(k) = eval(['Layer3_', num2str(cell_name_Layer3(k)), '.AP_Amplitude']);
    %AP_Maxi_Depol_Rate_Layer3(k) = eval(['Layer3_', num2str(cell_name_Layer3(k)), '.AP_Maxi_Depol_Rate']);
    %AP_Maxi_Repol_Rate_Layer3(k) = eval(['Layer3_', num2str(cell_name_Layer3(k)), '.AP_Maxi_Repol_Rate']);
    
%end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Li-Wen's Master thesis FINAL 14 parameters!

%cell_matrix_Layer3 = [RMP_Layer3; Resistance_Layer3; Tau_Layer3; Sag_Ratio_Layer3; Rheobase_Current_Layer3; Firing_Rate_200pA_Layer3; 
    %Input_Output_Slope_Layer3;  Adaptation_Ratio_Layer3; Fast_Doublet_Ratio_Layer3;
    %AP_Width_Layer3 ;AP_AHP_Layer3; AP_Amplitude_Layer3; AP_Maxi_Depol_Rate_Layer3; AP_Maxi_Repol_Rate_Layer3]

%cell_matrix_MEC = [RMP_MEC; Resistance_MEC; Tau_MEC; Sag_Ratio_MEC; Rheobase_Current_MEC; Firing_Rate_200pA_MEC;
   %Input_Output_Slope_MEC;  Adaptation_Ratio_MEC;
    %Fast_Doublet_Ratio_MEC; AP_Width_MEC; AP_AHP_MEC;AP_Amplitude_MEC;
    %AP_Maxi_Depol_Rate_MEC; AP_Maxi_Repol_Rate_MEC; Latency_onset_MEC]

%cell_matrix_LMN = [RMP_LMN; Resistance_LMN; Tau_LMN; Sag_Ratio_LMN; Rheobase_Current_LMN; Firing_Rate_200pA_LMN;
    %Input_Output_Slope_LMN;  Adaptation_Ratio_LMN; Fast_Doublet_Ratio_LMN;
    %AP_Width_LMN; AP_AHP_LMN; AP_Amplitude_LMN; AP_Maxi_Depol_Rate_LMN;
    %AP_Maxi_Repol_Rate_LMN; Latency_onset_LMN]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Projection paper FINAL 14 parameters!

cell_matrix_MEC = [RMP_MEC; Resistance_MEC; Tau_MEC; Sag_Ratio_MEC;Rheobase_Current_MEC; Firing_Rate_200pA_MEC;
   Input_Output_Slope_MEC;AP_Threshold_MEC; AP_Width_MEC; AP_AHP_MEC;AP_Amplitude_MEC; AP_Maxi_Depol_Rate_MEC; AP_Maxi_Repol_Rate_MEC; Latency_onset_MEC]

cell_matrix_LMN = [RMP_LMN; Resistance_LMN; Tau_LMN; Sag_Ratio_LMN; Rheobase_Current_LMN;  Firing_Rate_200pA_LMN;
    Input_Output_Slope_LMN;AP_Threshold_LMN; AP_Width_LMN; AP_AHP_LMN; AP_Amplitude_LMN; AP_Maxi_Depol_Rate_LMN; AP_Maxi_Repol_Rate_LMN; Latency_onset_LMN]

cell_matrix_ADN = [RMP_ADN; Resistance_ADN; Tau_ADN; Sag_Ratio_ADN; Rheobase_Current_ADN;  Firing_Rate_200pA_ADN;
    Input_Output_Slope_ADN;AP_Threshold_ADN; AP_Width_ADN; AP_AHP_ADN; AP_Amplitude_ADN; AP_Maxi_Depol_Rate_ADN; AP_Maxi_Repol_Rate_ADN; Latency_onset_ADN]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Projection paper FINAL 12 parameters!

cell_matrix_MEC = [RMP_MEC; Resistance_MEC; Tau_MEC; Sag_Ratio_MEC;Rheobase_Current_MEC; Firing_Rate_200pA_MEC;
   Input_Output_Slope_MEC;AP_Threshold_MEC;AP_Width_MEC; AP_AHP_MEC;AP_Amplitude_MEC;Latency_onset_MEC]

cell_matrix_LMN = [RMP_LMN; Resistance_LMN; Tau_LMN; Sag_Ratio_LMN; Rheobase_Current_LMN; Firing_Rate_200pA_LMN;
    Input_Output_Slope_LMN;AP_Threshold_LMN; AP_Width_LMN;AP_AHP_LMN; AP_Amplitude_LMN; Latency_onset_LMN]

cell_matrix_ADN = [RMP_ADN; Resistance_ADN; Tau_ADN; Sag_Ratio_ADN; Rheobase_Current_ADN; Firing_Rate_200pA_ADN;
    Input_Output_Slope_ADN;AP_Threshold_ADN; AP_Width_ADN;AP_AHP_ADN;AP_Amplitude_ADN; Latency_onset_ADN]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Projection paper FINAL 9 parameters! (loadings > 0.35)

cell_matrix_MEC = [Resistance_MEC; Tau_MEC; Firing_Rate_200pA_MEC;
   Input_Output_Slope_MEC;AP_Threshold_MEC; AP_Width_MEC; AP_AHP_MEC;AP_Amplitude_MEC; Latency_onset_MEC]

cell_matrix_LMN = [Resistance_LMN; Tau_LMN; Firing_Rate_200pA_LMN;
    Input_Output_Slope_LMN;AP_Threshold_LMN; AP_Width_LMN; AP_AHP_LMN; AP_Amplitude_LMN; Latency_onset_LMN]

cell_matrix_ADN = [Resistance_ADN; Tau_ADN; Firing_Rate_200pA_ADN;
    Input_Output_Slope_ADN;AP_Threshold_ADN; AP_Width_ADN; AP_AHP_ADN; AP_Amplitude_ADN; Latency_onset_ADN]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Projection paper FINAL 5 parameters!(loadings > 0.4)

cell_matrix_MEC = [Resistance_MEC;  Firing_Rate_200pA_MEC; Input_Output_Slope_MEC; AP_Width_MEC; AP_Amplitude_MEC]

cell_matrix_LMN = [Resistance_LMN;  Firing_Rate_200pA_LMN; Input_Output_Slope_LMN; AP_Width_LMN; AP_Amplitude_LMN]

cell_matrix_ADN = [Resistance_ADN;  Firing_Rate_200pA_ADN; Input_Output_Slope_ADN; AP_Width_ADN; AP_Amplitude_ADN]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Total_cell_name = [cell_name_MEC cell_name_LMN cell_name_ADN]
Total_cell = [cell_matrix_MEC cell_matrix_LMN cell_matrix_ADN]
