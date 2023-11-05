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
number_of_clusters = 28;
[best_bel_frechet_full] = hier_frechet(filtered_image_array,number_of_clusters);


% image clusters full frechet
%3
[image_clustered_frechet_3, clustering_cell_frechet_3,image_clustered_ferric_frechet_3,image_clustered_ferrous_frechet_3,image_clustered_alteration_frechet_3,image_clustered_ferric_normal_frechet_3,image_clustered_ferrous_normal_frechet_3,image_clustered_alteration_normal_frechet_3,image_clustered_mask_frechet_3] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 3, p,n, false," frechet 3 clusters");


[clustering_validation_metric_3,clustering_validation_pixels_3,clustering_validation_total_metric_3] ...
    = sentinel_validation(D,filtered_image_array,best_bel_frechet_full{3});


% spectral indices
% [mean_std_ferric_array_frechet_3, mean_std_ferrous_array_frechet_3,mean_std_alteration_array_frechet_3] ...
%     = spectal_indices_plots(image_clustered_ferric_frechet_3,image_clustered_ferrous_frechet_3,image_clustered_alteration_frechet_3,image_clustered_ferric_normal_frechet_3,image_clustered_ferrous_normal_frechet_3,image_clustered_alteration_normal_frechet_3,image_clustered_mask_frechet_3,spectral_indices_normalized_rgb,false," frechet 3 clusters");


%4
[image_clustered_frechet_4,clustering_cell_frechet_4,image_clustered_ferric_frechet_4,image_clustered_ferrous_frechet_4,image_clustered_alteration_frechet_4,image_clustered_ferric_normal_frechet_4,image_clustered_ferrous_normal_frechet_4,image_clustered_alteration_normal_frechet_4,image_clustered_mask_frechet_4] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 4, p,n,false," frechet 4 clusters");

[clustering_validation_metric_4,clustering_validation_pixels_4,clustering_validation_total_metric_4] ...
    = sentinel_validation(D,filtered_image_array,best_bel_frechet_full{4});

%5
[image_clustered_frechet_5,clustering_cell_frechet_5,image_clustered_ferric_frechet_5,image_clustered_ferrous_frechet_5,image_clustered_alteration_frechet_5,image_clustered_ferric_normal_frechet_5,image_clustered_ferrous_normal_frechet_5,image_clustered_alteration_normal_frechet_5,image_clustered_mask_frechet_5] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 5, p,n,false," frechet 5 clusters");

[clustering_validation_metric_5,clustering_validation_pixels_5,clustering_validation_total_metric_5] ...
    = sentinel_validation(D,filtered_image_array,best_bel_frechet_full{5});

%6
[image_clustered_frechet_6,clustering_cell_frechet_6,image_clustered_ferric_frechet_6,image_clustered_ferrous_frechet_6,image_clustered_alteration_frechet_6,image_clustered_ferric_normal_frechet_6,image_clustered_ferrous_normal_frechet_6,image_clustered_alteration_normal_frechet_6,image_clustered_mask_frechet_6] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 6, p,n,false," frechet 6 clusters");

[clustering_validation_metric_6,clustering_validation_pixels_6,clustering_validation_total_metric_6] ...
    = sentinel_validation(D,filtered_image_array,best_bel_frechet_full{6});

%7
[image_clustered_frechet_7,clustering_cell_frechet_7,image_clustered_ferric_frechet_7,image_clustered_ferrous_frechet_7,image_clustered_alteration_frechet_7,image_clustered_ferric_normal_frechet_7,image_clustered_ferrous_normal_frechet_7,image_clustered_alteration_normal_frechet_7,image_clustered_mask_frechet_7] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 7, p,n,false,"frechet 7 clusters");

[clustering_validation_metric_7,clustering_validation_pixels_7,clustering_validation_total_metric_7] ...
    = sentinel_validation(D,filtered_image_array,best_bel_frechet_full{7});

%8
[image_clustered_frechet_8,clustering_cell_frechet_8,image_clustered_ferric_frechet_8,image_clustered_ferrous_frechet_8,image_clustered_alteration_frechet_8,image_clustered_ferric_normal_frechet_7,image_clustered_ferrous_normal_frechet_8,image_clustered_alteration_normal_frechet_8,image_clustered_mask_frechet_8] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 8, p,n,false,"frechet 8 clusters");

[clustering_validation_metric_8,clustering_validation_pixels_8,clustering_validation_total_metric_8] ...
    = sentinel_validation(D,filtered_image_array,best_bel_frechet_full{8});

