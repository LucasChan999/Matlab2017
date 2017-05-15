%Edge Detection 
%Chenxinglei
%2017/5/15
I=imread('lena.jpg');
I0=rgb2gray(I);
canny=edge(I0,'Canny',0.1);
imshow(canny);
title('Canny Edge Detection')
