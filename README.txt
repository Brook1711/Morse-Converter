

Topic: Convert Morse Code to Text
Author: Ashley Smith
Date: 5/10/2016


OVERVIEW

The files in this directory perform the conversion of a Morse code audio file to a text file with Morse code written as dots and dashes and with the corresponding English text.


WHERE TO START

Start by running the file runAllMorseToText.m, and following the prompts of the user interface. This then calls all of the other functions in the folder.


USER INPUT

The user will be asked to enter a time between 1 and 404 seconds. This number is the length of time of the Morse code audio file that will be translated.

The user will then be asked if they would like to display the graphs. The graphs were used in creating the text file. They include (in order): the original graph of the sound, the graph of the sound squared, the smoothed graph of the data (after the filter was applied to it), and the graph of the logical vector of the Morse code. These were all found in the runAllMorseToText.m file. The logical vector was then passed into other functions.


OUTPUT FILES

The program outputs a file called morseresults.txt. This file contains the original morse code represented in dots and dashes followed by the translation to English text.

The program can also display the graphs if the user enters ‘y’ when prompted. This, however, does not save the graphs as files to your computer.


RUN SCRIPTS

1) runAllMorseToText.m – script that converts Morse audio to a text file with dots and dashes and English text, by filtering the graph and calling all of the other functions


CALCULATION FUNCTIONS

1) findThresh.m – calculates the optimal thresholds to be used for identifying dots, dashes, and spaces from the logical vector of Morse code
2) convertToDotsAndDashes.m – converts the logical vector of Morse code from runAllMorseToText.m into a string of dots and dashes, using findThresh to calculate the threshold
3) convertToWords.m – uses a parallel array and cell array to translate the dot-dash string into a string of English text

