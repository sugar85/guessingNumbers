function J = cost(X,y, nn_params,...
					lambda,...
					input_layer_size,...
					hidden_layer_size)

Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));
J = 0;
m = size(X, 1);		 
X = [ones(m,1),X];
z2 = X * Theta1';
a = sigmoid(z2);
a = [ones(m,1),a];
h = sigmoid(a * Theta2');
temp = zeros(m,num_labels);
for i=1:m
temp(i,y(i)) = 1;
end; 
theta1_no_bias = Theta1(:,2:size(Theta1,2));
theta2_no_bias = Theta2(:,2:size(Theta2,2));
J =  -1/m * sum(sum(temp .* log(h) + (1-temp) .* log(1 - h),2)) + lambda/(2*m)*(sum(sum(theta1_no_bias .* theta1_no_bias)) + sum(sum(theta2_no_bias .* theta2_no_bias)));

end