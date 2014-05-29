% load training data
training = fopen('train-images.idx3-ubyte','r','ieee-be');
I = fread(training,4,'uint32');
numbers = I(2);
m = I(3);
n = I(4);

% load training label
labels = fopen('train-labels.idx1-ubyte','r','ieee-be');
y_begin = fread(labels,2,'uint32');

p = 5000;
number_pixels = p * 28 * 28;
for(i=1:numbers/p)
A = fread(training,number_pixels,'uint8');
X = reshape(A, m * n, p)';

y = fread(labels,p,'uint8');
%training data
end;
