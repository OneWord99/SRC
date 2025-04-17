function data_after = IIR_filter(input, Fs)
% MYFUNCTION Design and apply an IIR filter
% Li Ding (2025.4) 
%
% Input Arguments:
%   input - input data for filtering
%   Fs - the sampling rate of the input data
%
% Output Arguments:
%   data_after - output the correction data

% Design the IIR filter
Fs = 250; T = 1/Fs;                        % Sampling rate
wp = 1/(Fs/2); ws = 0.5/(Fs/2); Rp=1; Rs=30; % Normalized frequency
[N, wc] = buttord(wp,ws,Rp,Rs);            % Determining the Order of a Butterworth Digital High-Pass Filter
[B,A] = butter(N,wc,'high');               % Calculate the coefficients of a Butterworth digital high-pass filter
w=0:pi/512:pi-pi/512;                      % Set the frequency range

% Calculate the frequency response function of the Butterworth digital filter
H=freqz(B,A,w);      

% Filtering
filtered_data = filter(B, A, input);

data_after = filtered_data;
end