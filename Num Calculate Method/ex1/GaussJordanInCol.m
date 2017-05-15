function x = GaussJordanInCol(A,b)
 
  [m,n] = sieof(A);
  if(m~=n)
     printf('Error:This is a not a square matrix') 
  end
  Ab = [A b];
  nb = n +1 ;
  for k = 1:n
      pivot = max(abs(A(k:n,k)));%��һ��
      [m1,n1] = find(A==pivot);
      l = m1;
      if pivot == 0,
          error('�˷���Ϊ���췽��');  %�ڶ���
      else
          Ab([k,l],:) = Ab([l,k],:);%��������������k�͵�l��,����������Ӧ��b
          for j = k+1:n
              Ab(k,j) = Ab(k,j)/Ab(k,k); %���Ĳ�
          end
          %���岽
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



