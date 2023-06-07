function [distance] = distance_cluster(cluster_1,cluster_2)
[points_1,~] = size(cluster_1);
[points_2,~] = size(cluster_2);
distance_array = zeros(1, points_1 * points_2);
count = 1;
for i=1:points_1
    for j=1:points_2
        distance_array(count) = sum(abs(cluster_1(i,:) - cluster_2(j,:)));
        count = count +1;
    end
end
distance = max(distance_array); 