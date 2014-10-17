function J=downSampling1(I)
[m n] = size(I);
k=floor(m/2);
h=floor(n/2);
J=zeros(k,h);
for i=1:k
for j=1:h
J(i,j) = (I((i*2)-1,(j*2)-1) + I((i*2)-1,j*2) + I(i*2,(j*2)-1) + I(i*2,j*2))/4;
end;
end;
end