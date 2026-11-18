% This script compares the prices of a used Nissan Leaf using a least
% squares model.

%  Run extract FIRST. Read data and creates year, costinGBP, mileage, range_miles,
% private_seller and number_cars


n = number_cars;
one = ones(n,1);
mileage_in_thousands = mileage/1000;
age_years = 2021 - year;

% Descriptions of the models:
names = ["1  cost ~ range", "2  cost ~ range + range^2", "3  cost ~ range + range^2 + range^3", "4  cost ~ mileage", "5  cost ~ age", "6  cost ~ range + age", "7  cost ~ range + mileage", "8  cost ~ range + mileage + age", "9  cost ~ range + age + seller", "10 cost ~ range + mileage + age + seller", "11 cost ~ range + age + age^2"];

% Storage for the error of each model:
ssr_all = zeros(11,1);
rel_all = zeros(11,1);
m_all = zeros(11,1);

% Straight line fit of cost against range
[cB, sum_B] = least_squares_B(range_miles, costinGBP);
fprintf('least_squares_B: cost = %f*range + %f\n', cB(1), cB(2));
fprintf('Sum of residuals squared = %f\n\n', sum_B);

% Matrices for the models:
A1 = [range_miles one];
A2 = [range_miles range_miles.^2 one];
A3 = [range_miles range_miles.^2 range_miles.^3 one];
A4 = [mileage_in_thousands one];
A5 = [age_years one];
A6 = [range_miles age_years one];
A7 = [range_miles mileage_in_thousands one];
A8 = [range_miles mileage_in_thousands age_years one];
A9 = [range_miles age_years private_seller one];
A10 = [range_miles mileage_in_thousands age_years private_seller one];
A11 = [range_miles age_years age_years.^2 one];

% Now we fit each model and count the coeffecients of each matrix
[c1, ssr, rel] = least_squares_fit(A1, costinGBP);
ssr_all(1) = ssr;
rel_all(1) = rel;
[rows, columns] = size(A1);
m_all(1) = columns;

[c2, ssr, rel] = least_squares_fit(A2, costinGBP);
ssr_all(2) = ssr;
rel_all(2) = rel;
[rows, columns] = size(A2);
m_all(2) = columns;

[c3, ssr, rel] = least_squares_fit(A3, costinGBP);
ssr_all(3) = ssr;
rel_all(3) = rel;
[rows, columns] = size(A3);
m_all(3) = columns;

[c4, ssr, rel] = least_squares_fit(A4, costinGBP);
ssr_all(4) = ssr;
rel_all(4) = rel;
[rows, columns] = size(A4);
m_all(4) = columns;

[c5, ssr, rel] = least_squares_fit(A5, costinGBP);
ssr_all(5) = ssr;
rel_all(5) = rel;
[rows, columns] = size(A5);
m_all(5) = columns;

[c6, ssr, rel] = least_squares_fit(A6, costinGBP);
ssr_all(6) = ssr;
rel_all(6) = rel;
[rows, columns] = size(A6);
m_all(6) = columns;

[c7, ssr, rel] = least_squares_fit(A7, costinGBP);
ssr_all(7) = ssr;
rel_all(7) = rel;
[rows, columns] = size(A7);
m_all(7) = columns;

[c8, ssr, rel] = least_squares_fit(A8, costinGBP);
ssr_all(8) = ssr;
rel_all(8) = rel;
[rows, columns] = size(A8);
m_all(8) = columns;

[c9, ssr, rel] = least_squares_fit(A9, costinGBP);
ssr_all(9) = ssr;
rel_all(9) = rel;
[rows, columns] = size(A9);
m_all(9) = columns;

[c10, ssr, rel] = least_squares_fit(A10, costinGBP);
ssr_all(10) = ssr;
rel_all(10) = rel;
[rows, columns] = size(A10);
m_all(10) = columns;

[c11, ssr, rel] = least_squares_fit(A11, costinGBP);
ssr_all(11) = ssr;
rel_all(11) = rel;
[rows, columns] = size(A11);
m_all(11) = columns;

% Now we print the comparisson table:
fprintf('Model\n');
fprintf('\tCoefficients\tSum of squared residuals\tAverage relative error\n');
for k = 1:11
    fprintf('%s\n', names(k));
    fprintf('\t%d\t%f\t%f\n', m_all(k), ssr_all(k), rel_all(k));
end

% Finally, we print the coefficients fitted
% Print the fitted coefficients (last coefficient is the constant)
fprintf('\nFitted coefficients:\n');
fprintf('Model 1: '); fprintf('%f ', c1); fprintf('\n');
fprintf('Model 2: '); fprintf('%f ', c2); fprintf('\n');
fprintf('Model 3: '); fprintf('%f ', c3); fprintf('\n');
fprintf('Model 4: '); fprintf('%f ', c4); fprintf('\n');
fprintf('Model 5: '); fprintf('%f ', c5); fprintf('\n');
fprintf('Model 6: '); fprintf('%f ', c6); fprintf('\n');
fprintf('Model 7: '); fprintf('%f ', c7); fprintf('\n');
fprintf('Model 8: '); fprintf('%f ', c8); fprintf('\n');
fprintf('Model 9: '); fprintf('%f ', c9); fprintf('\n');
fprintf('Model 10: '); fprintf('%f ', c10); fprintf('\n');
fprintf('Model 11: '); fprintf('%f ', c11); fprintf('\n');