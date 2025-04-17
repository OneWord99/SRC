function g = strain_reconstruction(strain)
% MYFUNCTION Predicting drift in physiological electrical signals based on strain data
% Li Ding (2025.4) 
%
% Input Arguments:
%   strain - input data for strain reconstruction
%
% Output Arguments:
%   g - output the response data

% Set the unit impulse response function
a = 15; 
t = 0:length(strain)-1;
t = t';
b = 0.0025;
h = a * exp(-b*t);

% Calculate the response output based on the input
g = zeros(length(strain),1);
for i = 1:length(strain)
    for j = 1:i
            g(i) = g(i) + strain(j)*h(i-j+1);
    end
end

end