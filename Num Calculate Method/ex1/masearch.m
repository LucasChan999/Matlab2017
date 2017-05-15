%
function masearch( fun,a,b)
  h = (a -b )/n;
  a1 = a ; b1 = a1 + h; k = 1 ; 
  while (b1 < b) 
      if feval(fun,a1)*feval(fun,b1) < 0 
          x1(k) = a1;
          x2(k) = b1;
      else
          a1 = a1 + h;
          b1 = b1 + h;
      end
      
  end


end

