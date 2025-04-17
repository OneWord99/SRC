% Clear
clc;
clear all;

% Import Data
filename = 'Data_example (ECG, SR, Strain).txt';
data = importdata(filename);

% Col.1: ECG data
% Col.3: Press depth(strain sensor data)  
% Col.2: Shift reconstructed from strain sensor data (see XXX.m)
ecg = data(:,1)';
depth = data(:,3)';
shift = data(:,2)';

% Pre_processing
max_ecg = max(ecg);
ecg_p = ecg./max(ecg);
max_shift = max(shift);
shift_p = shift./max(shift);

% Sampling rate: 250 Hz
t = 1:1:length(ecg);
t = t./250;

% Set the LMS filter length (w_l) and learning rate (u)
w_l = 80;
u = 0.01;

% Process the ECG data using the LMS filter
[out,y] = LMS_filter(shift_p, ecg_p, w_l, u);

% Multiply the result by the coefficient (max_ecg, max_shift) to restore
out = out*max_ecg; out = out';
y = y'; y = y*max_shift; y(1:w_l-1) = [];

% Transpose in preparation for plotting
ecg = ecg';

% Display of filtering effect based on SRC
figure(1);
subplot(3,1,1);
plot(t,shift);
title('Shift Reconstructed from Strain'); xlabel('t(s)');ylabel('uV');
subplot(3,1,2);
plot(t,ecg);
title('Original ECG');xlabel('t(s)');ylabel('uV');
subplot(3,1,3);
plot(t,out);
title('Filtered ECG');xlabel('t(s)');ylabel('uV');


