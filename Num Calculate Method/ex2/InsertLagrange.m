%���ƣ�InsertLagrange.m
%ժҪ��ʹ���������ղ�ֵ�����u�ĺ���
%������ڣ�2016/11/29
function [u,v]= InsertLagrange( x,y,u )
%u:��ֵ v:���ݲ�ֵ����ĺ���ֵ x,y:��֪�ĺ�������ֵ
 if(length(x)~=lengtj(y))
    printf('Error input x and y');
 else
    n = length(x);
    v = 0;
    l = ones(n);
    for j = 1:n
        for i = 1:n
            if(i~=j)
            l(j) =l(j) * (u-x(i))/(x(j) - x(i));
            end
        end%end of for i
        v = v + l(j)*y(i);
    end%end of for j
 end%end of else
end

