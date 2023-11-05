function [clustering_validation_array,clustering_validation_pixels_array,validation_metric] = sentinel_validation(original_data,clustering_data,clustering_bel)

% find validation points
validation_data_point_1 = find(all(clustering_data == squeeze(original_data(14,10,:))',2));
validation_data_point_array_1 = find(all(clustering_data == squeeze(original_data(14,11,:))',2));
validation_data_point_2 = validation_data_point_array_1(1);
validation_data_point_3 = validation_data_point_array_1(2);

validation_data_point_array_2 = find(all(clustering_data == squeeze(original_data(16,22,:))',2));
validation_data_point_4 = validation_data_point_array_2(1);
validation_data_point_5 = validation_data_point_array_2(2);
validation_data_point_6 = find(all(clustering_data == squeeze(original_data(16,24,:))',2));
validation_data_point_7 = find(all(clustering_data == squeeze(original_data(16,25,:))',2));

validation_data_point_8 = find(all(clustering_data == squeeze(original_data(17,22,:))',2));
validation_data_point_array_3 = find(all(clustering_data == squeeze(original_data(17,23,:))',2));
validation_data_point_9 = validation_data_point_array_3(1);
validation_data_point_10 = validation_data_point_array_3(2);
validation_data_point_11 = find(all(clustering_data == squeeze(original_data(17,25,:))',2));

validation_points_array = [...
    validation_data_point_1 validation_data_point_2 validation_data_point_3 ...
    validation_data_point_4 validation_data_point_5 validation_data_point_6 ...
    validation_data_point_7 validation_data_point_8 validation_data_point_9 ...
    validation_data_point_10 validation_data_point_11];

validation_points_array_pixels = {...
    '10,14', '11,14', '12,14' ...
    '22,16', '23,16', '24,16', '25,16' ...
    '22,17', '23,17', '24,17', '25,17'
};



[~,validation_points_array_size]=size(validation_points_array);
validation_points_found_array = [];
clustering_validation_array = [];
clustering_validation_pixels_array = {};
number_of_validation_points_clusters = 1;
validation_points_count = 0;
for i=1:validation_points_array_size
    % if the validation point is already belong to one cluster skip
    if sum(validation_points_found_array == validation_points_array(i)) ~= 0
        continue;
    end
    cluster_index = clustering_bel(validation_points_array(i));
    cluster_points_array = find(clustering_bel == cluster_index);
    [~,cluster_points_array_size] = size(cluster_points_array);
    count_validation_points = 0;
    count_no_validation_point = 0;
    % for points belonging to a cluster check which of them belong to
    % the validation points or not
    for j=1:cluster_points_array_size
        % check if point belongs to a cluster is in the validation points
        point_found = false;
        for k=1:validation_points_array_size
            if cluster_points_array(j) == validation_points_array(k)
                count_validation_points = count_validation_points +1;
                validation_points_count = validation_points_count +1;
                validation_points_found_array(validation_points_count) = validation_points_array(k);
                clustering_validation_pixels_array(number_of_validation_points_clusters,1) = {int2str(cluster_index)};
                clustering_validation_pixels_array(number_of_validation_points_clusters,count_validation_points + 1) = validation_points_array_pixels(k);
                point_found =true;
                break;
            end
        end
        if ~point_found
            count_no_validation_point = count_no_validation_point +1;
        end
    end
    clustering_validation_array(number_of_validation_points_clusters,1) = count_validation_points;
    clustering_validation_array(number_of_validation_points_clusters,2) = count_no_validation_point;
    clustering_validation_array(number_of_validation_points_clusters,3) = count_validation_points / (count_validation_points + count_no_validation_point);
    number_of_validation_points_clusters = number_of_validation_points_clusters +1;
end
[validation_clusters, ~] = size(clustering_validation_array);
validation_metric = sum(clustering_validation_array(:,3)) / validation_clusters;