function x = GaussJordanInCol(A,b)
 
  [m,n] = sieof(A);
  if(m~=n)
     printf('Error:This is a not a square matrix') 
  end
  Ab = [A b];
  nb = n +1 ;
  for k = 1:n
      pivot = max(abs(A(k:n,k)));%第一步
      [m1,n1] = find(A==pivot);
      l = m1;
      if pivot == 0,
          error('此方程为奇异方程');  %第二步
      else
          Ab([k,l],:) = Ab([l,k],:);%第三步：交换第k和第l行,包括交换对应的b
          for j = k+1:n
              Ab(k,j) = Ab(k,j)/Ab(k,k); %第四步
          end
          %第五步
          for i = 1:n; 
            if i~=k
              Ab(i,nb) = Ab(i,nb) - Ab(i,k)*Ab(i,nb);
            end
            for j = k+1:n;
                Ab(i,j) = Ab(i,j) - Ab(i,k)*Ab(k,j);
            end
          end
      end
  end
   x = Ab(1:n,nb);
end



