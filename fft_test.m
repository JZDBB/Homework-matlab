f = imread('airfield.bmp');
F = fft2(f);
S = abs(F);
imshow(S,[]);
Fc = fftshift(F);
figure,
imshow(Fc,[]); 
S2 = log(1+abs(Fc));
figure,
imshow(S2,[]);