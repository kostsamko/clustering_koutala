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


% spectral indices in the original image

%ferric
ferric_indice = D(:,:,4) ./ D(:,:,2);
ferric_indice(isnan(ferric_indice)) = 0;
ferric_mean = mean(nonzeros(ferric_indice) , 'all');
ferric_std = std(nonzeros(ferric_indice),0,'all');

ferric_indice_normal = (D(:,:,4) - D(:,:,2)) ./ (D(:,:,4) + D(:,:,2));
ferric_indice_normal(isnan(ferric_indice_normal)) = 0;
ferric_indice_normal(ferric_indice_normal < 0) = 0;
ferric_mean_normal = mean(nonzeros(ferric_indice_normal) , 'all');
ferric_std_normal = std(nonzeros(ferric_indice_normal),0,'all');

figure(2)
imshow(ferric_indice,'DisplayRange',[],'InitialMagnification','fit');
title('Ferric indice koutala sentintel 2 ')
hold off;

figure(3)
imshow(ferric_indice_normal,'DisplayRange',[],'InitialMagnification','fit');
title('Ferric indice koutala sentintel 2 ')
hold off;

%ferrous
ferrous_indice = (D(:,:,12) ./ D(:,:,8)) + (D(:,:,3) ./ D(:,:,4));
ferrous_indice(isnan(ferrous_indice)) = 0;
ferrous_mean = mean(nonzeros(ferrous_indice) , 'all' );
ferrous_std = std(nonzeros(ferrous_indice) ,0, 'all' );

ferrous_indice_normal = ((D(:,:,12) - D(:,:,8)) ./ (D(:,:,12) + D(:,:,8))) + ((D(:,:,3) - D(:,:,4)) ./ (D(:,:,3) + D(:,:,4)));
ferrous_indice_normal(isnan(ferrous_indice_normal)) = 0;
ferrous_indice_normal(ferrous_indice_normal < 0) = 0;
% ferrous_indice_normal = (ferrous_indice_normal - min(ferrous_indice_normal,[],'all'))/(max(ferrous_indice_normal,[],'all') - min(ferrous_indice_normal,[],'all'));
% ferrous_indice_normal = normalize(ferrous_indice_normal, 'range');
ferrous_mean_normal = mean(nonzeros(ferrous_indice_normal) , 'all' );
ferrous_std_normal = std(nonzeros(ferrous_indice_normal) ,0, 'all' );

figure(4)
imshow(ferrous_indice,'DisplayRange',[],'InitialMagnification','fit');
title('Ferrous-normalized indice koutala sentintel 2 ')
hold off;

figure(5)
imshow(ferrous_indice_normal,'DisplayRange',[],'InitialMagnification','fit');
title('Ferrous-normalized indice koutala sentintel 2 ')
hold off;

%alteration
alteration_indice = D(:,:,11) ./ D(:,:,12);
alteration_indice(isnan(alteration_indice)) = 0;
alteration_indice_mean = mean(nonzeros(alteration_indice) , 'all' );
alteration_indice_std = std(nonzeros(alteration_indice) ,0,'all' );

alteration_indice_normal = (D(:,:,11) - D(:,:,12)) ./ (D(:,:,11) + D(:,:,12));
alteration_indice_normal(isnan(alteration_indice_normal)) = 0;
alteration_indice_normal(alteration_indice_normal < 0) = 0;
alteration_indice_mean_normal = mean(nonzeros(alteration_indice_normal) , 'all' );
alteration_indice_std_normal = std(nonzeros(alteration_indice_normal) ,0,'all' );

figure(6)
imshow(alteration_indice,'DisplayRange',[],'InitialMagnification','fit');
title('Alteration index koutala sentintel 2 ')
hold off;

figure(7)
imshow(alteration_indice_normal,'DisplayRange',[],'InitialMagnification','fit');
title('Alteration-normal index  indice koutala sentintel 2 ')
hold off;

