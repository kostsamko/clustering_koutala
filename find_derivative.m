function [derivative_array] = find_derivative(data)
[number_of_points,features] = size(data);
derivative_array = zeros(number_of_points, features-1);
for i=1:number_of_points
    for j=2:features
        derivative_array(i,j-1) = data(i,j) - data(i,j-1) ;
    end
end