% Clear
clc;
clear all;
close all;

% Import Data
filename = 'Data_example (SR, ECG).txt';
data = importdata(filename);

% Col.1: Shift reconstructed from strain sensor data (see XXX.m)
% Col.2: ECG data
rec_sig = data(:,1);
ECG = data(:,2);

% Sampling rate: 250 Hz
fs = 250;

% Set the LMS filter length (w_l) and learning rate (u)
w_l = 60;
u = 0.0000000002;

% Process ECG data by different algorithm
[out,y] = LMS_filter(rec_sig', ECG', w_l, u);
data_after1 = Moving_correction(ECG, fs);
data_after2 = IIR_filter(ECG, fs);
[data_after3, baseline] = MMF_filter(ECG, fs);

% Identifying R peaks form different filtered ECG using the P&T algorithm
% SRC filtering
out = out(120:end); out = out';
[picind1,filt_dat,int_dat,thF1,thI1] = pantompkins_qrs(out,fs);
r_value1 = out(picind1);
r_location1 = [picind1',r_value1];

% Median filtering
data_after1 = data_after1(120:end);
[picind2,filt_dat,int_dat,thF1,thI1] = pantompkins_qrs(data_after1,fs);
r_value2 = data_after1(picind2);
r_location2 = [picind2',r_value2];

% IIR high-pass filtering
data_after2 = data_after2(120:end);
[picind3,filt_dat,int_dat,thF1,thI1] = pantompkins_qrs(data_after2,fs);
r_value3 = data_after2(picind3);
r_location3 = [picind3',r_value3];

% Morphological filtering
data_after3 = data_after3(120:end);
[picind4,filt_dat,int_dat,thF1,thI1] = pantompkins_qrs(data_after3,fs);
r_value4 = data_after3(picind4);
r_location4 = [picind4',r_value4];

% Figures for showing the results
t = 1:1:length(out);
t = t./fs;

figure;
plot(t, out);
hold on;
scatter(r_location1(:,1)/fs,r_location1(:,2));
title('SRC', 'FontSize', 12); xlabel('t(s)'); ylabel('uV');
legend('Filtered ECG', 'R peak');

figure;
plot(data_after1);
hold on;
scatter(r_location2(:,1),r_location2(:,2));
title('Median filtering', 'FontSize', 12); xlabel('t(s)'); ylabel('uV');
legend('Filtered ECG', 'R peak');

figure;
plot(data_after2);
hold on;
scatter(r_location3(:,1),r_location3(:,2));
title('IIR high-pass filtering', 'FontSize', 12); xlabel('t(s)'); ylabel('uV');
legend('Filtered ECG', 'R peak');

figure;
plot(data_after3);
hold on;
scatter(r_location4(:,1),r_location4(:,2));
title('Morphological filtering', 'FontSize', 12); xlabel('t(s)'); ylabel('uV');
legend('Filtered ECG', 'R peak');



