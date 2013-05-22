%% Init the workspace variables and parameters
function Init_Awesomeslope()

assignin('base','C_int',0.000000000550);

assignin('base','R_pos',8000);
assignin('base','R_neg',8000);
assignin('base','R_mes_high',5000);
assignin('base','R_mes_low',500);

assignin('base','V_int_min',-11);
assignin('base','V_int_max', 11);

assignin('base','V_th_pos',5);
assignin('base','V_th_neg',-5);

assignin('base','t_pattern',0.0000228571);

assignin('base','SimTime_Max',0.005);

assignin('base','FPGA_Output_Freq',80000000);

%% Open the model
open('OSHW_Multimeter_System.slx')
end