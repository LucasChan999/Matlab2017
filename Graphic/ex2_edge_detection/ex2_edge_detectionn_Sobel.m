%Edge Detection 
%Chenxinglei
%2017/5/15
I=imread('lena.jpg');
I0=rgb2gray(I);
hy = fspecial('sobel');
hx = hy';
Iy = imfilter(double(I0), hy, 'replicate');
Ix = imfilter(double(I0), hx, 'replicate');
gradmag = sqrt(Ix.^2 + Iy.^2);
figure(4);
imshow(gradmag/255,[]);
title('SobelÌÝ¶È·ùÖµÍ¼Ïñ');
