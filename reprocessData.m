%load training data
training = fopen('train-images.idx3-ubyte','r','ieee-be');
I = fread(training,4,'uint32');
numbers = I(2);
m = I(3);
n = I(4);
input_layers = m*n;

%load training label
labels = fopen('train-labels.idx1-ubyte','r','ieee-be');
y_begin = fread(labels,2,'uint32');

Xval = [];
yval = [];

for k=1:10
X = [];
y = [];
for i=6:6:6000
A = fread(training,input_layers * 6,'uint8');
b = fread(labels,6,'uint8');

for j =1:6
if(b(j) == 0)
b(j)=10;
end;
end;

tmp = double(reshape(A,m*n,6)')/255;

Xval = [Xval;tmp(6,:)];
yval = [yval;b(6,:)];

X = [X;tmp(1:5,:)];
y = [y;b(1:5,:)];
if(mod(i,1000) == 0)
fprintf('X %d, Xval %d\n', size(X,1), size(Xval,1));
pause;
end;
end;
s = strcat('trainingData-',int2str(k),'.mat');
save(s, "X", "y");
end;

fprintf('Begin training with cross validation data %d \n', size(Xval,1));
fprintf('Program paused. Press enter to continue.\n');
pause;
save 'crossValidationData.mat' Xval yval;

fflush(training);
fclose(training);

fflush(labels);
fclose(labels);