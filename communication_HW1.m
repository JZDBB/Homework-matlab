




t = 0:0.1:10;
y = cos(2*pi*t + pi);
Y=fft(y);
fp=2*sqrt(Y.*conj(Y));%幅度谱
xp=angle(Y); %相位谱
gl=abs(Y).^2; %功率谱
plot(fp);
figure,
plot(xp);
figure,
plot(gl);