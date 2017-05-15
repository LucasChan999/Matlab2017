function t = zuni_newton(x0,N,excel,fun)
     k = 1;
     p = 0.5; 
     t = zeros(N);
     t(1) = x0;
     syms z;    
     funs = diff(fun);
     M = zeros(N);
     a = zeros(N);
     while k~=N
       m = 0;
       while(1)
          if abs( subs( fun,z,(t(k) - p^m*subs(fun,z,t(k)) /subs(funs,z,t(k))) )) < abs(subs(fun,z,t(k)));
             M(k) = m;
             break;
          end
          m = m+ 1;
       end
       a(k) = p^(M(k));
       t(k+1) = t(k) - a(k)*subs(fun,z,t(k))/subs(funs,z,t(k));    
       if (abs( t(k+1) - t(k) ) < excel) 
           break;
       end
       k = k + 1;
     end%end of while
end