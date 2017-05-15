%Color Slicing 肤色检测：RGB + 欧式距离
%陈兴雷
%2017/5/14
A = imread('p2.jpg');
% image(A);
C = imread('lena.jpg');

R=A(:,:,1);
G=A(:,:,3);
B=A(:,:,3);

[H,S,V] = rgb2hsv(R,G,B);

cH=C(:,:,1);
cS=C(:,:,3);
cV=C(:,:,3);

%求均值
avg_H = mean(H(:));
avg_S = mean(S(:));
avg_V = mean(V(:));
var_H = std2(H(:))^2/2;
var_S = std2(S(:))^2/2;
var_V = std2(V(:))^2/2;

ans1 =  C;
soushi = ones(size(H));
%%欧式距离
[srow,scol] = size(H);
for i = 1:srow
  for j = 1:scol
      soushi(i,j) = sqrt(double((H(i,j)-avg_H)^2+(S(i,j)-avg_S)^2+(V(i,j)-avg_V)^2));
  end
end
soushi_mean = mean(soushi(:));

[row,col] = size(cH);
for i = 1:row
   for j = 1:col
       if sqrt(double((cR(i,j)-avg_H)^2+(cS(i,j)-avg_S)^2+(cV(i,j)-avg_V)^2)) <soushi_mean
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





