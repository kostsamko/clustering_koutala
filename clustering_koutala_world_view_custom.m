close all
clear
% load image from the file
[D,info] = enviread('WV3_Koutala.dat', 'WV3_Koutala.hdr');
feature_names = {'B1','B2','B3','B4','B5','B6','B7','B8'};
[p,n,l]=size(D);
X_total=reshape(D, p*n,l);
% show image in RGB
rgb_new = zeros(p,n,3);
rgb_new(:,:,1) = D(:,:,5);
rgb_new(:,:,2) = D(:,:,3);
rgb_new(:,:,3) = D(:,:,2);
imshow(rgb_new,'InitialMagnification','fit');
figure(1)
title('RGB image koutala worldview 3 ')
hold off;

% filter all the rows that have in all columns zeros
q = find(sum(X_total,2) ~=0);
filtered_image_array = X_total(q,:);

% run sequential_custom
best_bel_sequential_full = sequential_custom(filtered_image_array,0.04,0.04,0.002);
% transform it to cell for the clustering function
[number_of_points,~] = size(filtered_image_array);
number_of_clusters = max(best_bel_sequential_full);
best_bel_sequential_full_cell = cell(1,number_of_clusters);
for i=1:number_of_clusters
    best_bel_sequential_full_cell{i} = zeros(1,number_of_points);
end
best_bel_sequential_full_cell{number_of_clusters} = best_bel_sequential_full;

% image clusters sequential
[image_clustered_sequential, clustering_cell_sequential,~,~,~,~,~,~,~] ...
    = image_clustering(X_total,filtered_image_array, best_bel_sequential_full_cell, number_of_clusters, p,n, true,["sequential" num2str(number_of_clusters) "clusters"]);

% run hier_custom
new_number_of_clusters = number_of_clusters - 201;
best_bel_hier_custom = hier_custom(clustering_cell_sequential,best_bel_sequential_full,new_number_of_clusters);
% transform it to cell for the clustering function
best_bel_hier_custom_cell = cell(1,new_number_of_clusters);
for i=1:new_number_of_clusters
    best_bel_hier_custom_cell{i} = zeros(1,new_number_of_clusters);
end
best_bel_hier_custom_cell{new_number_of_clusters} = best_bel_hier_custom;

% image clusters after hier
[image_clustered_hier, clustering_cell_hier,~,~,~,~,~,~,~] ...
    = image_clustering(X_total,filtered_image_array, best_bel_hier_custom_cell, new_number_of_clusters, p,n, true,["hier after sequential" num2str(new_number_of_clusters) "clusters"]);
% save('clustering_koutala_world_view_custom')