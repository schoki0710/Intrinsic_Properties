% Saving data to a structure

f1 = 'RMP';
f2 = 'Resistance';
f3 = 'Tau';
f4 = 'Sag_Ratio';
f5 = 'Rheobase_Current';
f6 = 'Firing_Rate_200pA';
f7 = 'Maximum_Firing_Frequency';
f8 = 'Input_Output_Slope';

f9 = 'Bursting_Index';
f10 = 'Adaptation_Ratio';
f11 = 'Fast_Doublet_Ratio';
f12 = 'Adaptation_Index';
f13 = 'Fast_Doublet_Index';

f14 = 'AP_threshold';
f15 = 'AP_Width';
f16 = 'AP_AHP';
f17 = 'AP_Amplitude';
f18 = 'AP_Maxi_Depol_Rate';
f19 = 'AP_Maxi_Repol_Rate';

f20 = 'Latency_onset';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

v1 = RMP;
v2 = slope_iv;
v3 = tau1;
v4 = Ih_100;
v5 = I_rheobase;
v6 = f_200_pA;
v7 = f_max;
v8 = slope_io;

%v9 = NaN;
%v10  = NaN;
%v11 = NaN;
%v12 = NaN;
%v13 = NaN;

v9 = Bursting_index;
v10 = Adaptation_ratio; 
v11 = Fast_doublet_ratio;
v12 = Adaptation_index;
v13 = Fast_doublet_index;

v14 = V_threshold;
v15 = AP_Width;
v16 = AP_AHP;
v17 = AP_Amplitude;
v18 = Maxi_depol_rate;
v19 = Maxi_repol_rate;

v20 = Latency_onset;

Mouse_18607042 = struct(f1, v1, f2, v2, f3, v3, f4, v4,f5, v5, f6, v6,f7, v7, f8, v8,f9, v9, f10, v10, f11, v11, f12, v12,f13, v13, f14, v14, f15, v15, f16, v16, f17, v17, f18, v18, f19, v19, f20, v20);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

