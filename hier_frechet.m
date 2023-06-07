function [clustering_index_cell]=hier_frechet(data,number_of_clusters)
[number_of_points,~] = size(data);
D = zeros(number_of_points, number_of_points);
for i=1:number_of_points
    for j=1:number_of_points
        D(i,j) = DiscreteFrechetDist(data(i,:),data(j,:));
        D(j,i) = D(i,j);
    end
end

clustering_index_cell = cell(1,number_of_clusters);

for i=1:number_of_clusters
    Z = linkage(D, "complete");
    c = cluster(Z,'Maxclust',number_of_clusters);
    clustering_index_cell{i} = c';
    % dendrogram(Z);
end