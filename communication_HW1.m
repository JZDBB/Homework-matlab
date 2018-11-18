t = 0:0.1:50;
f = 5;
f0 = 2;
w = cos(2*pi*f*t);
s = cos(2*pi*f0*t);
W = fft(w);
S = fft(s);
%������
fp_w = 2 * sqrt(W.*conj(W));
fp_s = 2 * sqrt(S.*conj(S));
subplot(2, 1, 1);
plot(fp_w);
xlabel('f');
ylabel('|W(f)|');
title('w(t)������');
subplot(2, 1, 2);
plot(fp_s);
xlabel('f');
ylabel('|S(f)|');
title('s(t)������');
%��λ��
xp_w=angle(W); 
xp_s=angle(S);
figure,
subplot(2, 1, 1);
plot(xp_w);
xlabel('f');
ylabel('arg(W(f))');
title('w(t)��λ��');
subplot(2, 1, 2);
plot(xp_s);
xlabel('f');
ylabel('arg(S(f))');
title('s(t)��λ��');