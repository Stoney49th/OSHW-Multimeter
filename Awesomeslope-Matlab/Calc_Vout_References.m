function Calc_Vout_References(obj, p_Vref_Pos_ON, p_Vref_Neg_ON)
    % Both refs can be switched on at once, so do two decisions
    if p_Vref_Pos_ON == true
        obj.V_out = -(1/(obj.R_pos*obj.C_int)) * obj.Vref_pos * p_dT;
    end

    if p_Vref_Neg_ON == true
        obj.V_out = -(1/(obj.R_neg*obj.C_int)) * obj.Vref_neg * p_dT;
    end

end    
