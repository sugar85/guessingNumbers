%f = fopen('input.txt');
f = fopen('C-large-practice.in');
fo = fopen('output-large.txt', 'w');
cases = str2num(fgetl(f));
for(case_number = 1:cases)
	m=str2num(fgetl(f));
	x=struct();
	double=cell();
	for(i=1:m)
		s = strsplit(fgetl(f),'=');
		vars = strsplit(s{1,1},'+');
		res = str2num(s{1,2});
		if(strcmp(vars{1,1},vars{1,2}) == 1)
			double=[double;{vars{1,1}}];
			
			if(isfield(x,vars{1,1}))
				r = x.(vars{1,1});
			else
				r=struct();
			end;
			r=setfield(r,vars{1,2},res);
			x=setfield(x,vars{1,1},r);
		else
			if(isfield(x,vars{1,1}))
				r = x.(vars{1,1});
			else
				r=struct();
			end;
			r=setfield(r,vars{1,2},res);
			x=setfield(x,vars{1,1},r);
		
			if(isfield(x,vars{1,2}))
				r = x.(vars{1,2});
			else
				r=struct();
			end;
			r=setfield(r,vars{1,1},res);
			x=setfield(x,vars{1,2},r);
		end;
	end;

	tmp_size = size(double,1)-1;
	for(i=1:tmp_size)
		a=double{i,1};
		for(j=i+1:tmp_size+1)
			b=double{j,1};
			res = (x.(a).(a) + x.(b).(b))/2;
			
			r = x.(a);
			r=setfield(r,b,res);
			x.(a)=r;
			
			r1 = x.(b);
			r1.(a)=res;
			x.(b)=r1;
			
		end;
	end;
	
	q=str2num(fgetl(f));
	fprintf(fo,'Case #%d:\n',case_number);
	calculated = cell();
	y=cell();
	
	for(i=1:q)
		s=fgetl(f);		
		vars=strsplit(s,'+');
		calculated_op=s;
		
		if(isfield(x,(vars{1,1})) && isfield(x,vars{1,2}))
			r=x.(vars{1,1});
			if(isfield(r,vars{1,2}))
				result=r.(vars{1,2});
				calculated_op=[s,'=',num2str(result)];
			else
				[found, r]=addition(x,vars{1,1},vars{1,2},';',[]);
				if(found == 1 && mod(size(r,1),2)==1)
					result = 0;
					for(j=1:size(r,1))
						if(mod(j,2)==1)
							result = result + r(j);
						else
							result = result - r(j);
						end;				
					end;
					calculated_op=[s,'=',num2str(result)];
					r1 = x.(vars{1,1});
					r1.(vars{1,2}) = result;
					x.(vars{1,1}) = r1;
					
					r2 = x.(vars{1,2});
					r2.(vars{1,1}) = result;
					x.(vars{1,2}) = r2;					
				end;
			end;
		end;
		
		if(index(calculated_op,'=') > 0)
			fprintf(fo,'%s\n',calculated_op);
		end;
		y=[y;{calculated_op}];
	end;
end;
fclose(f);
fclose(fo);