%9
[image_clustered_frechet_9,clustering_cell_frechet_9,image_clustered_ferric_frechet_9,image_clustered_ferrous_frechet_9,image_clustered_alteration_frechet_9,image_clustered_ferric_normal_frechet_7,image_clustered_ferrous_normal_frechet_9,image_clustered_alteration_normal_frechet_9,image_clustered_mask_frechet_9] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 9, p,n,false,"frechet 9 clusters");

[clustering_validation_metric_9,clustering_validation_pixels_9,clustering_validation_total_metric_9] ...
    = sentinel_validation(D,filtered_image_array,best_bel_frechet_full{9});

%10
[image_clustered_frechet_10,clustering_cell_frechet_10,image_clustered_ferric_frechet_10,image_clustered_ferrous_frechet_10,image_clustered_alteration_frechet_10,image_clustered_ferric_normal_frechet_7,image_clustered_ferrous_normal_frechet_10,image_clustered_alteration_normal_frechet_10,image_clustered_mask_frechet_10] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 10, p,n,false,"frechet 10 clusters");

[clustering_validation_metric_10,clustering_validation_pixels_10,clustering_validation_total_metric_10] ...
    = sentinel_validation(D,filtered_image_array,best_bel_frechet_full{10});

%11
[image_clustered_frechet_11,clustering_cell_frechet_11,image_clustered_ferric_frechet_11,image_clustered_ferrous_frechet_11,image_clustered_alteration_frechet_11,image_clustered_ferric_normal_frechet_7,image_clustered_ferrous_normal_frechet_11,image_clustered_alteration_normal_frechet_11,image_clustered_mask_frechet_11] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 11, p,n,false,"frechet 11 clusters");

[clustering_validation_metric_11,clustering_validation_pixels_11,clustering_validation_total_metric_11] ...
    = sentinel_validation(D,filtered_image_array,best_bel_frechet_full{11});

%12
[image_clustered_frechet_12,clustering_cell_frechet_12,image_clustered_ferric_frechet_12,image_clustered_ferrous_frechet_12,image_clustered_alteration_frechet_12,image_clustered_ferric_normal_frechet_7,image_clustered_ferrous_normal_frechet_12,image_clustered_alteration_normal_frechet_12,image_clustered_mask_frechet_12] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 12, p,n,false,"frechet 12 clusters");

[clustering_validation_metric_12,clustering_validation_pixels_12,clustering_validation_total_metric_12] ...
    = sentinel_validation(D,filtered_image_array,best_bel_frechet_full{12});

%13
[image_clustered_frechet_13,clustering_cell_frechet_13,image_clustered_ferric_frechet_13,image_clustered_ferrous_frechet_13,image_clustered_alteration_frechet_13,image_clustered_ferric_normal_frechet_7,image_clustered_ferrous_normal_frechet_13,image_clustered_alteration_normal_frechet_13,image_clustered_mask_frechet_13] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 13, p,n,false,"frechet 13 clusters");

[clustering_validation_metric_13,clustering_validation_pixels_13,clustering_validation_total_metric_13] ...
    = sentinel_validation(D,filtered_image_array,best_bel_frechet_full{13});
%14
[image_clustered_frechet_14,clustering_cell_frechet_14,image_clustered_ferric_frechet_14,image_clustered_ferrous_frechet_14,image_clustered_alteration_frechet_14,image_clustered_ferric_normal_frechet_7,image_clustered_ferrous_normal_frechet_14,image_clustered_alteration_normal_frechet_14,image_clustered_mask_frechet_14] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 14, p,n,false,"frechet 14 clusters");

[clustering_validation_metric_14,clustering_validation_pixels_14,clustering_validation_total_metric_14] ...
    = sentinel_validation(D,filtered_image_array,best_bel_frechet_full{14});

%15
[image_clustered_frechet_15,clustering_cell_frechet_15,image_clustered_ferric_frechet_15,image_clustered_ferrous_frechet_15,image_clustered_alteration_frechet_15,image_clustered_ferric_normal_frechet_7,image_clustered_ferrous_normal_frechet_15,image_clustered_alteration_normal_frechet_15,image_clustered_mask_frechet_15] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 15, p,n,false,"frechet 15 clusters");

[clustering_validation_metric_15,clustering_validation_pixels_15,clustering_validation_total_metric_15] ...
    = sentinel_validation(D,filtered_image_array,best_bel_frechet_full{15});

%16
[image_clustered_frechet_16,clustering_cell_frechet_16,image_clustered_ferric_frechet_16,image_clustered_ferrous_frechet_16,image_clustered_alteration_frechet_16,image_clustered_ferric_normal_frechet_7,image_clustered_ferrous_normal_frechet_16,image_clustered_alteration_normal_frechet_16,image_clustered_mask_frechet_16] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 16, p,n,false,"frechet 16 clusters");

