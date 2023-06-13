function [clustering_index_cell]=hier_frechet(data,number_of_clusters)
[number_of_points,~] = size(data);
D = zeros(number_of_points, number_of_points);
for i=2:number_of_points
    for j=1:number_of_points
        D(i,j) = DiscreteFrechetDist(data(i,:)',data(j,:)');
%         distance_max_array = zeros(1,12);
%         for k=1:12
%             distance_min_array = zeros(1,12);
%             for p=1:12
%                 distance_min_array(p) = norm(frechet_1(k,:) - frechet_2(p,:));
%             end
%             distance_max_array(k) = min(distance_min_array);
%         end
%         fr = max(distance_max_array);
        D(j,i) = D(i,j);
    end
end

clustering_index_cell = cell(1,number_of_clusters);

for i=1:number_of_clusters
    Z = linkage(D, "complete");
    c = cluster(Z,'Maxclust',i);
    clustering_index_cell{i} = c';
    % dendrogram(Z);
end