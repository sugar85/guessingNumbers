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