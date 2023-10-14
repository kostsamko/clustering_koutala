close all
clear
% load image from the file
[D,info] = enviread('S2_1-CR_IMAGE.dat', 'S2_1-CR_IMAGE.hdr');
feature_names = {'B1','B2','B3','B4','B5','B6','B7','B8','B9','B10','B11','B12'};
[p,n,l]=size(D);
X_total=reshape(D, p*n,l);
% cr
% X_total=1 -X_total;


% filter all the rows that have in all columns 1
q = all(~isnan(X_total), 2);
filtered_image_array = X_total(q,:);


% run frechet distance hier
number_of_clusters = 15;
[best_bel_frechet_full] = hier_frechet(filtered_image_array,number_of_clusters);


% image clusters full frechet
%3
[image_clustered_frechet_3, clustering_cell_frechet_3,image_clustered_ferric_frechet_3,image_clustered_ferrous_frechet_3,image_clustered_alteration_frechet_3,image_clustered_ferric_normal_frechet_3,image_clustered_ferrous_normal_frechet_3,image_clustered_alteration_normal_frechet_3,image_clustered_mask_frechet_3] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 3, p,n, false," frechet 3 clusters");


%4
[image_clustered_frechet_4,clustering_cell_frechet_4,image_clustered_ferric_frechet_4,image_clustered_ferrous_frechet_4,image_clustered_alteration_frechet_4,image_clustered_ferric_normal_frechet_4,image_clustered_ferrous_normal_frechet_4,image_clustered_alteration_normal_frechet_4,image_clustered_mask_frechet_4] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 4, p,n,false," frechet 4 clusters");

%5
[image_clustered_frechet_5,clustering_cell_frechet_5,image_clustered_ferric_frechet_5,image_clustered_ferrous_frechet_5,image_clustered_alteration_frechet_5,image_clustered_ferric_normal_frechet_5,image_clustered_ferrous_normal_frechet_5,image_clustered_alteration_normal_frechet_5,image_clustered_mask_frechet_5] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 5, p,n,false," frechet 5 clusters");

%6
[image_clustered_frechet_6,clustering_cell_frechet_6,image_clustered_ferric_frechet_6,image_clustered_ferrous_frechet_6,image_clustered_alteration_frechet_6,image_clustered_ferric_normal_frechet_6,image_clustered_ferrous_normal_frechet_6,image_clustered_alteration_normal_frechet_6,image_clustered_mask_frechet_6] ...
    = image_clustering(X_total,filtered_image_array, best_bel_frechet_full, 6, p,n,false," frechet 6 clusters");

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
save_plots('C:\Users\P70556\OneDrive - NRB\Desktop\πτυχιακη\results\sentinel-frechet-removed-transformed');