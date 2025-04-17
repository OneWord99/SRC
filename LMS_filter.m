function [out,y] = LMS_filter(input, dn, w_l, u)
% input：待滤波信号(已知的噪声信号）
% dn:参考信号（带有噪声的目标信号）
% w_l:滤波器阶数
% u:学习率
% out：输入的滤波信号

w = zeros(1,w_l);
len = length(input);

for i = 1:len-w_l+1
    y(i+w_l-1) = input(i:i+w_l-1)*w';
    e(i+w_l-1) = dn(i+1) - y(i+w_l-1);
    w = w+2*u*e(i+w_l-1)*input(i:i+w_l-1);
end

out = e;
end