[clustering_validation_metric_16,clustering_validation_pixels_16,clustering_validation_total_metric_16] ...
    = sentinel_validation(D,filtered_image_array,best_bel_frechet_full{16});

%17
[image_clustered_frechet_17,clustering_cell_frechet_17,image_clustered_ferric_frechet_17,image_clustered_ferrous_frechet_17,image_clustered_alteration_frechet_17,image_clustered_ferric_normal_frechet_7,image_clustered_ferrous_normal_frechet_17,image_clustered_alteration_normal_frechet_17,image_clustered_mask_frechet_17] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 17, p,n,false,"frechet 17 clusters");

[clustering_validation_metric_17,clustering_validation_pixels_17,clustering_validation_total_metric_17] ...
    = sentinel_validation(D,filtered_image_array,best_bel_frechet_full{17});

%18
[image_clustered_frechet_18,clustering_cell_frechet_18,image_clustered_ferric_frechet_18,image_clustered_ferrous_frechet_18,image_clustered_alteration_frechet_18,image_clustered_ferric_normal_frechet_7,image_clustered_ferrous_normal_frechet_18,image_clustered_alteration_normal_frechet_18,image_clustered_mask_frechet_18] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 18, p,n,false,"frechet 18 clusters");

[clustering_validation_metric_18,clustering_validation_pixels_18,clustering_validation_total_metric_18] ...
    = sentinel_validation(D,filtered_image_array,best_bel_frechet_full{18});

%19
[image_clustered_frechet_19,clustering_cell_frechet_19,image_clustered_ferric_frechet_19,image_clustered_ferrous_frechet_19,image_clustered_alteration_frechet_19,image_clustered_ferric_normal_frechet_7,image_clustered_ferrous_normal_frechet_19,image_clustered_alteration_normal_frechet_19,image_clustered_mask_frechet_19] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 19, p,n,false,"frechet 19 clusters");

[clustering_validation_metric_19,clustering_validation_pixels_19,clustering_validation_total_metric_19] ...
    = sentinel_validation(D,filtered_image_array,best_bel_frechet_full{19});

%20
[image_clustered_frechet_20,clustering_cell_frechet_20,image_clustered_ferric_frechet_20,image_clustered_ferrous_frechet_20,image_clustered_alteration_frechet_20,image_clustered_ferric_normal_frechet_7,image_clustered_ferrous_normal_frechet_20,image_clustered_alteration_normal_frechet_20,image_clustered_mask_frechet_20] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 20, p,n,false,"frechet 20 clusters");

[clustering_validation_metric_20,clustering_validation_pixels_20,clustering_validation_total_metric_20] ...
    = sentinel_validation(D,filtered_image_array,best_bel_frechet_full{20});

%21
[image_clustered_frechet_21,clustering_cell_frechet_21,image_clustered_ferric_frechet_21,image_clustered_ferrous_frechet_21,image_clustered_alteration_frechet_21,image_clustered_ferric_normal_frechet_7,image_clustered_ferrous_normal_frechet_21,image_clustered_alteration_normal_frechet_21,image_clustered_mask_frechet_21] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 21, p,n,false,"frechet 21 clusters");

[clustering_validation_metric_21,clustering_validation_pixels_21,clustering_validation_total_metric_21] ...
    = sentinel_validation(D,filtered_image_array,best_bel_frechet_full{21});

%22
[image_clustered_frechet_22,clustering_cell_frechet_22,image_clustered_ferric_frechet_22,image_clustered_ferrous_frechet_22,image_clustered_alteration_frechet_22,image_clustered_ferric_normal_frechet_7,image_clustered_ferrous_normal_frechet_22,image_clustered_alteration_normal_frechet_22,image_clustered_mask_frechet_22] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 22, p,n,false,"frechet 22 clusters");

[clustering_validation_metric_22,clustering_validation_pixels_22,clustering_validation_total_metric_22] ...
    = sentinel_validation(D,filtered_image_array,best_bel_frechet_full{22});

%23
[image_clustered_frechet_23,clustering_cell_frechet_23,image_clustered_ferric_frechet_23,image_clustered_ferrous_frechet_23,image_clustered_alteration_frechet_23,image_clustered_ferric_normal_frechet_7,image_clustered_ferrous_normal_frechet_23,image_clustered_alteration_normal_frechet_23,image_clustered_mask_frechet_23] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 23, p,n,false,"frechet 23 clusters");

[clustering_validation_metric_23,clustering_validation_pixels_23,clustering_validation_total_metric_23] ...
    = sentinel_validation(D,filtered_image_array,best_bel_frechet_full{23});

