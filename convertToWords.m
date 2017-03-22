function text = convertToWords(morse)
%function text = convertToWords(morse)
% inputs: a dot and dash morse code string with slashes to separate letters
% and an underscore to separate words
% outputs: a string of the converted text

% parallel arrays to be used as a dictionary
letters = 'abcdefghijklmnopqrstuvwxyz0123456789.,/';
morseLet = {'.-', '-...', '-.-.', '-..', '.', '..-.', '--.', '....', ...
    '..', '.---', '-.-', '.-..', '--', '-.', '---', '.--.', '--.-', ...
    '.-.', '...', '-', '..-', '...-', '.--', '-..-', '-.--', '--..', ...
    '-----', '.----', '..---', '...--', '....-', '.....', '-....', ...
    '--...', '---..', '----.', '.-.-.-', '--..--', '-..-.'};

str = [];
text = [];
for k = 1:length(morse) % loop through each character of morse code string
    if morse(k) == '.' || morse(k) == '-' %construct string for each letter
        str = strcat(str,morse(k));
    elseif morse(k) == '/' || morse(k) == '_'
        % check string against each letter and if it matches add it to
        % texty
        for j = 1:length(letters)
            if strcmp(str,morseLet{j})
                text = strcat(text,letters(j));
                break;
            end
        end
        % add an underscore to text when there's an underscore in the morse
        if morse(k) == '_' 
            text = strcat(text,'_');
        end
        str = []; % reset the string of morse for a new letter
    end
end

return
    
    