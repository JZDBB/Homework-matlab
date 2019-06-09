% import two frame of the video
[Y,U,V]= yuv_import('foreman_qcif.yuv',[176 144],2,2);
Image1 = rgb2gray(yuv2rgb(cell2mat(Y(1)),cell2mat(U(1)),cell2mat(V(1))));
Image2 = rgb2gray(yuv2rgb(cell2mat(Y(2)),cell2mat(U(2)),cell2mat(V(2))));
Image1 = rot90(Image1, 3);
Image2 = rot90(Image2, 3);
figure,
imshow(Image1);
[y] = motionEstES(Image1, Image2, 8, 3); % esstimate the motion
[imgComp] = motionComp(Image1, double(y), 8);

% Calculating Frame Difference, its MSE and its entropy value
framediff = abs(Image1-Image2);
figure(2);
imshow(Image1);
imwrite(Image1, 'P.png');
imwrite(Image2, 'I.png');
imwrite(framediff, 'diff.png');
imwrite(imgComp, 'comp.png');
figure(3);
imshow(Image2);
figure(4);
imshow(framediff);

% Calculating motion Compensated Frame Difference, its MSE and its entropy value
%MCF
figure(5);
imshow(imgComp);

fprintf('PSNR: %f\n', psnr(imgComp,Image2));
