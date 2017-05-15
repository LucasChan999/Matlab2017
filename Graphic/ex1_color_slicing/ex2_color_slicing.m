%Color Slicing ��ɫ��⣺RGB + ŷʽ����
%������
%2017/5/14
A = imread('p1.jpg');
image(A);
C = imread('lena.jpg');

R=A(:,:,1);
G=A(:,:,3);
B=A(:,:,3);

cR=C(:,:,1);
cG=C(:,:,3);
cB=C(:,:,3);

%���ֵ
avg_R = mean(R(:));
avg_G = mean(G(:));
avg_B = mean(B(:));
var_R = std2(R(:))^2/2;
var_G = std2(G(:))^2/2;
var_B = std2(B(:))^2/2;

ans1 =  C;
soushi = ones(size(R));
%%ŷʽ����
[srow,scol] = size(R);
for i = 1:srow
  for j = 1:scol
      soushi(i,j) = sqrt(double((R(i,j)-avg_R)^2+(G(i,j)-avg_G)^2+(B(i,j)-avg_B)^2));
  end
end
soushi_mean = mean(soushi(:));

[row,col] = size(cR);
for i = 1:row
   for j = 1:col
       if sqrt(double((cR(i,j)-avg_R)^2+(cG(i,j)-avg_G)^2+(cB(i,j)-avg_B)^2)) <soushi_mean
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

figure(2);
imshow(C);





