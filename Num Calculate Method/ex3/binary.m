%ժҪ��ʹ�ö�����⺯�����
function answer = binary( a,b,judge,fun)
    if nargin < 3
        error('please input ����ֵ,���� ');
    end
     x = (a + b)/2 ;
     if (fun(x) == 0)
         answer = x;
         printf('answer is %d',answer);
     end
     
     while abs(b - a)>judge
         if fun(a)*fun(x) < 0
            b = x;
         else
            a = x;
         end
         x = (a + b)/2;
     end
     answer = x;
     printf('answer is %d',answer)
end

