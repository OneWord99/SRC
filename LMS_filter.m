function [out,y] = LMS_filter(input, dn, w_l, u)
% input�����˲��ź�(��֪�������źţ�
% dn:�ο��źţ�����������Ŀ���źţ�
% w_l:�˲�������
% u:ѧϰ��
% out��������˲��ź�

w = zeros(1,w_l);
len = length(input);

for i = 1:len-w_l+1
    y(i+w_l-1) = input(i:i+w_l-1)*w';
    e(i+w_l-1) = dn(i+1) - y(i+w_l-1);
    w = w+2*u*e(i+w_l-1)*input(i:i+w_l-1);
end

out = e;
end