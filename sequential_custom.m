function [clustering_index]=sequential_custom(data,cut_off_1,cut_off_2,cut_off_3)
[number_of_points,~] = size(data);
clustering_index = zeros(1,number_of_points);
derivative_array = find_derivative(data);
% assign the first point to cluster
clustering_index(1) = 1;
for i=2:number_of_points
    is_similar_index = find_similar_derivative_pattern(derivative_array,i-1,cut_off_1,cut_off_2,cut_off_3);
    if is_similar_index ~= 0
        clustering_index (i) = clustering_index(is_similar_index);
    else
        clustering_index (i) = max(clustering_index) + 1;
    end
end