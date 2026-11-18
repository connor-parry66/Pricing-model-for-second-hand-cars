% Extracts data from CarData.dat and assigns unique variables

% Opens the file 
fid = fopen('CarData.dat', 'r');
if fid == -1
    error('File not found, check folder path');
end

% Read the headers
source_line = fgetl(fid);       % Line 1, containing source and date
carmodel_line = fgetl(fid);     % Line 2, containing the car model
fgetl(fid);                     % Blank
fgetl(fid);                     % Column titles so discard 

% Read numerical data
data = fscanf(fid,'%f %f %f %f %f\n');     %Formats data as a string, and reads data as a matrix until the end of the page
                       
% Each car has 5 data points, so
number_cars = length(data)/5;


% Closing the file
fclose(fid);

%Assigning variables
year = data(1:5:5*number_cars);           % Registered year
costinGBP = data(2:5:5*number_cars);        %GBP cost
mileage = data(3:5:5*number_cars);          % Mileage in miles
range_miles = data(4:5:5*number_cars);           % Range in miles
private_seller = data(5:5:5*number_cars);    % 1 if private, 0 if commercial

fprintf('%s\n', source_line);
fprintf('%s\n', carmodel_line);
fprintf('Read %d cars\n', number_cars);




