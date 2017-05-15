%magauss.m
function x=magauss(A,b,flag)
%用途：顺序Gauss消去法解线性方程组Ax=b
%格式：x=magauss(A,b,flag), A为系数矩阵, b为右端项, 若flag=0, 则不
%  显示中间过程，否则显示中间过程, 默认为0, x为解向量
if nargin<3,flag=0;end
n=length(b);
%消元
for k=1:(n-1)
    m=A(k+1:n,k)/A(k,k);
    A(k+1:n,k+1:n)=A(k+1:n,k+1:n)-m*A(k,k+1:n);
    b(k+1:n)=b(k+1:n)-m*b(k);
    A(k+1:n,k)=zeros(n-k,1);
   if flag~=0, Ab=[A,b], end
end
%回代
x=zeros(n,1);
x(n)=b(n)/A(n,n);
for k=n-1:-1:1
    x(k)=(b(k)-A(k,k+1:n)*x(k+1:n))/A(k,k);
end