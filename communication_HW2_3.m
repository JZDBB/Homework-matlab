time = .3;
Ts = 1/10000;
t = Ts:Ts:time;
lent = length(t);
fm1 = 20;
fm2 = 10;
m1 = cos(2*pi*fm1*t);
m2 = cos(2*pi*fm2*t); % two signal with different frequence
fc = 1000;
phi = pi;
c10 = cos(2*pi*fc*t);
c20 = sin(2*pi*fc*t); % two carrier with different phase
v = m1.*c10 + m2.*c20; 

c1 = cos(2*pi*fc*t + phi);
c2 = sin(2*pi*fc*t + phi);
x1 = v .* c1;
x2 = v .* c2;
fbe = [0 0.1 0.2 1];
damps = [1 1 0 0];
fl = 100;
b = remez(fl, fbe, damps);
s1 = 2 * filter(b, 1, x1);
s2 = 2 * filter(b, 1, x2);

subplot(4, 1, 1);
plot(t, m1);
title('调制前{m_1}(t)')
subplot(4, 1, 2);
plot(t, m2);
title('调制前{m_2}(t)')
% figure,
% subplot(2, 1, 1);
% plot(t, c1);
% subplot(2, 1, 2);
% plot(t, c2);
% 
% figure,
% plot(t, v);
% 
% figure,
% subplot(2, 1, 1);
% plot(t, x1);
% subplot(2, 1, 2);
% plot(t, x2);

% figure,
subplot(4, 1, 3);
plot(t, s1);
title('解调后{s_1}(t), {\phi}={\pi}')
subplot(4, 1, 4);
plot(t, s2);
title('解调后{s_2}(t), {\phi}={\pi}')
