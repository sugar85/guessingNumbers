function X = processingImage1(s)
I = imread(s);
if(isrgb(I))
	I = rgb2gray(I);
end;
I = im2double(255 - I);

[i j] = find(I);
rMin=min(i);
cMin=min(j);
rMax=max(i);
cMax=max(j);
J=I(rMin:rMax,cMin:cMax);
J=imresize(J,[20,20]);

%compute center of mass and move into 28*28
c=regionprops(J>0,'centroid');
x = fix(c.Centroid(1));
y = fix(c.Centroid(2));
[m n] = size(J);
J = [zeros(m,14-x), J ,zeros(m,x-6)];
J = [zeros(14-y,28); J ; zeros(y-6, 28)];
X=J'(:)';
end