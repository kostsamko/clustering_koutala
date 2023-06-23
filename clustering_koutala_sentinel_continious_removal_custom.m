close all
clear
% load image from the file
[D,info] = enviread('S2_commonarea_mased_CR_MASKED_1-CR.dat', 'S2_commonarea_mased_CR_MASKED_1-CR.hdr');
feature_names = {'B1','B2','B3','B4','B5','B6','B7','B8','B9','B10','B11','B12'};
[p,n,l]=size(D);
X_total=reshape(D, p*n,l);
% cr
% X_total=1 -X_total;


% filter all the rows that have in all columns 1
q = find(sum(X_total,2) ~=12);
filtered_image_array = X_total(q,:);


% basic mineral
fileID = fopen("ALTERATION_MINERALS_1-CR.txt");
mineral_data = textscan(fileID,'%f %f %f %f %f','Delimiter','\t');
fclose(fileID);
mineral_names = {'muscovite','chlorite','goethite','barite','pyrochroite'};
basic_mineral(mineral_data,mineral_names);


% run sequential_custom
best_bel_sequential_full = sequential_custom(filtered_image_array,0.01,0.003);
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
    = image_clustering(X_total,filtered_image_array, best_bel_sequential_full_cell, number_of_clusters, p,n, false,["sequential" num2str(number_of_clusters) "clusters"]);

% run hier_custom
new_number_of_clusters = number_of_clusters - 46;
best_bel_hier_custom = hier_custom(clustering_cell_sequential,best_bel_sequential_full,new_number_of_clusters);
% transform it to cell for the clustering function
best_bel_hier_custom_cell = cell(1,new_number_of_clusters);
for i=1:new_number_of_clusters
    best_bel_hier_custom_cell{i} = zeros(1,new_number_of_clusters);
end
best_bel_hier_custom_cell{new_number_of_clusters} = best_bel_hier_custom;

% image clusters after hier
[image_clustered_hier, clustering_cell_hier,~,~,~,~,~,~,~] ...
    = image_clustering(X_total,filtered_image_array, best_bel_hier_custom_cell, new_number_of_clusters, p,n, false,["hier after sequential" num2str(new_number_of_clusters) "clusters"]);

% cluster clusters with only one signature to one other cluster
% best_bel_hier_custom_removed = best_bel_hier_custom;
% new_number_of_clusters_removed = new_number_of_clusters;
% for i=1:number_of_points
%     if sum(best_bel_hier_custom_removed == best_bel_hier_custom_removed(i)) == 1
%         best_bel_hier_custom_removed(i) = 0;
%         new_number_of_clusters_removed = new_number_of_clusters_removed -1;
%     end
% end
% for i=1:new_number_of_clusters_removed
%     best_bel_hier_custom_removed(best_bel_hier_custom_removed == best_bel_hier_custom_removed(i)) = i;
% end
% % transform it to cell for the clustering function
% best_bel_hier_custom_removed_cell = cell(1,new_number_of_clusters_removed);
% for i=1:new_number_of_clusters_removed
%     best_bel_hier_custom_removed_cell{i} = zeros(1,new_number_of_clusters_removed);
% end
% best_bel_hier_custom_removed_cell{new_number_of_clusters_removed} = best_bel_hier_custom_removed;
% % image clusters after hier and removal
% [image_clustered_hier_removed, clustering_cell_hier_removed,~,~,~,~,~,~,~] ...
%     = image_clustering(X_total,filtered_image_array, best_bel_hier_custom_removed_cell, new_number_of_clusters_removed, p,n, false,["hier after sequential and removal" num2str(new_number_of_clusters_removed) "clusters"]);
% plot_mineral_custom(filtered_image_array,mineral_data,mineral_names,clustering_cell_hier,best_bel_hier_custom);
plot_mineral(filtered_image_array,X_total,mineral_data,mineral_names,clustering_cell_hier,best_bel_hier_custom,image_clustered_hier);
plot_mineral_least_squares(filtered_image_array,X_total,mineral_data,mineral_names,clustering_cell_hier,best_bel_hier_custom,image_clustered_hier);
plot_mineral_lasso(filtered_image_array,X_total,mineral_data,mineral_names,clustering_cell_hier,best_bel_hier_custom,image_clustered_hier);
plot_mineral_least_squares_constraint(filtered_image_array,X_total,mineral_data,mineral_names,clustering_cell_hier,best_bel_hier_custom,image_clustered_hier);
%plot signatures
% for i=1:new_number_of_clusters
%     figure(100+i)
%     plot(clustering_cell_hier{i}')
% end
% save_plots('C:\Users\P70556\Desktop\clustering\ergasia\plots\sentinel_continous_removed_custom');