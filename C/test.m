function y=test(x)
if x<5000
	x
	y=test(x+1);
else
	y=x;
end;
end