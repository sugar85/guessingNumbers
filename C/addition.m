function [found,temp,r] = addition(X,template,result,a,b,m,temp,r)
begin = find(strcmp(X(:,1),a));
index = 1;
found=0;
while(index <= size(begin,1) && found==0)
	j = begin(index);
	var = template{j,1};
	if(size(find(strcmp(temp,var)==1)) == 0)
		r = [r;result(j)];
		temp = [temp;var];
		next = X{j,2};
		found = strcmp(next,b);
		if(found == 0)
			[found,temp,r] = addition(X,template,result,next,b,m,temp,r);
		else
			return;
		end;
	end;
	index = index +1;
end;
end