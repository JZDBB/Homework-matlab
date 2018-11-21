time = .3;
Ts = 1/10000;
t = Ts:Ts:time;
lent = length(t);
fm1 = 20;
fm2 = 10;
m1 = cos(2*pi*fm1*t);
m2 = cos(2*pi*fm2*t);
fc = 1000;
phi1 = 0;
phi2 = pi;
c1 = cos(2*pi*fc*t + phi1);
c2 = sin(2*pi*fc*t + phi2);
v = m1.*c1 + m2.*c2;

x1 = v .* c1;
x2 = v .* c2;
fbe = [0 0.1 0.2 1];
damps = [1 1 0 0];
fl = 100;
b = remez(fl, fbe, damps);
s1 = 2 * filter(b, 1, x1);
s2 = 2 * filter(b, 1, x2);

subplot(2, 1, 1);
plot(t, m1);
subplot(2, 1, 2);
plot(t, m2);

figure,
subplot(2, 1, 1);
plot(t, c1);
subplot(2, 1, 2);
plot(t, c2);

figure,
plot(t, v);

figure,
subplot(2, 1, 1);
plot(t, x1);
subplot(2, 1, 2);
plot(t, x2);

figure,
subplot(2, 1, 1);
plot(t, s1);
subplot(2, 1, 2);
plot(t, s2);

