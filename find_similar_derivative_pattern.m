function [is_similar_index] = find_similar_derivative_pattern(derivative_array,index,cut_off_1,cut_off_2, cut_off_3)
[~, feature_size] = size(derivative_array);
is_similar_index = 0;
current_derivative = derivative_array(index+1,:);
for i=index:-1:1
    is_similar = true;
    for j=1:feature_size
        if current_derivative(j) >0 && derivative_array(i,j) > 0 && current_derivative(j) > cut_off_1 && derivative_array(i,j) > cut_off_1
            is_similar = is_similar && true;
        elseif current_derivative(j) < 0 && derivative_array(i,j) < 0 && abs(current_derivative(j)) > cut_off_1 && abs(derivative_array(i,j)) > cut_off_1
            is_similar = is_similar && true;
        elseif current_derivative(j) > 0 && current_derivative(j) < cut_off_1 && derivative_array(i,j) > 0 && derivative_array(i,j) < cut_off_1 && abs(current_derivative(j)-derivative_array(i,j)) < cut_off_2
            is_similar = is_similar && true;
        elseif current_derivative(j) < 0 && abs(current_derivative(j)) < cut_off_1 && derivative_array(i,j) < 0 && abs(derivative_array(i,j)) < cut_off_1 && abs(current_derivative(j)-derivative_array(i,j)) < cut_off_2
            is_similar = is_similar && true;
        elseif abs(current_derivative(j)) < cut_off_3 && abs(derivative_array(i,j)) < cut_off_3
            is_similar = is_similar && true;
        else
            is_similar = is_similar && false;
        end
    end
    if is_similar
        is_similar_index = i;
        break;
    end
end