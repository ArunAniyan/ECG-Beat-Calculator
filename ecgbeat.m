% ecgbeat.m
% Author - Arun Kumar A , Santhom Computing Facility
% Email - aka.bhagya@gmail.com 
% 03/07/09
% Program to Calculate the beats of an ECG signal 
% Uses Continuous Wavelet Transform
% Data file should be a 'csv' file

close all
clear all
clc

disp('                                  WELCOME ')
disp('                                  %%%%%%%')
disp('Program to calculate ECG beats')
disp('-------------------------------')

% User Inputs
file_name=input('Enter the name of the file with extention:','s');
sample_freq=input('Enter the sampling frequency of the signal:');

% Load file
data=csvread(file_name);


% Perform CWT with scale 3 and wavelet Coiflet-1
cof=cwt(data,3,'coif1');

% R -Peak Identification
cofsq=cof.^2;
threshold=mean(cofsq);
peak=0;
%datapoints=6*sample_freq*10;

% Remove edge effects
cofsq(1)=0;
cofsq(end)=0;

ntime=6*sample_freq;


for i=1:ntime
    if cofsq(i) >=threshold
        peak=peak+1;
    end
end

% Beats per minute
beats= peak;     % (peak/sample_freq)*36;

% Show output
disp(sprintf('Beat interval is %g beats per minute',beats))
disp('              Thank You')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%