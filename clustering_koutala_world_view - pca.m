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
filtered_image_array = X_total(all(X_total,2),:);


% spectral indices in the original image
ferric_indice = D(:,:,5) ./ D(:,:,3);
ferric_indice(isnan(ferric_indice)) = 0;
ferric_mean = mean(nonzeros(ferric_indice) , 'all');
ferric_std = std(nonzeros(ferric_indice),0,'all');

figure(2)
imshow(ferric_indice,'DisplayRange',[],'InitialMagnification','fit');
title('Ferric indice koutala worldview 3 ')
hold off;


figure(3)
y = [ferric_mean ferric_std];
barh(y)
yticklabels({'Ferric mean','Ferric std'})
hold off



% run pca
% [~,~,explain,X_pca_2,~] = pca_fun(filtered_image_array', 2);
% [~,~,~,X_pca_3,~] = pca_fun(filtered_image_array', 3);
% [~,~,~,X_pca_6,~] = pca_fun(filtered_image_array', 6);
% figure(2)
% plot(X_pca_2(1,:), X_pca_2(2,:),'.b');
% title('PCA 2 principal components') 
% hold off
% figure(3)
% plot3(X_pca_3(1,:), X_pca_3(2,:),X_pca_3(3,:),'.b');
% title('PCA 3 principal components') 
% hold off

% run k-means 
number_of_clusters = 10;
% full data k-means
[best_thetas_k_means_full,best_bel_k_means_full,best_J_k_means_full] = cfo_algorithms(filtered_image_array',number_of_clusters,1000, 'k_means');
% plot elbow curve to find the number of clusters
figure(4), plot(2:number_of_clusters,best_J_k_means_full(2:end))
title('K-means elbow plot - full') 
hold off;



% run k-means with 6 pca
% [best_thetas_k_means_pca6,best_bel_k_means_pca6,best_J_k_means_pca6] = cfo_algorithms(X_pca_6,number_of_clusters,100, 'k_means');
% % plot elbow curve to find the number of clusters
% figure(5), plot(2:number_of_clusters,best_J_k_means_pca6(2:end))
% title('K-means elbow plot- pca-6 ') 
% hold off;



% image clusters full k-means: 3,4,5,6
%3
[image_clustered_kmeans_3, clustering_cell_kmeans_3,image_clustered_ferric_kmeans_3,~,~,~,~,~,~] = image_clustering(X_total,filtered_image_array, best_bel_k_means_full, 3, p,n, true);


% spectral indices
[mean_std_ferric_array_kmeans_3, ~,~] = spectal_indices_plots(image_clustered_ferric_kmeans_3,{},{},{},{},{},{},{},true);


%4
[image_clustered_kmeans_4,clustering_cell_kmeans_4,image_clustered_ferric_kmeans_4,~,~,~,~,~,~] = image_clustering(X_total,filtered_image_array, best_bel_k_means_full, 4, p,n,true);


% spectral indices
[mean_std_ferric_array_kmeans_4, ~,~] = spectal_indices_plots(image_clustered_ferric_kmeans_4,{},{},{},{},{},{},{},true);

%5
[image_clustered_kmeans_5,clustering_cell_kmeans_5,image_clustered_ferric_kmeans_5,~,~,~,~,~,~] = image_clustering(X_total,filtered_image_array, best_bel_k_means_full, 5, p,n,true);

% spectral indices
[mean_std_ferric_array_kmeans_5, ~,~] = spectal_indices_plots(image_clustered_ferric_kmeans_5,{},{},{},{},{},{},{},true);

%6
[image_clustered_kmeans_6,clustering_cell_kmeans_6,image_clustered_ferric_kmeans_6,~,~,~,~,~,~] = image_clustering(X_total,filtered_image_array, best_bel_k_means_full, 6, p,n,true);

% spectral indices
[mean_std_ferric_array_kmeans_6, ~,~] = spectal_indices_plots(image_clustered_ferric_kmeans_6,{},{},{},{},{},{},{},true);

%7
[image_clustered_kmeans_7,clustering_cell_kmeans_7,image_clustered_ferric_kmeans_7,~,~,~,~,~,~] = image_clustering(X_total,filtered_image_array, best_bel_k_means_full, 7, p,n,true);

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
silhouette_total_mean_kmeans_3 = clustering_plots(filtered_image_array,clustering_cell_kmeans_3,best_bel_k_means_full{3},feature_names,"k-means 3 clusters");
silhouette_total_mean_kmeans_4 = clustering_plots(filtered_image_array,clustering_cell_kmeans_4,best_bel_k_means_full{4},feature_names,"k-means 4 clusters");
silhouette_total_mean_kmeans_5 = clustering_plots(filtered_image_array,clustering_cell_kmeans_5,best_bel_k_means_full{5},feature_names,"k-means 5 clusters");
silhouette_total_mean_kmeans_6 = clustering_plots(filtered_image_array,clustering_cell_kmeans_6,best_bel_k_means_full{6},feature_names,"k-means 6 clusters");
silhouette_total_mean_kmeans_7 = clustering_plots(filtered_image_array,clustering_cell_kmeans_7,best_bel_k_means_full{7},feature_names,"k-means 7 clusters");

% silhouette mean elbow plot
silhouette_elbow_plot([silhouette_total_mean_kmeans_3 silhouette_total_mean_kmeans_4 silhouette_total_mean_kmeans_5 ...
    silhouette_total_mean_kmeans_6 silhouette_total_mean_kmeans_7])


% clustring plots 6 pca -k means 
% clustering_plots(filtered_image_array,clustering_cell_kmeans_3_pca6,best_bel_k_means_pca6{3},feature_names,"k-means 3 clusters - 6 pca");
% clustering_plots(filtered_image_array,clustering_cell_kmeans_4_pca6,best_bel_k_means_pca6{4},feature_names,"k-means 4 clusters - 6 pca");
% clustering_plots(filtered_image_array,clustering_cell_kmeans_5_pca6,best_bel_k_means_pca6{5},feature_names,"k-means 5 clusters - 6 pca");
% clustering_plots(filtered_image_array,clustering_cell_kmeans_6_pca6,best_bel_k_means_pca6{6},feature_names,"k-means 6 clusters - 6 pca");

save_plots('C:\Users\P70556\Desktop\clustering\ergasia\plots\worldview');