% Clear
clc;
clear all;

% Import ECG data with press interference
filename = 'Data_example (ECG with Press Interference).txt';
ecg = importdata(filename);

% Import Strain sensor data
filename2 = 'Data_example_strain_data.CSV';
r_data = csvread(filename2);
Res = r_data(:,1);

% The uniform sampling rate is 250 Hz
fs = 250;

% detaR/R0
detaR = Res - Res(1);
R0 = Res(1);
detaR_R0 = detaR/R0;

% Read the fitting data for press
filename2 = 'Fitting data for press.xlsx';
fitdata = xlsread(filename2);
fit_depth = fitdata(:,1);
fit_detaR_R0 = fitdata(:,2);

% Get the fitting curve
[fitresult, gof] = createFit(fit_detaR_R0, fit_depth);

% Transfer the res to press depth according to the fitting curve
depth_predict = fitresult(detaR_R0);
% Remove the drift
depth_predict = depth_predict - depth_predict(1);
% Strain reconstruction to get the predict drift(g)
g = strain_reconstruction(depth_predict);

% Plot showing strain sensor data (detaR_R0)
% predicted press depth (depth_predict)
% reconstructed drift signal (g)
t = 1:length(detaR_R0);
t = t./fs;

figure(1);
subplot(3,1,1);
plot(t, detaR_R0);
title('(R-R0)/R0'); xlabel('t(s)'); 
subplot(3,1,2);
plot(t, depth_predict);
title('Predicted press depth'); xlabel('t (s)'); ylabel('mm'); 
subplot(3,1,3);
plot(t, g);
title('Drift reconstructed from predicted press depth');
xlabel('t(s)'); ylabel('uV'); 

figure(2);
subplot(2,1,1);
plot(t, g);
title('Drift reconstructed from predicted press depth'); xlabel('t (s)'); ylabel('uV'); 
subplot(2,1,2);
plot(ecg);
title('ECG with Press Interference Drift'); xlabel('t (s)'); ylabel('uV'); 
