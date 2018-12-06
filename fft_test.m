f = imread('airfield.bmp');
img = f(1:8, 1:8);
imwrite(img, '1.bmp');



F = fft2(f);
S = abs(F);
imshow(S,[]);
Fc = fftshift(F);
figure,
imshow(Fc,[]); 
S2 = log(1+abs(Fc));
figure,
imshow(S2,[]);
IF = ifft2(F);
S3 = abs(IF);
figure,
imshow(IF, []);