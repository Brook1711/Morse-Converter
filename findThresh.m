function [dotThresh, dashThresh, letThresh, wordThresh] = ...
    findThresh(isBeep)
%function [dotThresh, dashThresh, letThresh, wordThresh] = ...
%   findThresh(isBeep)
%input: a logical vector of morse that has 1's when it's beeping and has
%       0's when it's not beeping
%outputs: dotThresh - the threshold for the beep to be a dot
%         dashThresh - the threshold for the beep to be a dash
%         letThresh - the threshold for the space to be a new letter
%         wordThresh - the threshold for the space to be a new word

num = length(isBeep); % number of samples
beep = false;
space = false;
beepSums = zeros(1,num);
for k = 1:num-1 % iterate through the whole beeps vector
    if isBeep(k) == 1 
        if beep == false %reset sum for new beep
            bsum = 1;
            beep = true;
            space = false;
        end
        if isBeep(k+1) == 1 %add up number of samples in a row that beep
            bsum = bsum + 1;
        else 
            beepSums(k) = bsum; %add all of the sums to a vector
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
        else
            spaceSums(k) = sSum; %add all of the sums to a vector
            space = false; %reset space
        end
    end
end

% extract just the sums that are nonzero
beepSums = beepSums(beepSums > 1);
spaceSums = spaceSums(spaceSums > 5000);

% find the typical values for dots and dashes
dash = max(beepSums);
dot = min(beepSums);
newWord = max(spaceSums);
newLet = min(spaceSums);

% find the threshold values
dotThresh = dot - dot/10;
dashThresh = (dot + dash)/2;
letThresh = newLet - newLet/10;
wordThresh = (newLet + newWord)/2;

return