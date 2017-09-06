function [processed_data] =pre_processor( gobbled_data )


%find and correct missing data
for i=1:length(gobbled_data) 
    
    % looks for 0s and -999s
    if gobbled_data(i) < 1
        
        % looks for incidence of two consecutive 0s
        if gobbled_data(i+1) < 1
            
            gobbled_data(i) = mean([gobbled_data(i-1) gobbled_data(i+2)]);
            
        else
        
        gobbled_data(i) = mean([gobbled_data(i-1) gobbled_data(i+1)]);
        
        end
        
    % looks for really big numbers
    elseif gobbled_data(i) > 200000
        
        gobbled_data(i) = mean([gobbled_data(i-1) gobbled_data(i+1)]);
               
    end
    
end

processed_data = gobbled_data;

end
