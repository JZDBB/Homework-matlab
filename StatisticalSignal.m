% (1) plot x(t) and y(t)
w0 = 100 * pi;
fs = 0.001;
N = 100;
t = 0:fs:N*fs;
x = cos(w0 * t);
y = cos(w0 * (t - 0.004));
subplot(2, 1, 1);
plot(t, x);
xlabel('t');
ylabel('x');
title('x(t)');
subplot(2, 1, 2);
plot(t, y);
xlabel('t');
ylabel('y');
title('y(t)');

% (2) plot the histogram of Gaussian white noise n(t)
mean = 0;
sigma = 1;
% n = wgn(1, 1000, 1);
% n = normrnd(mean,sigma, 1000, 1);
N = 100;
n = sqrt(sigma) * randn(N, 1);
figure, hist(n);
xlabel('幅值');
ylabel('频次');
title('高斯白噪声分布直方图');

% (3) result
c = xcorr(x,y);
% printf(c(0.04));
figure,
plot(c);




