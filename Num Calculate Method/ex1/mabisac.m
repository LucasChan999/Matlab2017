%二分法
function x = mabisac( fun,a,b,excel) %自定义fun函数，例如：fun =@(a)a*a*a - 3*a -1;
   x = (a+b)/2;
   a1 = a ;
   b1 = b;
   if(feval(fun,x) == 0)
      printf('answer is %d',x);
   else 
     while(b1-a1<excel) %当区间长度小于给定精度值的时候 终止运算
         if(feval(fun,x)>0)
            b1 = x;
         else
            a1 = x;
         end
         x = (a1 + b1)/2;
     end
   end
   printf('answer is %d',x);
end

