function J = downSampling(I)
%low_pass_filter = fspecial('average',[3,3]);
low_pass_filter = fspecial('gaussian',[3,3]);
J = imfilter(I,low_pass_filter,'replicate');
i=floor(size(I,1)/2);
j=floor(size(I,2)/2);
while i > 0
J(i * 2,:)=[];
i = i-1;
end;
while j>0
J(:,j*2)=[];
j=j-1;
end;
[m n]=size(J);
min = min(min(J));
max = max(max(J));
for i=1:m
	for j=1:n
		% normalize
		J(i,j) = (J(i,j) - min)/(max - min); 
	end;
end;
end