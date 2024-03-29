close all
clear

% load image from the file
[D,info] = enviread('S2_Koutala.dat', 'S2_Koutala.hdr');
feature_names = split(erase(info.band_names, {'{','}'}), ',')';
[p,n,l]=size(D);
X_total=reshape(D, p*n,l);
% show image in RGB
rgb_new = zeros(p,n,3);
rgb_new(:,:,1) = D(:,:,4);
rgb_new(:,:,2) = D(:,:,3);
rgb_new(:,:,3) = D(:,:,2);
figure(1)
imshow(rgb_new,'InitialMagnification','fit');
title('RGB spectral indices image koutala sentintel 2 ')
hold off;


% filter all the rows that have in all columns zeros
filtered_image_array = X_total(all(X_total,2),:);


% run frechet distance hier
number_of_clusters = 15;
[best_bel_frechet_full] = hier_frechet(filtered_image_array,number_of_clusters);


% image clusters full frechet
%3
[image_clustered_frechet_3, clustering_cell_frechet_3,image_clustered_ferric_frechet_3,image_clustered_ferrous_frechet_3,image_clustered_alteration_frechet_3,image_clustered_ferric_normal_frechet_3,image_clustered_ferrous_normal_frechet_3,image_clustered_alteration_normal_frechet_3,image_clustered_mask_frechet_3] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 3, p,n, false," frechet 3 clusters");


% spectral indices
% [mean_std_ferric_array_frechet_3, mean_std_ferrous_array_frechet_3,mean_std_alteration_array_frechet_3] ...
%     = spectal_indices_plots(image_clustered_ferric_frechet_3,image_clustered_ferrous_frechet_3,image_clustered_alteration_frechet_3,image_clustered_ferric_normal_frechet_3,image_clustered_ferrous_normal_frechet_3,image_clustered_alteration_normal_frechet_3,image_clustered_mask_frechet_3,spectral_indices_normalized_rgb,false," frechet 3 clusters");


%4
[image_clustered_frechet_4,clustering_cell_frechet_4,image_clustered_ferric_frechet_4,image_clustered_ferrous_frechet_4,image_clustered_alteration_frechet_4,image_clustered_ferric_normal_frechet_4,image_clustered_ferrous_normal_frechet_4,image_clustered_alteration_normal_frechet_4,image_clustered_mask_frechet_4] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 4, p,n,false," frechet 4 clusters");


% spectral indices
% [mean_std_ferric_array_frechet_4, mean_std_ferrous_array_frechet_4,mean_std_alteration_array_frechet_4] ...
%     = spectal_indices_plots(image_clustered_ferric_frechet_4,image_clustered_ferrous_frechet_4,image_clustered_alteration_frechet_4,image_clustered_ferric_normal_frechet_4,image_clustered_ferrous_normal_frechet_4,image_clustered_alteration_normal_frechet_4,image_clustered_mask_frechet_4,spectral_indices_normalized_rgb,false," frechet 4 clusters");

%5
[image_clustered_frechet_5,clustering_cell_frechet_5,image_clustered_ferric_frechet_5,image_clustered_ferrous_frechet_5,image_clustered_alteration_frechet_5,image_clustered_ferric_normal_frechet_5,image_clustered_ferrous_normal_frechet_5,image_clustered_alteration_normal_frechet_5,image_clustered_mask_frechet_5] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 5, p,n,false," frechet 5 clusters");

% spectral indices
% [mean_std_ferric_array_frechet_5, mean_std_ferrous_array_frechet_5,mean_std_alteration_array_frechet_5] ...
%     = spectal_indices_plots(image_clustered_ferric_frechet_5,image_clustered_ferrous_frechet_5,image_clustered_alteration_frechet_5,image_clustered_ferric_normal_frechet_5,image_clustered_ferrous_normal_frechet_5,image_clustered_alteration_normal_frechet_5,image_clustered_mask_frechet_5,spectral_indices_normalized_rgb,false," frechet 5 clusters");

%6
[image_clustered_frechet_6,clustering_cell_frechet_6,image_clustered_ferric_frechet_6,image_clustered_ferrous_frechet_6,image_clustered_alteration_frechet_6,image_clustered_ferric_normal_frechet_6,image_clustered_ferrous_normal_frechet_6,image_clustered_alteration_normal_frechet_6,image_clustered_mask_frechet_6] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 6, p,n,false," frechet 6 clusters");

% spectral indices
% [mean_std_ferric_array_frechet_6, mean_std_ferrous_array_frechet_6,mean_std_alteration_array_frechet_6] ...
%     = spectal_indices_plots(image_clustered_ferric_frechet_6,image_clustered_ferrous_frechet_6,image_clustered_alteration_frechet_6,image_clustered_ferric_normal_frechet_6,image_clustered_ferrous_normal_frechet_6,image_clustered_alteration_normal_frechet_6,image_clustered_mask_frechet_6,spectral_indices_normalized_rgb,false," frechet 6 clusters");

