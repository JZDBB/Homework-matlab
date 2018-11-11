% (1) plot x(t) and y(t)
w0 = 100 * pi;
t = 0:0.001:0.1;
x = cos(w0 * t);
y = cos(w0 * (t - 0.004));
subplot(2, 1, 1);
plot(t, x);
subplot(2, 1, 2);
plot(t, y);

% (2) plot the histogram of Gaussian white noise n(t)
mean = 0;
sigma = 1;
n = wgn(1, 1000, 1);
% n = normrnd(mean,sigma, 1000, 1);
% N = 1000;
% n = sqrt(sigma) * randn(N, 1);

%�Ӹ�˹��������ͳ����Ϣ�ͷ�ֵ�ֲ���һ�������ص�
mean_value = mean(n);    %��ֵΪ0
variance = var(n);      %����Ϊ1������Ϊ0dBW��10*log1=0��
figure, hist(noise);
xlabel('��ֵ');
ylabel('Ƶ��');
title('������ֵ��ֱ��ͼ');



