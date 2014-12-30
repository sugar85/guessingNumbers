function X = processingImage(s)
I = imread(s);
if(isrgb(I))
	I = rgb2gray(I);
end;
I = im2double(255 - I);
[m n]=size(I);
[i j] = find(I);

rMin=min(i);
cMin=min(j);
rMax=max(i);
cMax=max(j);
J=I(rMin:rMax,cMin:cMax);

while m>112 || n>112
J=downSampling(J);
[m n]=size(J);
end;

add_rows=112-m;
add_cols=112-n;

add_begin_row=fix(add_rows/2);
add_end_row=add_rows - add_begin_row;
J=[zeros(add_begin_row,n);J;zeros(add_end_row,n)];

add_begin_col=floor(add_cols/2);
add_end_col=add_cols - add_begin_col;
J = [zeros(112,add_begin_col) J zeros(112,add_end_col)];

for i=1:2
J=downSampling(J);
end;

X=J'(:)';
end