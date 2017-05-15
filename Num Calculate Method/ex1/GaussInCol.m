%列主元高斯消去法
function x = GaussInCol(A,b,ptol)
if nargin <3 , %使用默认的参数ptol值
    ptol = 50 *eps;
end 
[m,n] = size(A);%分别对应行数列数
if m~= n,
    error('A matrix need to be square');
end
nb = n + 1 ;
Ab = [A b];
fprintf('\nnBeign foreard with augment sysem:\n');
disp(Ab);
%消元
for i = 1:n -1 
    pivot = Ab(i,i); %pivot主元
    if abs(pivot) < ptol,error('zero pivot encountered '); end 
    for k = i+1:n 
    Ab(k,i:nb) =Ab(k,i:nb) -  (Ab(k,i)/pivot)*Ab(i,i:nb);
    end

fprintf('After elimition in columen %d with pivot = %f\n',i,pivot),
disp(Ab);
end

%回溯
 x = zeros(n,1);
 x(n) = Ab(n,nb)/Ab(n,n);
 for i = n-1 :-1 :1
    x(i) = (Ab(i,nb) - Ab(i,i+1:n)*x(i+1:n))/Ab(i,i); 
 end
end

