% Ashley Smith
% runAllMorseToText
% Purpose: to convert a morse audio file to text

%read in audio file
file = audioread('morseaudio.mp3');
% length of entire clip was found by looking at audiofile
time = 404; %in seconds
smplrate = length(file)/time;

% get amount of time from user
prompt = ['Please enter the amount of time of morse code in seconds ' ...
    '(between 0 and 404) that you would like to translate'];
ans1 = inputdlg(prompt, 'Morse Code', 1);
t = str2num(ans1{1});

% ask user if graphs should be displayed
ans2 = inputdlg('Display graphs of the sound? (y or n)');
dispGraphs = ans2{1};

% take out desired amount of time from the file
num = round(t*smplrate);
data = file(1:num);

% square the data to make it positive
dataSqr = data.^2;

% smooth the data
B = 1/1000 * ones(1000,1);
smooth = filter(B,1,dataSqr);

% turn it into logical vector
thresh = 0.3; %chosen because it is in middle between amplitude and 0
isBeep = smooth > thresh;

% convert to dots and dashes and display it
morse = convertToDotsAndDashes(isBeep);
disp(morse);

% convert to text and display it
text = convertToWords(morse);
disp(text);

% plot data if desired
if dispGraphs == 'y'
    figure;
    plot(data);
    title('Original Graph of the Sound');
    figure;
    plot(dataSqr);
    title('Data Squared');
    figure;
    plot(smooth);
    title('Smoothed Graph');
    figure;
    plot(isBeep);
    title('Graph of Logical Vector of Sound');
end

% save the morse and the text to a file
fid = fopen( 'morseresults.txt', 'wt' );
fprintf(fid, 'Morse Code: %s \nText: %s', morse, text);
fclose(fid);

