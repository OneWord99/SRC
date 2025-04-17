function [ECG_filted, baseline] = MMF_filter(ECG_drift, Fs)
% Modified Morphological Filtering (MMF)
% MMF is a filtering technique used to ?clean up? the signal with minimal signal distortion
% ECG_drift: input ECG siganl with baseline drift
% Fs: sampling frequency of ECG siganl
% ECG_filted: input - baseline
% baseline: baseline calculated from MMF

% Baseline correction
% close all;
% Defining the two structuring element
L = length(ECG_drift);
T = linspace(0,L/Fs,L); % time axis

Bo = ones(1,0.2*Fs+1); % Bo = strel('line',0.2*Fs,0);
Bc = ones(1,round(1.5*0.2*Fs)); % Bc = strel('line',1.5*0.2*Fs,0);

% Detection and Correction of the Wandering Baseline 
% Apply Op. and Cls. to detect the drift
peaksSuppression = opening(ECG_drift, Bo); % peaksSuppression(i,:) = imopen(DFT_ECGs(i,:), Bo);
pitsSuppression = closing(peaksSuppression, Bc); % pitsSuppression(i,:) = imclose(peaksSuppression(i,:), Bc);
% Detected drift of all sinals
detectedDrift = pitsSuppression;
    
% Correction subtracting the drift from signals
% Signal With Baseline drift corrected
ECG_filted = ECG_drift - detectedDrift';
% Finale Baseline result
baseline = closing(opening(ECG_filted,Bo),Bc); % finalBaseline(i,:) = imclose(imopen(Correction(i,:), Bo),Bc);

end