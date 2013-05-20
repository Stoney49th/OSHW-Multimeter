classdef SlopeSim < handle
    %SLOPESIM Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Vref_pos;
        Vref_neg;
        Vcal_pos;
        Vcal_neg;
        
        R_pos;
        R_neg;
        R_mes_high;
        R_mes_low;
        C_int;
        
        V_in;
        V_out;
        delta_V;
        
        T_Pattern;
        T_Mesurement;
    end
    
    properties (Access = protected)
        SimTime;
        SimTime_previous;
        f_UseLowerRange;
        MaxSimTime;
    end
    
    methods
        
        % Constructor
        function obj = SlopeSim()
            obj.SimTime         = 0;
            obj.V_out           = 0;
            obj.f_UseLowerRange = false;
            
            %insert dummy element for later array use
            obj.delta_V         = 0;
        end
        
        % Setup Functions
        Setup_Passives(obj, p_R_pos, p_R_neg, p_R_mes_high, p_R_mes_low, p_C_int);        
        Setup_References(obj, p_Vref_pos, p_Vref_neg, p_Vcal_pos, p_Vcal_neg);        
        Setup_Timing(obj, p_PatternDuration, p_MeasurementDuration, p_NumberOfMeasurements);
       
        % Input Control Functions
        function Use_low_Measurement_Range(obj)
            obj.f_UseLowerRange = true;
        end        
        function Use_high_Measurement_Range(obj)
            obj.f_UseLowerRange = false;
        end        
        function Set_Input_Voltage(obj, p_V_in)
            obj.V_in = p_V_in;
        end

        % Calculate integrator output voltages for different inputs
        Calc_Vout_Input(obj, p_Vmes_ON, p_Vcal_pos_ON, p_Vcal_neg_ON, p_dT);        
        Calc_Vout_References(obj, p_Vref_Pos_ON, p_Vref_Neg_ON);    
        
        % Simulation functions
        Next(obj);
        Enqueue(obj, p_nextEvent);
        
    end
    
end

