function filtered_data = Moving_correction(data, fs)
% MYFUNCTION Median_filtering
% Li Ding (2025.4) 
% Syntax:
%   filtered_output = Moving_correction(input, sampling_rate)
%
% Input Arguments:
%   data - input data for filtering
%   fs - the sampling rate of the input data
%
% Output Arguments:
%   filtered_data - output the filtered data


% Move the data start value to 0
data = data - data(1);

% Set the window width = 0.2 * fs
u = 0.2;

% Calculate the baseline filtered by median window moving
baseline = zeros(length(data),1);

for i = fs*u:length(data)
    baseline(i) = median(data(i - fs*u +1:i));
end

% Get the filtered data by subtracting the baseline from the original data
filtered_data = data - baseline;

end