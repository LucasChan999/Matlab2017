%名称：InsertLagrange.m
%摘要：使用拉格朗日插值法求解u的函数
%完成日期：2016/11/29
function [u,v]= InsertLagrange( x,y,u )
%u:插值 v:根据插值计算的函数值 x,y:已知的函数坐标值
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

