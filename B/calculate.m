function y = calculate(X,m,right)
for (i=1:m)
	if(right == 1)
		j=m;
		no_plus = m+1;
		while(j>1)
			if ((X(i,j-1)==X(i,j)) && (j!=no_plus))
				X(i,j) = X(i,j) + X(i,j-1);
				X(i,j-1) = 0;
				no_plus = j;
				j = j - 1;
			elseif (X(i,j) == 0 && X(i,j-1) !=0)
				X(i,j) = X(i,j-1);
				X(i,j-1) = 0;
				if (j < m)
					j = j + 1;
				end;
			else
				j = j-1;
			end;
		end;
	else
		j=1;
		no_plus=0;
		while(j<m)
			if ((X(i,j)==X(i,j+1)) && (j!=no_plus))
				X(i,j) = X(i,j) + X(i,j+1);
				X(i,j+1) = 0;
				no_plus = j;
				j = j + 1;
			elseif (X(i,j) == 0 && X(i,j+1)!=0)
				X(i,j) = X(i,j+1);
				X(i,j+1) = 0;
				if (j > 1)
					j = j - 1;
				end;
			else
				j = j+1;
			end;
		end;
	end;
end;
y = X;
end