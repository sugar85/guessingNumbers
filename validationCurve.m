function [lambda_vec, error_train, error_val] = ...
    validationCurve(initial_nn_params,hidden_units,input_layers)
%VALIDATIONCURVE Generate the train and validation errors needed to
%plot a validation curve that we can use to select lambda
%   [lambda_vec, error_train, error_val] = ...
%       VALIDATIONCURVE(X, y, Xval, yval) returns the train
%       and validation errors (in error_train, error_val)
%       for different values of lambda. You are given the training set (X,
%       y) and validation set (Xval, yval).
%

% Selected values of lambda (you should not change this)
lambda_vec = [0 0.001 0.003 0.01 0.03 0.1 0.3 1 3 10]';

% You need to return these variables correctly.
error_train = zeros(length(lambda_vec), 1);
%error_val = zeros(length(lambda_vec), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return training errors in 
%               error_train and the validation errors in error_val. The 
%               vector lambda_vec contains the different lambda parameters 
%               to use for each calculation of the errors, i.e, 
%               error_train(i), and error_val(i) should give 
%               you the errors obtained after training with 
%               lambda = lambda_vec(i)
%
% Note: You can loop over lambda_vec with the following:
%
%       for i = 1:length(lambda_vec)
%           lambda = lambda_vec(i);
%           % Compute train / val errors when training linear 
%           % regression with regularization parameter lambda
%           % You should store the result in error_train(i)
%           % and error_val(i)
%           ....
%           
%       end
%
%

% Create "short hand" for the cost function to be minimized

lambda = 0;
options = optimset('MaxIter', 50);
costFunction = @(p) nnCostFunction(p, ...
                                   input_layers, ...
                                   hidden_units, ...
                                   10, lambda);

%load('crossValidationData.mat');								   
								   
for i=2:length(lambda_vec)
lambda = lambda_vec(i);

nn_params = initial_nn_params;
% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)

[nn_params, costJ] = fmincg(costFunction, nn_params, options);

%error_train(i) = costJ;
%error_val(i) = cost(Xval,yval, nn_params,	lambda, input_layers, hidden_units);

fprintf('lambda = %f. Program paused. Press enter to continue.\n',lambda);

Theta1 = reshape(nn_params(1:hidden_units * (input_layers + 1)), ...
                 hidden_units, (input_layers + 1));

Theta2 = reshape(nn_params((1 + (hidden_units * (input_layers + 1))):end), ...
                 10, (hidden_units + 1));
				 
s = strcat('trainedWeight-',num2str(lambda),'.mat');
save(s,"Theta1","Theta2");
end;

% =========================================================================

end
