function Calc_Vout_Input(obj, p_Vmes_ON, p_Vcal_pos_ON, p_Vcal_neg_ON, p_dT)
    % No Input voltages present, do nothing    
    if (p_Vmes_ON == false) && (p_Vcal_pos_ON == false) && (p_Vcal_neg_ON == false)

    % At least one input active, compute the output
    else
        % Check wich input resistor to use
        if obj.f_UseLowerRange == false
            R_mes = obj.R_mes_high;
        else
            R_mes = obj.R_mes_low;
        end

        % Input voltage turned on, no other voltages present
        if (p_Vmes_ON == true) && (p_Vcal_pos_ON == false) && (p_Vcal_neg_ON == false)

            obj.V_out = -(1/(R_mes*obj.C_int)) * obj.V_in * p_dT;

        % Vcal_pos turned on
        elseif (p_Vcal_pos_ON == true) && (p_Vcal_neg_ON == false)

            obj.V_out = -(1/(R_mes*obj.C_int)) * obj.Vcal_pos * p_dT;

        % Vcal_neg turned on
        elseif (p_Vcal_pos_ON == false) && (p_Vcal_neg_ON == true)

            obj.V_out = -(1/(R_mes*obj.C_int)) * obj.Vcal_neg * p_dT;

        else
            error('Multiple input voltages present at the same time');
        end

    end

end 
