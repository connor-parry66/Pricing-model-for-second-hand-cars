
function [coeffs, sum_of_residuals, av_rel_error] = least_squares_fit(A, y)

% Purpose of function:
% Uses least squares to fit y for any model that has linear coefficients
% and measures how well the model represents the data

% Inputs:
% A is the n by m  matrix 
% y is the  vector of costs in GBP

% Outputs:
% coeffs is the column vector of m fitted coefficients
% sum_of_residuals is the sum of the squared residuals (in GBP^2)
% av_rel_error is the average relative error |fitted - actual|/actual
% over all the cars (0.1 means 10%)

% Solve the system A*coeffs = y
coeffs = A\y;

% Fitted costs and residuals
fitted = A*coeffs;
R = y - fitted;

% Sum of squared residuals 
sum_of_residuals = sum(R.^2);

% Relative error of each car, then the average
av_rel_error = mean(abs((fitted - y)./y));

end
