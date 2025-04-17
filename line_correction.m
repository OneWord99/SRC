function data_after = line_correction(input, fs)
% MYFUNCTION Piecewise linear correction
% Li Ding (2025.4) 
%
% Input Arguments:
%   input - input data for correction
%   fs - the sampling rate of the input data
%
% Output Arguments:
%   data_after - output the correction data

input = input - input(1);
[picind, s] = rpeak(input, fs);
for i = 1:length(picind)
    for j = picind(i)-5:picind(i)+5
        disp(j);
        if input(j) > input(picind(i))
            picind(i) = j;
        end
    end
end

data_after = input;
shift = 0*fs;

for i = 1:length(picind)-1
    disp(i);
    x1 = picind(i)+shift;
    y1 = input(picind(i)+shift);
    x2 = picind(i+1)+shift;
    y2 = input(picind(i+1)+shift);
    a = (y1-y2)/(x1-x2);
    b = (x1*y2-x2*y1)/(x1-x2);
    for j = picind(i):picind(i+1)-1
        data_after(j+shift) = input(j+shift) - (a*(j+shift)+b);
    end
end

end