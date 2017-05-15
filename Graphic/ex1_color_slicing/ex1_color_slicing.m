%Color Slicing 肤色检测:RGB + 棋盘距离 
%陈兴雷
%2017/5/8
%从文件名读取图片A = imread(filename) 展示：image(A)
A = imread('p1.jpg');
image(A);
C = imread('lena.jpg');

R=A(:,:,1);
G=A(:,:,3);
B=A(:,:,3);

cR=C(:,:,1);
cG=C(:,:,3);
cB=C(:,:,3);



%求均值
avg_R = mean(R(:));
avg_G = mean(G(:));
avg_B = mean(B(:));
var_R = std2(R(:))^2/2;
var_G = std2(G(:))^2/2;
var_B = std2(B(:))^2/2;


I = (R+G+B)/3;
temp1 = min(R,G) ;
S = I - 3*min(temp1,B)./(R+G+B);
temp2 = (R-G).^2 + (R-G).*(R-B);
%H = acos((2*R - G - B)/2./(temp2).^(0.5));%%%%??

%a3(:,:,1) = H;
%a3(:,:,2) = S;
%a3(:,:,3) = I;
%imshow(a3);
%棋盘距离
[row,col] = size(cR);
ans1 =  C;
for i = 1:row
   for j = 1:col
       if(abs(cR(i,j)-avg_R)<var_R)&&(abs(cG(i,j)-avg_G)<var_G)&&(abs(cB(i,j)-avg_B)<var_B)
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