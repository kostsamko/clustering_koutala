function [clustering_index_merged]=hier_custom(clustered_data,clustering_index,new_number_of_clusters)
[~,number_of_clusters] = size(clustered_data);
D = zeros(number_of_clusters, number_of_clusters);
for i=1:number_of_clusters
    temp_der1 = find_derivative(clustered_data{i});
    for j=1:number_of_clusters
        temp_der2 = find_derivative(clustered_data{j});
        D(i,j) = distance_cluster(temp_der1,temp_der2);
        D(j,i) = D(i,j);
    end
end

Z = linkage(D, "ward");
c = cluster(Z,'Maxclust',new_number_of_clusters);
new_clustering_index = c';
dendrogram(Z);

[~,number_of_points] =size(clustering_index);
clustering_index_merged = zeros(1,number_of_points);
for i=1:new_number_of_clusters
    cluster_indexes = find(new_clustering_index ==i);
    [~,cluster_indexes_size] = size(cluster_indexes);
    for j=1:cluster_indexes_size
        clustering_index_merged(clustering_index == cluster_indexes(j)) = i;
    end
end