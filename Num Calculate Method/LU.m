function [L,U] = LU(A)
n=length(A);
L=zeros(n,n);
U=zeros(n,n);
for i=1:n
    L(i,i)=1;
    U(1,i)=A(1,i);
end
for i=2:n
    L(i,1)=A(i,1)/U(1,1);
end
for k=2:n
    for i=k:n
        sum=0;
        for j=1:k-1
            sum=sum+L(k,j)*U(j,i);
        end
        U(k,i)=A(k,i)-sum;
    end
    for i=k+1:n
        sum=0;
        for j=1:k-1
            sum=sum+L(i,j)*U(j,k);
        end
        L(i,k)=(A(i,k)-sum)/U(k,k);
    end
end