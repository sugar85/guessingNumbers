f = fopen('input.txt');
fo = fopen('output.txt', 'w');
cases = str2num(fgetl(f));
for(case_number = 1:cases)
s = strsplit(fgetl(f),' ');
number_needed_tiles = str2num(s{1,1});
size_tile = str2num(s{1,2});
m = fix(size_tile/2);
even = mod(size_tile,2) == 0;
X= ones(m);
tiles = zeros(1, number_needed_tiles);
for(i=1:number_needed_tiles)
	tiles(1,i) = str2num(s{1,i+2});
end;
tiles = sort(tiles, 'descend');
i = 1;
while(i <= number_needed_tiles)
	if(tiles(1,i) > 0)
		contains = 0;
		new_added = 0;
		while (contains == 0)
			[contains, X] = findTile(X, m,tiles(1,i), new_added);
			if(contains == 0)
				X = [X;ones(m)];
				new_added = 1;
			end;
		end;
	else
		number1 = number_needed_tiles - i + 1;
		if(m == 0)
			rest = 1;
		else
			[k,h] = size(find(X));
			rest = k * h * 4;
		end;
		if(even == 0)
			rest = rest + m * 2 + 1;
		end;
		while(rest < number1)
			if(m==0)
				rest = rest + 1;
			else
				X = [X;ones(m)];
				rest = rest + m * m * 4;
			end;		
			if(even == 0)
				rest = rest + m * 2 + 1;
			end;
		end;
		i = number_needed_tiles + 1;
	end;
	i = i+1;
end;
if(m==0)
	fprintf(fo,'Case #%d: %d\n',case_number, rest);
else
	fprintf(fo,'Case #%d: %d\n',case_number, size(X,1)/m);
end;
pause;
end;
fclose(f);
fclose(fo);