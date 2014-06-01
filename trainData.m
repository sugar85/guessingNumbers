%training and plot validation curve with vector lambda

%initial weights
input_layers = 28 * 28;
hidden_units = 300;
initial_Theta1 = randInitializeWeights(input_layers, hidden_units);
initial_Theta2 = randInitializeWeights(hidden_units, 10);

%Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

[lambda_vec, error_train, error_val] = validationCurve(initial_nn_params, hidden_units,input_layers);

close all;
plot(lambda_vec, error_train, lambda_vec, error_val);
legend('Train', 'Cross Validation');
xlabel('lambda');
ylabel('Error');

fprintf('lambda\t\tTrain Error\tValidation Error\n');
for i = 1:length(lambda_vec)
	fprintf(' %f\t%f\t%f\n', ...
            lambda_vec(i), error_train(i), error_val(i));
end

fprintf('Program paused. Press enter to continue.\n');
pause;

%calculate error test with chosen lambda
%fileTestX = fopen('t10k-images.idx3-ubyte','r','ieee-be');
%fileTesty = fopen('t10k-labels.idx1-ubyte','r','ieee-be');
%fread(fileTestX, 4,'uint32');
%Xtest = fread(fileTestX,'uint8');
%fread(fileTesty, 2,'uint32');
%ytest = fread(fileTesty,'uint8');

%for i=1:10000
%if(ytest(i) == 0)
%ytest(i)=10;
%end; 
%end;

% Obtain Theta1 and Theta2 back from nn_params
%Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
%                 hidden_layer_size, (input_layer_size + 1));

%Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
%                 num_labels, (hidden_layer_size + 1));
				 
%pred = predict(Theta1, Theta2, Xtest);
%fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == ytest)) * 100);