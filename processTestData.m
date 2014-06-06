%calculate error test with chosen lambda
fileTestX = fopen('t10k-images.idx3-ubyte','r','ieee-be');
fileTesty = fopen('t10k-labels.idx1-ubyte','r','ieee-be');
fread(fileTestX, 4,'uint32');
A = fread(fileTestX,'uint8');
fread(fileTesty, 2,'uint32');
ytest = fread(fileTesty,'uint8');

Xtest=double(reshape(A,28*28,10000)')/255;
for j =1:size(ytest,1)
if(ytest(j) == 0)
ytest(j)=10;
end;
end;

save 'testData.mat' Xtest ytest;

% Obtain Theta1 and Theta2 back from nn_params
%Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
%                 hidden_layer_size, (input_layer_size + 1));

%Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
%                 num_labels, (hidden_layer_size + 1));
				 
%pred = predict(Theta1, Theta2, Xtest);
%fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == ytest)) * 100);