% means,stds

figure(8)
y = [ferric_mean ferric_std ferrous_mean ferrous_std alteration_indice_mean alteration_indice_std];
barh(y)
yticklabels({'Ferric mean','Ferric std','Ferrous mean','Ferrous std', 'Alteration index mean','Alteration index std'})
title('Spectral indices mean std')
hold off

figure(9)
y = [ferric_mean_normal ferric_std_normal ferrous_mean_normal ferrous_std_normal alteration_indice_mean_normal alteration_indice_std_normal];
barh(y)
yticklabels({'Ferric-normalize mean','Ferric-normalize std','Ferrous-normalize mean','Ferrous-normalize std', 'Alteration index-normalize mean','Alteration index-normalize std'})
title('Spectral indices normalized mean std')
hold off

% rgb image with spectral indices
spectral_indices_normalized_rgb = zeros(p,n,3);
spectral_indices_normalized_rgb(:,:,1) = ferric_indice_normal;
spectral_indices_normalized_rgb(:,:,2) = ferrous_indice_normal;
spectral_indices_normalized_rgb(:,:,3) = alteration_indice_normal;
M = repmat(all(~spectral_indices_normalized_rgb,3),[1 1 3]);
spectral_indices_normalized_rgb(M) = 255;
figure(10)
imshow(spectral_indices_normalized_rgb,'InitialMagnification','fit');
title('RGB spectral indices image koutala sentintel 2 ')
hold off;

