f = fopen('input.txt');
fo = fopen('output.txt', 'w');
cases = str2num(fgetl(f));
for(case_number = 1:cases)
	m=str2num(fgetl(f));
	results=[];
	template=cell();
	X=cell();
	for(i=1:m)
		s = strsplit(fgetl(f),'=');
		results = [results;str2num(s{1,2})];
		variables = s{1,1};
		split = strsplit(variables,'+');
		template=[template;{variables}];
		X=[X;split];	
		if(strcmp(split{1,1},split{1,2}) == 0)
			inver_split = {split{1,2},split{1,1}};
			inver_template = [split{1,2},'+',split{1,1}];
			template=[template;{inver_template}];
			X=[X;inver_split];
			results = [results;str2num(s{1,2})];
		end;
	end;
	q=str2num(fgetl(f));
	fprintf(fo,'Case #%d:\n',case_number);
	calculated = cell();
	y=cell();
	for(i=1:q)
		s=fgetl(f);
		douplicate=find(strcmp(calculated,s)==1);
		calculated=[calculated;{s}];
		
		if(size(douplicate > 0))
			calculated_op = y{douplicate(1),1};
		else
			vars=strsplit(s,'+');
			[found, temp, r]=addition(X,template,results,vars{1,1},vars{1,2},m,cell(),[]);
			temp
			r
			vars
			pause;
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
			else
				calculated_op=s;
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