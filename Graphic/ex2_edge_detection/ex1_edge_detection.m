%Edge Detection :Package Version
%Chenxinglei
%2017/5/15
%Edge Detection :Sobel
I=imread('lena.jpg');
I0=rgb2gray(I);
subplot(231);%2rows,3cols,position1
imshow(I);
%Edge Detection :Roberts
BW1=edge(I0,'Roberts',0.16);
subplot(232);
imshow(BW1);
title('Robert���ӱ�Ե���')
%Edge Detection :Sobel
BW2=edge(I0,'Sobel',0.16);
subplot(233);
imshow(BW2);
title('Sobel���ӱ�Ե���')
%Edge Detection :Prewwitt
BW3=edge(I0,'Prewitt',0.16);
subplot(234);
imshow(BW3);
title('Prewitt���ӱ�Ե���');
%Edge Detection :��ֵΪ0.012��������˹���ӣ���
BW4=edge(I0,'LOG',0.012);
subplot(235);
imshow(BW4);
title('LOG���ӱ�Ե���')
%Edge Detection :Canny
BW5=edge(I0,'Canny',0.2);
subplot(236);
imshow(BW5);
title('Canny���ӱ�Ե���')











