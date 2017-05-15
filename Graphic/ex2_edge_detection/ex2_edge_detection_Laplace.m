%Edge Detection 
%Chenxinglei
%2017/5/15
I=imread('lena.jpg');
img=rgb2gray(I);
[row,col] = size(img);
% laplace = [0 -1 0; -1 4 -1; 0 -1 0];
laplace=edge(I0,'LOG',0.0092);
figure(2);
imshow(laplace);
title('Laplace Edge Detection')

% for i_row = 2:row - 1 
%    for i_col = 2:col - 1
%        mat = [img(i_row-1,i_col-1),img(i_row-1,i_col),img(i_row-1,i_col+1);
%                  img(i_row,i_col-1),img(i_row,i_col),img(i_row,i_col+1);
%                  img(i_row+1,i_col-1),img(i_row+1,i_col),img(i_row+1,i_col+1)];
%        temp = 0;
%        for i = 1:3
%            for j = 1:3
%                temp = mat(i,j) * laplace(i,j) + temp;
%            end
%        end
%        img(i_row,i_col) = temp;
% %        if img(i_row,i_col) > 124
% %            img(i_row,i_col) = 1 ;
% %        else
% %            img(i_row,i_col) = 0 ;
% %        end
%    end
% end
% 
% imshow(img);

