function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;
% 0:01; 0:03; 0:1; 0:3; 1; 3; 10; 30
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



Cr =[ 0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
sigmar =[ 0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
error = 100*ones(size(C,1),size(sigma,1));

for i = 1:size(Cr,1)
    for j = 1:size(sigmar,1)
        
    model= svmTrain(X, y, Cr(i), @(x1, x2) gaussianKernel(x1, x2, sigmar(j)));
    prediction = svmPredict(model,Xval);
    error(i,j) = mean(double(prediction ~= yval));
    
    end
end

[mi ind] = min(error(:));
[x y] = ind2sub(size(error),ind);
C = Cr(x);
sigma = sigmar(y);





% =========================================================================

end
