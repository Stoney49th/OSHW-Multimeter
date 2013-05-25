%% Init the workspace variables and parameters
function Init_Awesomeslope()

assignin('base','C_int',470e-12);

assignin('base','R_pos',8000);
assignin('base','R_neg',8000);
assignin('base','R_mes_high',5000);
assignin('base','R_mes_low',500);

assignin('base','V_int_min',-12);
assignin('base','V_int_max', 12);

assignin('base','V_th_pos',5);
assignin('base','V_th_neg',-5);

%Make the pattern such that we can fit 3 ADC samples in the smallest
%pattern part (10% of the pattern)
assignin('base','t_pattern',(3*625e-9)*10);
assignin('base','meas_period',0.0025);

assignin('base','SimTime_Max',0.0025*31);

assignin('base','FPGA_Output_Freq',80000000);

%% Open the model
open('OSHW_Multimeter_System.slx')
end