%7
[image_clustered_frechet_7,clustering_cell_frechet_7,image_clustered_ferric_frechet_7,image_clustered_ferrous_frechet_7,image_clustered_alteration_frechet_7,image_clustered_ferric_normal_frechet_7,image_clustered_ferrous_normal_frechet_7,image_clustered_alteration_normal_frechet_7,image_clustered_mask_frechet_7] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 7, p,n,false,"frechet 7 clusters");

%8
[image_clustered_frechet_8,clustering_cell_frechet_8,image_clustered_ferric_frechet_8,image_clustered_ferrous_frechet_8,image_clustered_alteration_frechet_8,image_clustered_ferric_normal_frechet_7,image_clustered_ferrous_normal_frechet_8,image_clustered_alteration_normal_frechet_8,image_clustered_mask_frechet_8] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 8, p,n,false,"frechet 8 clusters");

%9
[image_clustered_frechet_9,clustering_cell_frechet_9,image_clustered_ferric_frechet_9,image_clustered_ferrous_frechet_9,image_clustered_alteration_frechet_9,image_clustered_ferric_normal_frechet_7,image_clustered_ferrous_normal_frechet_9,image_clustered_alteration_normal_frechet_9,image_clustered_mask_frechet_9] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 9, p,n,false,"frechet 9 clusters");

%10
[image_clustered_frechet_10,clustering_cell_frechet_10,image_clustered_ferric_frechet_10,image_clustered_ferrous_frechet_10,image_clustered_alteration_frechet_10,image_clustered_ferric_normal_frechet_7,image_clustered_ferrous_normal_frechet_10,image_clustered_alteration_normal_frechet_10,image_clustered_mask_frechet_10] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 10, p,n,false,"frechet 10 clusters");
%11
[image_clustered_frechet_11,clustering_cell_frechet_11,image_clustered_ferric_frechet_11,image_clustered_ferrous_frechet_11,image_clustered_alteration_frechet_11,image_clustered_ferric_normal_frechet_7,image_clustered_ferrous_normal_frechet_11,image_clustered_alteration_normal_frechet_11,image_clustered_mask_frechet_11] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 11, p,n,false,"frechet 11 clusters");

%12
[image_clustered_frechet_12,clustering_cell_frechet_12,image_clustered_ferric_frechet_12,image_clustered_ferrous_frechet_12,image_clustered_alteration_frechet_12,image_clustered_ferric_normal_frechet_7,image_clustered_ferrous_normal_frechet_12,image_clustered_alteration_normal_frechet_12,image_clustered_mask_frechet_12] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 12, p,n,false,"frechet 12 clusters");

%13
[image_clustered_frechet_13,clustering_cell_frechet_13,image_clustered_ferric_frechet_13,image_clustered_ferrous_frechet_13,image_clustered_alteration_frechet_13,image_clustered_ferric_normal_frechet_7,image_clustered_ferrous_normal_frechet_13,image_clustered_alteration_normal_frechet_13,image_clustered_mask_frechet_13] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 13, p,n,false,"frechet 13 clusters");
%14
[image_clustered_frechet_14,clustering_cell_frechet_14,image_clustered_ferric_frechet_14,image_clustered_ferrous_frechet_14,image_clustered_alteration_frechet_14,image_clustered_ferric_normal_frechet_7,image_clustered_ferrous_normal_frechet_14,image_clustered_alteration_normal_frechet_14,image_clustered_mask_frechet_14] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 14, p,n,false,"frechet 14 clusters");
%15
[image_clustered_frechet_15,clustering_cell_frechet_15,image_clustered_ferric_frechet_15,image_clustered_ferrous_frechet_15,image_clustered_alteration_frechet_15,image_clustered_ferric_normal_frechet_7,image_clustered_ferrous_normal_frechet_15,image_clustered_alteration_normal_frechet_15,image_clustered_mask_frechet_15] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 15, p,n,false,"frechet 15 clusters");


% clustring plots full -k means
% silhouette_total_mean_frechet_3 = clustering_plots(filtered_image_array,clustering_cell_frechet_3,best_bel_frechet_full{3},feature_names,"frechet 3 clusters",false);
% silhouette_total_mean_frechet_4 = clustering_plots(filtered_image_array,clustering_cell_frechet_4,best_bel_frechet_full{4},feature_names,"frechet 4 clusters",false);
% silhouette_total_mean_frechet_5 = clustering_plots(filtered_image_array,clustering_cell_frechet_5,best_bel_frechet_full{5},feature_names,"frechet 5 clusters",false);
% silhouette_total_mean_frechet_6 = clustering_plots(filtered_image_array,clustering_cell_frechet_6,best_bel_frechet_full{6},feature_names,"frechet 6 clusters",false);
% silhouette_total_mean_frechet_7 = clustering_plots(filtered_image_array,clustering_cell_frechet_7,best_bel_frechet_full{7},feature_names,"frechet 7 clusters",false);

% silhouette mean elbow plot
% silhouette_elbow_plot([silhouette_total_mean_frechet_3 silhouette_total_mean_frechet_4 silhouette_total_mean_frechet_5 ...
%     silhouette_total_mean_frechet_6 silhouette_total_mean_frechet_7])
save_plots('C:\Users\P70556\OneDrive - NRB\Desktop\πτυχιακη\results\sentinel-frechet');