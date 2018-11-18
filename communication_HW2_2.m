time = .3;
Ts = 1/10000;
t = Ts:Ts:time;
lent = length(t);
f0 = 1000;
A0 = 1;
c = A0 * cos(2*pi*f0*t);
fm = 100; %w(t)带宽100Hz？？
w = cos(2*pi*fm*t);
s = (w + c).^2;

fs = 3000;
f1=900;f3=1100;%通带截止频率上下限
fsl=700;fsh=1300;%阻带截止频率上下限
rp=0.1;rs=30;%通带边衰减DB值和阻带边衰减DB值
wp1=2*pi*f1/fs;
wp3=2*pi*f3/fs;
wsl=2*pi*fsl/fs;
wsh=2*pi*fsh/fs;
wp=[wp1 wp3];
ws=[wsl wsh];
[n,wn]=cheb1ord(ws/pi,wp/pi,rp,rs);
[bz1,az1]=cheby1(n,rp,wp/pi);
v = 2 * filter(bz1, az1, s);

gamma = 0;
phi = 0;
c2 = cos(2*pi*(fc + gamma)*t + phi);
x= v.*c2;
fbe = [0 0.1 0.2 1];
damps = [1 1 0 0];
fl = 100;
b = remez(fl, fbe, damps);
m = 2 * filter(b, 1, x);
subplot(4, 1, 1);
plot(w);
subplot(4, 1, 2);
plot(v);
subplot(4, 1, 3);
plot(x);
subplot(4, 1, 4);
plot(m);