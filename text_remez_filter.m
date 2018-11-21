time = .3;
Ts = 1/10000;
t = Ts:Ts:time;
lent = length(t);
f0 = 1000;
A0 = 1;
c = cos(2*pi*f0*t);
fm = 100;
w = cos(2*pi*fm*t);
s = w + c;

% fbe = [0 0.4 0.6 1];
% damps = [0 1 1 0];
% fl = 100;
% b = remez(fl, fbe, damps);
% m = filter(b, 10, s);

m=bandp(s, 900, 1100, 800, 1200, 0.1, 30, 1/Ts);


subplot(4, 1, 1);
plot(t, w);
subplot(4, 1, 2);
plot(t, c);
subplot(4, 1, 3);
plot(t, s);
subplot(4, 1, 4);
plot(m(1000:3000));