% run pca
% [~,~,explain,X_pca_2,~] = pca_fun(filtered_image_array', 2);
% [~,~,~,X_pca_3,~] = pca_fun(filtered_image_array', 3);
% [~,~,~,X_pca_6,~] = pca_fun(filtered_image_array', 6);
% figure(6)
% plot(X_pca_2(1,:), X_pca_2(2,:),'.b');
% title('PCA 2 principal components')
% hold off
% figure(7)
% plot3(X_pca_3(1,:), X_pca_3(2,:),X_pca_3(3,:),'.b');
% title('PCA 3 principal components')
% hold off

% run k-means
number_of_clusters = 10;
% full data k-means
[best_thetas_k_means_full,best_bel_k_means_full,best_J_k_means_full] = cfo_algorithms(filtered_image_array',number_of_clusters,2000, 'k_means');
% plot elbow curve to find the number of clusters
figure(11), plot(2:number_of_clusters,best_J_k_means_full(2:end))
title('K-means elbow plot - full')
hold off;

% run k-means with 6 pca
% [best_thetas_k_means_pca6,best_bel_k_means_pca6,best_J_k_means_pca6] = cfo_algorithms(X_pca_6,number_of_clusters,1000, 'k_means');
% plot elbow curve to find the number of clusters
% figure(5), plot(2:number_of_clusters,best_J_k_means_pca6(2:end))
% title('K-means elbow plot- pca-6 ')
% hold off;


% image clusters full k-means: 3,4,5,6
%3
[image_clustered_kmeans_3, clustering_cell_kmeans_3,image_clustered_ferric_kmeans_3,image_clustered_ferrous_kmeans_3,image_clustered_alteration_kmeans_3,image_clustered_ferric_normal_kmeans_3,image_clustered_ferrous_normal_kmeans_3,image_clustered_alteration_normal_kmeans_3,image_clustered_mask_kmeans_3] ...
    = image_clustering(X_total,filtered_image_array, best_bel_k_means_full, 3, p,n, false,"k-means 3 clusters");


% spectral indices
[mean_std_ferric_array_kmeans_3, mean_std_ferrous_array_kmeans_3,mean_std_alteration_array_kmeans_3] ...
    = spectal_indices_plots(image_clustered_ferric_kmeans_3,image_clustered_ferrous_kmeans_3,image_clustered_alteration_kmeans_3,image_clustered_ferric_normal_kmeans_3,image_clustered_ferrous_normal_kmeans_3,image_clustered_alteration_normal_kmeans_3,image_clustered_mask_kmeans_3,spectral_indices_normalized_rgb,false,"k-means 3 clusters");


%4
[image_clustered_kmeans_4,clustering_cell_kmeans_4,image_clustered_ferric_kmeans_4,image_clustered_ferrous_kmeans_4,image_clustered_alteration_kmeans_4,image_clustered_ferric_normal_kmeans_4,image_clustered_ferrous_normal_kmeans_4,image_clustered_alteration_normal_kmeans_4,image_clustered_mask_kmeans_4] ...
    = image_clustering(X_total,filtered_image_array, best_bel_k_means_full, 4, p,n,false,"k-means 4 clusters");


% spectral indices
[mean_std_ferric_array_kmeans_4, mean_std_ferrous_array_kmeans_4,mean_std_alteration_array_kmeans_4] ...
    = spectal_indices_plots(image_clustered_ferric_kmeans_4,image_clustered_ferrous_kmeans_4,image_clustered_alteration_kmeans_4,image_clustered_ferric_normal_kmeans_4,image_clustered_ferrous_normal_kmeans_4,image_clustered_alteration_normal_kmeans_4,image_clustered_mask_kmeans_4,spectral_indices_normalized_rgb,false,"k-means 4 clusters");

%5
[image_clustered_kmeans_5,clustering_cell_kmeans_5,image_clustered_ferric_kmeans_5,image_clustered_ferrous_kmeans_5,image_clustered_alteration_kmeans_5,image_clustered_ferric_normal_kmeans_5,image_clustered_ferrous_normal_kmeans_5,image_clustered_alteration_normal_kmeans_5,image_clustered_mask_kmeans_5] ...
    = image_clustering(X_total,filtered_image_array, best_bel_k_means_full, 5, p,n,false,"k-means 5 clusters");

% spectral indices
[mean_std_ferric_array_kmeans_5, mean_std_ferrous_array_kmeans_5,mean_std_alteration_array_kmeans_5] ...
    = spectal_indices_plots(image_clustered_ferric_kmeans_5,image_clustered_ferrous_kmeans_5,image_clustered_alteration_kmeans_5,image_clustered_ferric_normal_kmeans_5,image_clustered_ferrous_normal_kmeans_5,image_clustered_alteration_normal_kmeans_5,image_clustered_mask_kmeans_5,spectral_indices_normalized_rgb,false,"k-means 5 clusters");

%6
[image_clustered_kmeans_6,clustering_cell_kmeans_6,image_clustered_ferric_kmeans_6,image_clustered_ferrous_kmeans_6,image_clustered_alteration_kmeans_6,image_clustered_ferric_normal_kmeans_6,image_clustered_ferrous_normal_kmeans_6,image_clustered_alteration_normal_kmeans_6,image_clustered_mask_kmeans_6] ...
    = image_clustering(X_total,filtered_image_array, best_bel_k_means_full, 6, p,n,false,"k-means 6 clusters");

% spectral indices
[mean_std_ferric_array_kmeans_6, mean_std_ferrous_array_kmeans_6,mean_std_alteration_array_kmeans_6] ...
    = spectal_indices_plots(image_clustered_ferric_kmeans_6,image_clustered_ferrous_kmeans_6,image_clustered_alteration_kmeans_6,image_clustered_ferric_normal_kmeans_6,image_clustered_ferrous_normal_kmeans_6,image_clustered_alteration_normal_kmeans_6,image_clustered_mask_kmeans_6,spectral_indices_normalized_rgb,false,"k-means 6 clusters");

%7
[image_clustered_kmeans_7,clustering_cell_kmeans_7,image_clustered_ferric_kmeans_7,image_clustered_ferrous_kmeans_7,image_clustered_alteration_kmeans_7,image_clustered_ferric_normal_kmeans_7,image_clustered_ferrous_normal_kmeans_7,image_clustered_alteration_normal_kmeans_7,image_clustered_mask_kmeans_7] ...
    = image_clustering(X_total,filtered_image_array, best_bel_k_means_full, 7, p,n,false,"k-means 7 clusters");


% image clusters k-means with 6 pca: 3,4,5,6
%3
% [image_clustered_kmeans_3_pca6, clustering_cell_kmeans_3_pca6] = image_clustering(X_total,filtered_image_array, best_bel_k_means_pca6, 3, p,n);
% figure(10)
% imagesc(image_clustered_kmeans_3_pca6);
% title('K-means 3 clusters - pca 6')
% hold off
% %4
% [image_clustered_kmeans_4_pca6, clustering_cell_kmeans_4_pca6] = image_clustering(X_total,filtered_image_array, best_bel_k_means_pca6, 4, p,n);
% figure(11)
% imagesc(image_clustered_kmeans_4_pca6);
% title('K-means 4 clusters - pca 6')
% hold off
% %5
% [image_clustered_kmeans_5_pca6, clustering_cell_kmeans_5_pca6] = image_clustering(X_total,filtered_image_array, best_bel_k_means_pca6, 5, p,n);
% figure(12)
% imagesc(image_clustered_kmeans_5_pca6);
% title('K-means 5 clusters - pca 6')
% hold off
% %6
% [image_clustered_kmeans_6_pca6, clustering_cell_kmeans_6_pca6] = image_clustering(X_total,filtered_image_array, best_bel_k_means_pca6, 6, p,n);
% figure(13)
% imagesc(image_clustered_kmeans_6_pca6);
% title('K-means 6 clusters - pca 6')
% hold off

% clustring plots full -k means
silhouette_total_mean_kmeans_3 = clustering_plots(filtered_image_array,clustering_cell_kmeans_3,best_bel_k_means_full{3},feature_names,"k-means 3 clusters",false);
silhouette_total_mean_kmeans_4 = clustering_plots(filtered_image_array,clustering_cell_kmeans_4,best_bel_k_means_full{4},feature_names,"k-means 4 clusters",false);
silhouette_total_mean_kmeans_5 = clustering_plots(filtered_image_array,clustering_cell_kmeans_5,best_bel_k_means_full{5},feature_names,"k-means 5 clusters",false);
silhouette_total_mean_kmeans_6 = clustering_plots(filtered_image_array,clustering_cell_kmeans_6,best_bel_k_means_full{6},feature_names,"k-means 6 clusters",false);
silhouette_total_mean_kmeans_7 = clustering_plots(filtered_image_array,clustering_cell_kmeans_7,best_bel_k_means_full{7},feature_names,"k-means 7 clusters",false);

% silhouette mean elbow plot
silhouette_elbow_plot([silhouette_total_mean_kmeans_3 silhouette_total_mean_kmeans_4 silhouette_total_mean_kmeans_5 ...
    silhouette_total_mean_kmeans_6 silhouette_total_mean_kmeans_7])

% clustring plots 6 pca -k means
% clustering_plots(filtered_image_array,clustering_cell_kmeans_3_pca6,best_bel_k_means_pca6{3},feature_names,"k-means 3 clusters - 6 pca");
% clustering_plots(filtered_image_array,clustering_cell_kmeans_4_pca6,best_bel_k_means_pca6{4},feature_names,"k-means 4 clusters - 6 pca");
% clustering_plots(filtered_image_array,clustering_cell_kmeans_5_pca6,best_bel_k_means_pca6{5},feature_names,"k-means 5 clusters - 6 pca");
% clustering_plots(filtered_image_array,clustering_cell_kmeans_6_pca6,best_bel_k_means_pca6{6},feature_names,"k-means 6 clusters - 6 pca");


save_plots('C:\Users\P70556\Desktop\clustering\ergasia\plots\sentinel');