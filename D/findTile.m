function [contains, y] = findTile(X, m, tile, new_added)
n = pow2(tile-1);
count = 0;
rows = size(X,1);
if(new_added)
	r = rows - m;
else
	r = 0;	
end;
if(mod(r,m) == 0)
	tmp = m + n-1 - count;
else
	tmp = mod(r,m) + n-1 - count;
end;
while(r+n-1<= rows && count<n)
	if(tmp>m)
		r = ceil(r/m) * m;
	end;
	r=r+1;
	if(mod(r,m) == 0)
		tmp = m + n-1- count;
	else
		tmp = mod(r,m) + n-1- count;
	end;
	c = 1;
	while(tmp<=m && c+n-1<=m && count<n)
		found_col = 1;
		for(i=1:n)
			k = c + i -1;
			if(X(r,k) == 0)
				found_col = 0;
				break;
			end;
		end;
		if(found_col == 1)
			r = r+1;
			if(mod(r,m) == 0)
				tmp = m + n-1- count;
			else
				tmp = mod(r,m) + n-1- count;
			end;
			count = count +1;
		else
			c = k + 1;
			r = r - count;
			if(mod(r,m) == 0)
				tmp = m + n-1- count;
			else
				tmp = mod(r,m) + n-1- count;
			end;
			count = 0;
		end;
	end;
end;
contains = count == n;
if(contains == 1)
	for (i=1:n)
		for(j=1:n)
			X(r-n+i-1, k-n+j)=0;
		end
	end;
end;
y=X;
end