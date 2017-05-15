function [L,U,x] = Doolittle( A,b )
   if nargin < 2
       error('error in input num');
   end
   [rowA,colA] = size(A);
   [rowB,colB] = size(b);
   if rowA~=rowB
       error('row number of A has to be equal to B row number ');
   end
   if rowA ~= colA
       error('matrix A has to be square');
   end
   n = length(b);
   L = zeros(rowA,colA);
   U = zeros(rowA,colA);
   for i = 1:n
       L(i,i) = 1;
       U(1,i) = A(1,i); 
   end
   for i = 2:n
       L(i,1) = A(i,1)/U(1,1);
   end
   for k =2:n 
       for j = k:n
           sum = 0;
           for t = 1:k-1
               sum =sum + L(k,t)*U(t,j);
           end
           U(k,j) = A(k,j) - sum;
       end %end of j loop
       
       for i = k+1:n 
           sum = 0;
           for t= 1:k-1
              sum =  sum + L(i,t)*U(t,k);
           end
           L(i,k) = (A(i,k) - sum)/U(k,k);
       end%end of i loop 
   end%end of k loop
  
   y = zeros(rowB,1);
   x = zeros(rowB,1);
   y(1) = b(1);
   for i = 2:n 
       sum = 0;
       for j = 1:i-1
           sum = sum + L(i,j)*y(j);
       end
       y(i) = b(i) - sum;
   end%end of loop i
   
   x(n) = y(n)/U(n,n);
   for i = n-1:1
       sum = 0;
       for j = i+1 :n
           sum = sum + U(i,j)*x(j);
       end
       x(i) = ( y(i) - sum )/U(i,i);
   end%end of loop i
   
end

