function X = processingImage(s)
I = im2double(255 - rgb2gray(imread(s)));
[i j] = find(I);
rMin=min(i);
cMin=min(j);
rMax=max(i);
cMax=max(j);
J=I(rMin:rMax,cMin:cMax);
[m n]=size(J);
while m>80 || n>80
J=downSampling(J);
[m n]=size(J);
end;
add_rows=80-m;
add_cols=80-n;

add_begin_row=floor(add_rows/2);
add_end_row=add_rows - add_begin_row;
J=[zeros(add_begin_row,n);J;zeros(add_end_row,n)];

add_begin_col=floor(add_cols/2);
add_end_col=add_cols - add_begin_col;
J = [zeros(80,add_begin_col) J zeros(80,add_end_col)];

for i=1:2
J=downSampling(J);
end;

X=J(:)';
end