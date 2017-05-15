%����Ԫ��˹��ȥ��
function x = GaussInCol(A,b,ptol)
if nargin <3 , %ʹ��Ĭ�ϵĲ���ptolֵ
    ptol = 50 *eps;
end 
[m,n] = size(A);%�ֱ��Ӧ��������
if m~= n,
    error('A matrix need to be square');
end
nb = n + 1 ;
Ab = [A b];
fprintf('\nnBeign foreard with augment sysem:\n');
disp(Ab);
%��Ԫ
for i = 1:n -1 
    pivot = Ab(i,i); %pivot��Ԫ
    if abs(pivot) < ptol,error('zero pivot encountered '); end 
    for k = i+1:n 
    Ab(k,i:nb) =Ab(k,i:nb) -  (Ab(k,i)/pivot)*Ab(i,i:nb);
    end

fprintf('After elimition in columen %d with pivot = %f\n',i,pivot),
disp(Ab);
end

%����
 x = zeros(n,1);
 x(n) = Ab(n,nb)/Ab(n,n);
 for i = n-1 :-1 :1
    x(i) = (Ab(i,nb) - Ab(i,i+1:n)*x(i+1:n))/Ab(i,i); 
 end
end