%24
[image_clustered_frechet_24,clustering_cell_frechet_24,image_clustered_ferric_frechet_24,image_clustered_ferrous_frechet_24,image_clustered_alteration_frechet_24,image_clustered_ferric_normal_frechet_7,image_clustered_ferrous_normal_frechet_24,image_clustered_alteration_normal_frechet_24,image_clustered_mask_frechet_24] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 24, p,n,false,"frechet 24 clusters");

[clustering_validation_metric_24,clustering_validation_pixels_24,clustering_validation_total_metric_24] ...
    = sentinel_validation(D,filtered_image_array,best_bel_frechet_full{24});

%25
[image_clustered_frechet_25,clustering_cell_frechet_25,image_clustered_ferric_frechet_25,image_clustered_ferrous_frechet_25,image_clustered_alteration_frechet_25,image_clustered_ferric_normal_frechet_7,image_clustered_ferrous_normal_frechet_25,image_clustered_alteration_normal_frechet_25,image_clustered_mask_frechet_25] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 25, p,n,false,"frechet 25 clusters");

[clustering_validation_metric_25,clustering_validation_pixels_25,clustering_validation_total_metric_25] ...
    = sentinel_validation(D,filtered_image_array,best_bel_frechet_full{25});

%26
[image_clustered_frechet_26,clustering_cell_frechet_26,image_clustered_ferric_frechet_26,image_clustered_ferrous_frechet_26,image_clustered_alteration_frechet_26,image_clustered_ferric_normal_frechet_7,image_clustered_ferrous_normal_frechet_26,image_clustered_alteration_normal_frechet_26,image_clustered_mask_frechet_26] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 26, p,n,false,"frechet 26 clusters");

[clustering_validation_metric_26,clustering_validation_pixels_26,clustering_validation_total_metric_26] ...
    = sentinel_validation(D,filtered_image_array,best_bel_frechet_full{26});

%27
[image_clustered_frechet_27,clustering_cell_frechet_27,image_clustered_ferric_frechet_27,image_clustered_ferrous_frechet_27,image_clustered_alteration_frechet_27,image_clustered_ferric_normal_frechet_7,image_clustered_ferrous_normal_frechet_27,image_clustered_alteration_normal_frechet_27,image_clustered_mask_frechet_27] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 27, p,n,false,"frechet 27 clusters");

[clustering_validation_metric_27,clustering_validation_pixels_27,clustering_validation_total_metric_27] ...
    = sentinel_validation(D,filtered_image_array,best_bel_frechet_full{27});

%28
[image_clustered_frechet_28,clustering_cell_frechet_28,image_clustered_ferric_frechet_28,image_clustered_ferrous_frechet_28,image_clustered_alteration_frechet_28,image_clustered_ferric_normal_frechet_7,image_clustered_ferrous_normal_frechet_28,image_clustered_alteration_normal_frechet_28,image_clustered_mask_frechet_28] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 28, p,n,false,"frechet 28 clusters");

[clustering_validation_metric_28,clustering_validation_pixels_28,clustering_validation_total_metric_28] ...
    = sentinel_validation(D,filtered_image_array,best_bel_frechet_full{28});

% clustring plots full -k means
% silhouette_total_mean_frechet_3 = clustering_plots(filtered_image_array,clustering_cell_frechet_3,best_bel_frechet_full{3},feature_names,"frechet 3 clusters",false);
% silhouette_total_mean_frechet_4 = clustering_plots(filtered_image_array,clustering_cell_frechet_4,best_bel_frechet_full{4},feature_names,"frechet 4 clusters",false);
% silhouette_total_mean_frechet_5 = clustering_plots(filtered_image_array,clustering_cell_frechet_5,best_bel_frechet_full{5},feature_names,"frechet 5 clusters",false);
% silhouette_total_mean_frechet_6 = clustering_plots(filtered_image_array,clustering_cell_frechet_6,best_bel_frechet_full{6},feature_names,"frechet 6 clusters",false);
% silhouette_total_mean_frechet_7 = clustering_plots(filtered_image_array,clustering_cell_frechet_7,best_bel_frechet_full{7},feature_names,"frechet 7 clusters",false);

% silhouette mean elbow plot
% silhouette_elbow_plot([silhouette_total_mean_frechet_3 silhouette_total_mean_frechet_4 silhouette_total_mean_frechet_5 ...
%     silhouette_total_mean_frechet_6 silhouette_total_mean_frechet_7])
save('clustering_koutala_sentinel_refl_frechet')

save_plots('C:\Users\P70556\OneDrive - NRB\Desktop\πτυχιακη\results\sentinel-frechet');