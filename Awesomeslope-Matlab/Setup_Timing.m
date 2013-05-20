function Setup_Timing(obj, p_PatternDuration, p_MeasurementDuration, p_NumberOfMeasurements)
            obj.T_Pattern       = p_PatternDuration;
            obj.T_Mesurement	= p_MeasurementDuration;
            obj.MaxSimTime      = p_MeasurementDuration * p_NumberOfMeasurements;
end