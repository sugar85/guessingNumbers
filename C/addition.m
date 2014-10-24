function [found,result_template,rs] = addition(X,template,result,a,b,m,temp,r)
fi = find(strcmp(template,[a,'+',b]));
if(size(fi,1) > 0)
found=1;
result_template=[temp;template{fi(1),1}];
rs=[r;result(fi(1))];
return;
end;
begin = find(strcmp(X(:,1),a));
index = 1;
found = 0;
while(index <= size(begin,1) && found==0)
	j = begin(index);
	var = template{j,1};
	inver_var = [X{j,2},'+',X{j,1}];
	if(size(find(strcmp(temp,var)),1) == 0 && size(find(strcmp(temp,inver_var)),1) == 0)
		next = X{j,2};
		[found,result_template1,rs1] = addition(X,template,result,next,b,m,[temp;{var}],[r;result(j)]);
		if (found == 1 && mod(size(rs1,1),2)==1)
			rs = rs1;
			result_template=result_template1;
			return;
		else
			found = 0;
		end;
	end;
	index = index +1;
end;
end