%Color Slicing ��ɫ���:HSI + ���̾��� 
%������
%2017/5/14
%���ļ�����ȡͼƬA = imread(filename) չʾ��image(A)
A = imread('p1.jpg');
%image(A);��ʵͼƬ
C = imread('lena.jpg');

R=A(:,:,1);
G=A(:,:,3);
B=A(:,:,3);

cH=C(:,:,1);
cS=C(:,:,3);
cV=C(:,:,3);

[H,S,V] = rgb2hsv(A);
%���ֵ
avg_H = mean(H(:));
avg_S = mean(S(:));
avg_V = mean(I(:));
var_H = std2(H(:))^2/2;
var_S = std2(S(:))^2/2;
var_V = std2(I(:))^2/2;

%���̾���
[row,col] = size(cH);
ans1 =  C;
for i = 1:row
   for j = 1:col
       if(abs(cH(i,j)-avg_H)<var_H)&&(abs(cS(i,j)-avg_S)<var_S)&&(abs(cV(i,j)-avg_V)<var_V)
           ans1(i,j,1) = 1;
           ans1(i,j,2) = 1;
           ans1(i,j,3) = 1;
       else
           ans1(i,j,1) = 0;
           ans1(i,j,2) = 0;
           ans1(i,j,3) = 0;
       end
   end
end

for i = 1:row
   for j = 1:col
   C(i,j,1) = C(i,j,1) * ans1(i,j,1);
   C(i,j,2) = C(i,j,2) * ans1(i,j,2);
   C(i,j,3) = C(i,j,3) * ans1(i,j,3);
   end
end

imshow(C);