




t = 0:0.1:10;
y = cos(2*pi*t + pi);
Y=fft(y);
fp=2*sqrt(Y.*conj(Y));%������
xp=angle(Y); %��λ��
gl=abs(Y).^2; %������
plot(fp);
figure,
plot(xp);
figure,
plot(gl);