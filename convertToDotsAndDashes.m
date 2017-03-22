function morse = convertToDotsAndDashes(isBeep)
%function morse = convertToDotsAndDashes(isBeep)
% Inputs: a logical vector of morse that has 1's when it's beeping and has
% 0's when it's not beeping
% Outputs: a string with morse code in the form of dots and dashes

% calculate the thresholds
[dotThresh, dashThresh, letThresh, wordThresh] = findThresh(isBeep);

num = length(isBeep); % find number of samples
beep = false;
space = false;
morse = [];
for k = 1:num-1
    if isBeep(k) == 1 
        if beep == false %reset sum for new beep
            bsum = 1;
            beep = true;
            space = false;
        end
        if isBeep(k+1) == 1 %add up number of samples in a row that beep
            bsum = bsum + 1;
            
        % check threshold, assign to dot/dash, and reset beep
        elseif bsum > dotThresh && bsum < dashThresh
             morse = strcat(morse,'.');
             beep = false;
        elseif bsum >= dashThresh           
             morse = strcat(morse,'-');
             beep = false;
        end
    else
        if space == false %reset sum for new space
            sSum = 1;
            space = true;
            beep = false;
        end
        if isBeep(k+1) == 0 %add up num of samples in a row that are spaces
            sSum = sSum + 1;
            
        % check threshold, assign to slash/underscore, and reset space
        elseif sSum > letThresh && sSum < wordThresh 
            morse = strcat(morse,'/');
            space = false;
        elseif sSum >= wordThresh
            morse = strcat(morse,'_');
            space = false;
        end
    end
end

return