% (1) plot x(t) and y(t) with fs = 1ms
w0 = 100 * pi;
fs = 0.001;
N = 100;
t = 0:fs:(N-1)*fs;
x = cos(w0 * t);
y = cos(w0 * (t - 4*fs));
subplot(2, 1, 1);
stem(t, x, '.');
xlabel('t');
ylabel('x');
title('x(t)');
subplot(2, 1, 2);
stem(t, y, '.');
xlabel('t');
ylabel('y');
title('y(t)');

% (2) plot the histogram of Gaussian white noise n(t)
mean = 0;
sigma = 1;
% another method generate noise
% (1)
% n = wgn(1, 1000, 1);
% (2)
% N = 1000;
% n = sqrt(sigma) * randn(1, N);
n = normrnd(mean, sigma, 1, 1000);
figure, hist(n);
xlabel('��ֵ');
ylabel('Ƶ��');
title('��˹�������ֲ�ֱ��ͼ');

% (3) result
[c, lags] = xcorr(x, y, 100);
figure,
subplot(2, 1, 1)
stem(lags*0.001, c, '.')
title('Cross-correlation function');
fprintf('the Correlation of x(t), y(t) without noise in t0= is%6.6f\n', c(4));

[c_n, lags_n] = xcorr(x, y + n(1:100), 100);
subplot(2, 1, 2);
stem(lags_n*0.001, c_n, '.');
title('Cross-correlation function added noise');
fprintf('the Correlation of x(t), y(t) added noise in t0= is%6.6f\n', c_n(4));
