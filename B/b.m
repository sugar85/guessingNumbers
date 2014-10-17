f = fopen('B-large-practice.in');
%f = fopen('input.txt');
fo = fopen('outputB_large.txt', 'w');
cases = str2num(fgetl(f));
for(case_number = 1:cases)
	s = strsplit(fgetl(f),' ');
	m = str2num(s{[1]});
	dir = s{[2]};
	X=zeros(m,m);
	for (i=1:m)
		s = strsplit(fgetl(f),' ');
		for(j=1:m)
			X(i,j)=str2num(s{[j]});
		end;
	end;
	if(strcmp(dir,'up')==1)
		X = X';
		y = calculate(X,m,0)';
	elseif(strcmp(dir,'left') == 1)
		y = calculate(X,m,0);
	elseif(strcmp(dir,'down'))
		X = X';
		y = calculate(X,m,1)';
	else
		y = calculate(X,m,1);
	end;
	fprintf(fo,'Case #%d:\n',case_number);
	for(indx = 1:m)
		fprintf(fo,'%d ',y(indx,:));
		fprintf(fo,'\n');
	end;
end;
fclose(f);
fclose(fo);