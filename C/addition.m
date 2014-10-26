function [found,rs] = addition(x,a,b,temp,r)
found = 0;
rs=[];
for(for[val, key] = x.(a))
	if(size(strfind(temp,[';',key,';']),1) == 0)
		if(strcmp(b,key) == 1)
			if(mod(size(r,1),2)==0)
				found = 1;
				rs=[r;val];
				return;
			end;
		else	
			[found,rs1] = addition(x,key,b,[temp,key,';'],[r;val]);
		end;
		
		if (found == 1 && mod(size(rs1,1),2)==1)
			rs = rs1;
			return;
		else
			found = 0;
		end;
	end;
end;
end