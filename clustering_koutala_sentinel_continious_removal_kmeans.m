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


% run k-means
number_of_clusters = 28;
% full data k-means
[best_thetas_k_means_full,best_bel_k_means_full,best_J_k_means_full] = cfo_algorithms(filtered_image_array',number_of_clusters,2000, 'k_means');
% plot elbow curve to find the number of clusters
figure(3), plot(2:number_of_clusters,best_J_k_means_full(2:end))
title('K-means elbow plot - full')
hold off;

% image clusters full k-means: 3,4,5,6
%3
[image_clustered_kmeans_3, clustering_cell_kmeans_3,image_clustered_ferric_kmeans_3,image_clustered_ferrous_kmeans_3,image_clustered_alteration_kmeans_3,image_clustered_ferric_normal_kmeans_3,image_clustered_ferrous_normal_kmeans_3,image_clustered_alteration_normal_kmeans_3,image_clustered_mask_kmeans_3] ...
    = image_clustering(X_total,filtered_image_array, best_bel_k_means_full, 3, p,n, false," k-means 3 clusters");

[clustering_validation_metric_3,clustering_validation_pixels_3,clustering_validation_total_metric_3] ...
    = sentinel_validation(D,filtered_image_array,best_bel_k_means_full{3});

%4
[image_clustered_kmeans_4,clustering_cell_kmeans_4,image_clustered_ferric_kmeans_4,image_clustered_ferrous_kmeans_4,image_clustered_alteration_kmeans_4,image_clustered_ferric_normal_kmeans_4,image_clustered_ferrous_normal_kmeans_4,image_clustered_alteration_normal_kmeans_4,image_clustered_mask_kmeans_4] ...
    = image_clustering(X_total,filtered_image_array, best_bel_k_means_full, 4, p,n,false," k-means 4 clusters");

[clustering_validation_metric_4,clustering_validation_pixels_4,clustering_validation_total_metric_4] ...
    = sentinel_validation(D,filtered_image_array,best_bel_k_means_full{4});

%5
[image_clustered_kmeans_5,clustering_cell_kmeans_5,image_clustered_ferric_kmeans_5,image_clustered_ferrous_kmeans_5,image_clustered_alteration_kmeans_5,image_clustered_ferric_normal_kmeans_5,image_clustered_ferrous_normal_kmeans_5,image_clustered_alteration_normal_kmeans_5,image_clustered_mask_kmeans_5] ...
    = image_clustering(X_total,filtered_image_array, best_bel_k_means_full, 5, p,n,false," k-means 5 clusters");

[clustering_validation_metric_5,clustering_validation_pixels_5,clustering_validation_total_metric_5] ...
    = sentinel_validation(D,filtered_image_array,best_bel_k_means_full{5});

%6
[image_clustered_kmeans_6,clustering_cell_kmeans_6,image_clustered_ferric_kmeans_6,image_clustered_ferrous_kmeans_6,image_clustered_alteration_kmeans_6,image_clustered_ferric_normal_kmeans_6,image_clustered_ferrous_normal_kmeans_6,image_clustered_alteration_normal_kmeans_6,image_clustered_mask_kmeans_6] ...
    = image_clustering(X_total,filtered_image_array, best_bel_k_means_full, 6, p,n,false," k-means 6 clusters");

[clustering_validation_metric_6,clustering_validation_pixels_6,clustering_validation_total_metric_6] ...
    = sentinel_validation(D,filtered_image_array,best_bel_k_means_full{6});

%7
[image_clustered_kmeans_7,clustering_cell_kmeans_7,image_clustered_ferric_kmeans_7,image_clustered_ferrous_kmeans_7,image_clustered_alteration_kmeans_7,image_clustered_ferric_normal_kmeans_7,image_clustered_ferrous_normal_kmeans_7,image_clustered_alteration_normal_kmeans_7,image_clustered_mask_kmeans_7] ...
    = image_clustering(X_total,filtered_image_array, best_bel_k_means_full, 7, p,n,false,"k-means 7 clusters");

[clustering_validation_metric_7,clustering_validation_pixels_7,clustering_validation_total_metric_7] ...
    = sentinel_validation(D,filtered_image_array,best_bel_k_means_full{7});

%8
[image_clustered_kmeans_8, clustering_cell_kmeans_8, image_clustered_ferric_kmeans_8, image_clustered_ferrous_kmeans_8, image_clustered_alteration_kmeans_8, image_clustered_ferric_normal_kmeans_8, image_clustered_ferrous_normal_kmeans_8, image_clustered_alteration_normal_kmeans_8, image_clustered_mask_kmeans_8] ...
    = image_clustering(X_total, filtered_image_array, best_bel_k_means_full, 8, p, n, false, "k-means 8 clusters");

[clustering_validation_metric_8,clustering_validation_pixels_8,clustering_validation_total_metric_8] ...
    = sentinel_validation(D,filtered_image_array,best_bel_k_means_full{8});

%9
[image_clustered_kmeans_9, clustering_cell_kmeans_9, image_clustered_ferric_kmeans_9, image_clustered_ferrous_kmeans_9, image_clustered_alteration_kmeans_9, image_clustered_ferric_normal_kmeans_9, image_clustered_ferrous_normal_kmeans_9, image_clustered_alteration_normal_kmeans_9, image_clustered_mask_kmeans_9] ...
    = image_clustering(X_total, filtered_image_array, best_bel_k_means_full, 9, p, n, false, "k-means 9 clusters");

[clustering_validation_metric_9,clustering_validation_pixels_9,clustering_validation_total_metric_9] ...
    = sentinel_validation(D,filtered_image_array,best_bel_k_means_full{9});
%10
[image_clustered_kmeans_10, clustering_cell_kmeans_10, image_clustered_ferric_kmeans_10, image_clustered_ferrous_kmeans_10, image_clustered_alteration_kmeans_10, image_clustered_ferric_normal_kmeans_10, image_clustered_ferrous_normal_kmeans_10, image_clustered_alteration_normal_kmeans_10, image_clustered_mask_kmeans_10] ...
    = image_clustering(X_total, filtered_image_array, best_bel_k_means_full, 10, p, n, false, "k-means 10 clusters");

[clustering_validation_metric_10,clustering_validation_pixels_10,clustering_validation_total_metric_10] ...
    = sentinel_validation(D,filtered_image_array,best_bel_k_means_full{10});
%11
[image_clustered_kmeans_11, clustering_cell_kmeans_11, image_clustered_ferric_kmeans_11, image_clustered_ferrous_kmeans_11, image_clustered_alteration_kmeans_11, image_clustered_ferric_normal_kmeans_11, image_clustered_ferrous_normal_kmeans_11, image_clustered_alteration_normal_kmeans_11, image_clustered_mask_kmeans_11] ...
    = image_clustering(X_total, filtered_image_array, best_bel_k_means_full, 11, p, n, false, "k-means 11 clusters");

[clustering_validation_metric_11,clustering_validation_pixels_11,clustering_validation_total_metric_11] ...
    = sentinel_validation(D,filtered_image_array,best_bel_k_means_full{11});
%12
[image_clustered_kmeans_12, clustering_cell_kmeans_12, image_clustered_ferric_kmeans_12, image_clustered_ferrous_kmeans_12, image_clustered_alteration_kmeans_12, image_clustered_ferric_normal_kmeans_12, image_clustered_ferrous_normal_kmeans_12, image_clustered_alteration_normal_kmeans_12, image_clustered_mask_kmeans_12] ...
    = image_clustering(X_total, filtered_image_array, best_bel_k_means_full, 12, p, n, false, "k-means 12 clusters");

[clustering_validation_metric_12,clustering_validation_pixels_12,clustering_validation_total_metric_12] ...
    = sentinel_validation(D,filtered_image_array,best_bel_k_means_full{12});

%13
[image_clustered_kmeans_13, clustering_cell_kmeans_13, image_clustered_ferric_kmeans_13, image_clustered_ferrous_kmeans_13, image_clustered_alteration_kmeans_13, image_clustered_ferric_normal_kmeans_13, image_clustered_ferrous_normal_kmeans_13, image_clustered_alteration_normal_kmeans_13, image_clustered_mask_kmeans_13] ...
    = image_clustering(X_total, filtered_image_array, best_bel_k_means_full, 13, p, n, false, "k-means 13 clusters");

[clustering_validation_metric_13,clustering_validation_pixels_13,clustering_validation_total_metric_13] ...
    = sentinel_validation(D,filtered_image_array,best_bel_k_means_full{13});

%14
[image_clustered_kmeans_14, clustering_cell_kmeans_14, image_clustered_ferric_kmeans_14, image_clustered_ferrous_kmeans_14, image_clustered_alteration_kmeans_14, image_clustered_ferric_normal_kmeans_14, image_clustered_ferrous_normal_kmeans_14, image_clustered_alteration_normal_kmeans_14, image_clustered_mask_kmeans_14] ...
    = image_clustering(X_total, filtered_image_array, best_bel_k_means_full, 14, p, n, false, "k-means 14 clusters");

[clustering_validation_metric_14,clustering_validation_pixels_14,clustering_validation_total_metric_14] ...
    = sentinel_validation(D,filtered_image_array,best_bel_k_means_full{14});

%15
[image_clustered_kmeans_15, clustering_cell_kmeans_15, image_clustered_ferric_kmeans_15, image_clustered_ferrous_kmeans_15, image_clustered_alteration_kmeans_15, image_clustered_ferric_normal_kmeans_15, image_clustered_ferrous_normal_kmeans_15, image_clustered_alteration_normal_kmeans_15, image_clustered_mask_kmeans_15] ...
    = image_clustering(X_total, filtered_image_array, best_bel_k_means_full, 15, p, n, false, "k-means 15 clusters");


[clustering_validation_metric_15,clustering_validation_pixels_15,clustering_validation_total_metric_15] ...
    = sentinel_validation(D,filtered_image_array,best_bel_k_means_full{15});

%16
[image_clustered_kmeans_16, clustering_cell_kmeans_16, image_clustered_ferric_kmeans_16, image_clustered_ferrous_kmeans_16, image_clustered_alteration_kmeans_16, image_clustered_ferric_normal_kmeans_16, image_clustered_ferrous_normal_kmeans_16, image_clustered_alteration_normal_kmeans_16, image_clustered_mask_kmeans_16] ...
    = image_clustering(X_total, filtered_image_array, best_bel_k_means_full, 16, p, n, false, "k-means 16 clusters");

[clustering_validation_metric_16,clustering_validation_pixels_16,clustering_validation_total_metric_16] ...
    = sentinel_validation(D,filtered_image_array,best_bel_k_means_full{16});

%17
[image_clustered_kmeans_17, clustering_cell_kmeans_17, image_clustered_ferric_kmeans_17, image_clustered_ferrous_kmeans_17, image_clustered_alteration_kmeans_17, image_clustered_ferric_normal_kmeans_17, image_clustered_ferrous_normal_kmeans_17, image_clustered_alteration_normal_kmeans_17, image_clustered_mask_kmeans_17] ...
    = image_clustering(X_total, filtered_image_array, best_bel_k_means_full, 17, p, n, false, "k-means 17 clusters");

[clustering_validation_metric_17,clustering_validation_pixels_17,clustering_validation_total_metric_17] ...
    = sentinel_validation(D,filtered_image_array,best_bel_k_means_full{17});

%18
[image_clustered_kmeans_18, clustering_cell_kmeans_18, image_clustered_ferric_kmeans_18, image_clustered_ferrous_kmeans_18, image_clustered_alteration_kmeans_18, image_clustered_ferric_normal_kmeans_18, image_clustered_ferrous_normal_kmeans_18, image_clustered_alteration_normal_kmeans_18, image_clustered_mask_kmeans_18] ...
    = image_clustering(X_total, filtered_image_array, best_bel_k_means_full, 18, p, n, false, "k-means 18 clusters");

[clustering_validation_metric_18,clustering_validation_pixels_18,clustering_validation_total_metric_18] ...
    = sentinel_validation(D,filtered_image_array,best_bel_k_means_full{18});

%19
[image_clustered_kmeans_19, clustering_cell_kmeans_19, image_clustered_ferric_kmeans_19, image_clustered_ferrous_kmeans_19, image_clustered_alteration_kmeans_19, image_clustered_ferric_normal_kmeans_19, image_clustered_ferrous_normal_kmeans_19, image_clustered_alteration_normal_kmeans_19, image_clustered_mask_kmeans_19] ...
    = image_clustering(X_total, filtered_image_array, best_bel_k_means_full, 19, p, n, false, "k-means 19 clusters");

[clustering_validation_metric_19,clustering_validation_pixels_19,clustering_validation_total_metric_19] ...
    = sentinel_validation(D,filtered_image_array,best_bel_k_means_full{19});

%20
[image_clustered_kmeans_20, clustering_cell_kmeans_20, image_clustered_ferric_kmeans_20, image_clustered_ferrous_kmeans_20, image_clustered_alteration_kmeans_20, image_clustered_ferric_normal_kmeans_20, image_clustered_ferrous_normal_kmeans_20, image_clustered_alteration_normal_kmeans_20, image_clustered_mask_kmeans_20] ...
    = image_clustering(X_total, filtered_image_array, best_bel_k_means_full, 20, p, n, false, "k-means 20 clusters");

[clustering_validation_metric_20,clustering_validation_pixels_20,clustering_validation_total_metric_20] ...
    = sentinel_validation(D,filtered_image_array,best_bel_k_means_full{20});

%21
[image_clustered_kmeans_21, clustering_cell_kmeans_21, image_clustered_ferric_kmeans_21, image_clustered_ferrous_kmeans_21, image_clustered_alteration_kmeans_21, image_clustered_ferric_normal_kmeans_21, image_clustered_ferrous_normal_kmeans_21, image_clustered_alteration_normal_kmeans_21, image_clustered_mask_kmeans_21] ...
    = image_clustering(X_total, filtered_image_array, best_bel_k_means_full, 21, p, n, false, "k-means 21 clusters");

[clustering_validation_metric_21,clustering_validation_pixels_21,clustering_validation_total_metric_21] ...
    = sentinel_validation(D,filtered_image_array,best_bel_k_means_full{21});

%22
[image_clustered_kmeans_22, clustering_cell_kmeans_22, image_clustered_ferric_kmeans_22, image_clustered_ferrous_kmeans_22, image_clustered_alteration_kmeans_22, image_clustered_ferric_normal_kmeans_22, image_clustered_ferrous_normal_kmeans_22, image_clustered_alteration_normal_kmeans_22, image_clustered_mask_kmeans_22] ...
    = image_clustering(X_total, filtered_image_array, best_bel_k_means_full, 22, p, n, false, "k-means 22 clusters");

[clustering_validation_metric_22,clustering_validation_pixels_22,clustering_validation_total_metric_22] ...
    = sentinel_validation(D,filtered_image_array,best_bel_k_means_full{22});

%23
[image_clustered_kmeans_23, clustering_cell_kmeans_23, image_clustered_ferric_kmeans_23, image_clustered_ferrous_kmeans_23, image_clustered_alteration_kmeans_23, image_clustered_ferric_normal_kmeans_23, image_clustered_ferrous_normal_kmeans_23, image_clustered_alteration_normal_kmeans_23, image_clustered_mask_kmeans_23] ...
    = image_clustering(X_total, filtered_image_array, best_bel_k_means_full, 23, p, n, false, "k-means 23 clusters");

[clustering_validation_metric_23,clustering_validation_pixels_23,clustering_validation_total_metric_23] ...
    = sentinel_validation(D,filtered_image_array,best_bel_k_means_full{23});

%24
[image_clustered_kmeans_24, clustering_cell_kmeans_24, image_clustered_ferric_kmeans_24, image_clustered_ferrous_kmeans_24, image_clustered_alteration_kmeans_24, image_clustered_ferric_normal_kmeans_24, image_clustered_ferrous_normal_kmeans_24, image_clustered_alteration_normal_kmeans_24, image_clustered_mask_kmeans_24] ...
    = image_clustering(X_total, filtered_image_array, best_bel_k_means_full, 24, p, n, false, "k-means 24 clusters");

[clustering_validation_metric_24,clustering_validation_pixels_24,clustering_validation_total_metric_24] ...
    = sentinel_validation(D,filtered_image_array,best_bel_k_means_full{24});

%25
[image_clustered_kmeans_25, clustering_cell_kmeans_25, image_clustered_ferric_kmeans_25, image_clustered_ferrous_kmeans_25, image_clustered_alteration_kmeans_25, image_clustered_ferric_normal_kmeans_25, image_clustered_ferrous_normal_kmeans_25, image_clustered_alteration_normal_kmeans_25, image_clustered_mask_kmeans_25] ...
    = image_clustering(X_total, filtered_image_array, best_bel_k_means_full, 25, p, n, false, "k-means 25 clusters");

[clustering_validation_metric_25,clustering_validation_pixels_25,clustering_validation_total_metric_25] ...
    = sentinel_validation(D,filtered_image_array,best_bel_k_means_full{25});

%26
[image_clustered_kmeans_26, clustering_cell_kmeans_26, image_clustered_ferric_kmeans_26, image_clustered_ferrous_kmeans_26, image_clustered_alteration_kmeans_26, image_clustered_ferric_normal_kmeans_26, image_clustered_ferrous_normal_kmeans_26, image_clustered_alteration_normal_kmeans_26, image_clustered_mask_kmeans_26] ...
    = image_clustering(X_total, filtered_image_array, best_bel_k_means_full, 26, p, n, false, "k-means 26 clusters");

[clustering_validation_metric_26,clustering_validation_pixels_26,clustering_validation_total_metric_26] ...
    = sentinel_validation(D,filtered_image_array,best_bel_k_means_full{26});

%27
[image_clustered_kmeans_27, clustering_cell_kmeans_27, image_clustered_ferric_kmeans_27, image_clustered_ferrous_kmeans_27, image_clustered_alteration_kmeans_27, image_clustered_ferric_normal_kmeans_27, image_clustered_ferrous_normal_kmeans_27, image_clustered_alteration_normal_kmeans_27, image_clustered_mask_kmeans_27] ...
    = image_clustering(X_total, filtered_image_array, best_bel_k_means_full, 27, p, n, false, "k-means 27 clusters");

[clustering_validation_metric_27,clustering_validation_pixels_27,clustering_validation_total_metric_27] ...
    = sentinel_validation(D,filtered_image_array,best_bel_k_means_full{27});
%28
[image_clustered_kmeans_28, clustering_cell_kmeans_28, image_clustered_ferric_kmeans_28, image_clustered_ferrous_kmeans_28, image_clustered_alteration_kmeans_28, image_clustered_ferric_normal_kmeans_28, image_clustered_ferrous_normal_kmeans_28, image_clustered_alteration_normal_kmeans_28, image_clustered_mask_kmeans_28] ...
    = image_clustering(X_total, filtered_image_array, best_bel_k_means_full, 28, p, n, false, "k-means 28 clusters");

[clustering_validation_metric_28,clustering_validation_pixels_28,clustering_validation_total_metric_28] ...
    = sentinel_validation(D,filtered_image_array,best_bel_k_means_full{28});

save('clustering_koutala_sentinel_continious_removal_kmeans')

save_plots('C:\Users\P70556\OneDrive - NRB\Desktop\πτυχιακη\results\sentinel_kmeans-removed');