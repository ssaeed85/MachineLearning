load('ex6data3.mat');

C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
C_array = [0.01,0.03,0.1,0.3,1,3,10,30];
sigma_array = [0.01,0.03,0.1,0.3,1,3,10,30];
errors = zeros(length(C_array), length(sigma_array));

for i = 1:8
    for j = 1:8
        model= svmTrain(X, y, C_array(i), @(x1, x2) gaussianKernel(x1, x2, sigma_array(j))); 
        predictions = svmPredict(model, Xval);
        errors(i,j) = mean(double(predictions ~= yval));
    end
end 

[i,j] = find(errors == min(min(errors)));

C = C_array(i);
sigma = sigma_array(j);