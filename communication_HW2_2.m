time = .3;
Ts = 1/10000;
t = Ts:Ts:time;
lent = length(t);
f0 = 1000; 
A0 = 1;
c = A0 * cos(2*pi*f0*t + 3/2 * pi); % generate a carrier.
fm = 100;
w = cos(2*pi*fm*t); % generate a signal bandwidth 100Hz.
s = (w + c).^2; % add signal and carrier and square.
v = (1/2) * bandp(s, 900, 1100, 800, 1200, 0.1, 30, 1/Ts);
% use a bandpass filter to get v(t) to spread.

% use AM.m to demodulate signal
gamma = 0;
phi = 0;
c2 = cos(2*pi*(f0 + gamma)*t + phi);
x= v.*c2;
fbe = [0 0.1 0.2 1];
damps = [1 1 0 0];
fl = 100;
b = remez(fl, fbe, damps);
m = 2 * filter(b, 1, x);

% plot
subplot(3, 1, 1);
plot(t, w);
title('原始信号w(t)');
subplot(3, 1, 2);
plot(t, c);
title('载波信号c(t)');
subplot(3, 1, 3);
% plot(t, v)
% title('已调信号v(t) = {A_0}w(t)cos(2{\pi}{f_c}t)');
% subplot(4, 1, 4);
plot(t, m);
title('解调信号m(t)');