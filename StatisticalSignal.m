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

%从高斯白噪声的统计信息和幅值分布看一下它的特点
mean_value = mean(n);    %均值为0
variance = var(n);      %方差为1，功率为0dBW（10*log1=0）
figure, hist(noise);
xlabel('幅值');
ylabel('频次');
title('噪声幅值的直方图');



