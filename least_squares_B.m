function [coeffs, sum_of_residuals] = least_squares_B(x,y)

% Function purpose:
% fits the data to a straight line

%Inputs:
% x is the column vector for range values (in miles)
% y is the column vector of costs (in GBP)

%Outputs:
% coeffs gives a column vector [a,b] 
%       a is the slope of the line (cost per mile in range)
%       b is th y-intercept of the line (fixed cost when the range is zero)
% sum_of_residuals measures how well the line fits the data

n = length(x);

% Create matrix with first column x (as slope) and second column ones (as
% the intercept.
A = [x ones(n,1)];

% Solve the system A*coeffs = y
coeffs = A\y;

% Residuals and the sum of their squares
R = y - A*coeffs;
sum_of_residuals = sum(R.^2);

end

