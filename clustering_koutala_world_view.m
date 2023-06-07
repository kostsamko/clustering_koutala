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

ferric_indice_normal = (D(:,:,5) - D(:,:,3)) ./ (D(:,:,5) + D(:,:,3));
ferric_indice_normal(isnan(ferric_indice_normal)) = 0;
ferric_indice_normal(ferric_indice_normal < 0) = 0;
ferric_mean_normal = mean(nonzeros(ferric_indice_normal) , 'all');
ferric_std_normal = std(nonzeros(ferric_indice_normal),0,'all');

figure(2)
imshow(ferric_indice,'DisplayRange',[],'InitialMagnification','fit');
title('Ferric indice koutala worldview 3 ')
hold off;

figure(3)
imshow(ferric_indice_normal,'DisplayRange',[],'InitialMagnification','fit');
title('Ferric-normal indice koutala worldview 3 ')
hold off;


figure(4)
y = [ferric_mean ferric_std,ferric_mean_normal,ferric_std_normal];
barh(y)
yticklabels({'Ferric mean','Ferric std','Ferric-normal mean','Ferric-normal std'})
hold off

% run k-means 
number_of_clusters = 10;
% full data k-means
[best_thetas_k_means_full,best_bel_k_means_full,best_J_k_means_full] = cfo_algorithms(filtered_image_array',number_of_clusters,1000, 'k_means');
% plot elbow curve to find the number of clusters
figure(5), plot(2:number_of_clusters,best_J_k_means_full(2:end))
title('K-means elbow plot - full') 
hold off;


% image clusters full k-means: 3,4,5,6
%3
[image_clustered_kmeans_3, clustering_cell_kmeans_3,image_clustered_ferric_kmeans_3,~,~,image_clustered_ferric_normal_kmeans_3,~,~,~] = image_clustering(X_total,filtered_image_array, best_bel_k_means_full, 3, p,n, true," k-means 3 clusters");


% spectral indices
[mean_std_ferric_array_kmeans_3, ~,~] = spectal_indices_plots(image_clustered_ferric_kmeans_3,{},{},image_clustered_ferric_normal_kmeans_3,{},{},{},{},true," k-means 3 clusters");


%4
[image_clustered_kmeans_4,clustering_cell_kmeans_4,image_clustered_ferric_kmeans_4,~,~,image_clustered_ferric_normal_kmeans_4,~,~,~] = image_clustering(X_total,filtered_image_array, best_bel_k_means_full, 4, p,n,true," k-means 4 clusters");


% spectral indices
[mean_std_ferric_array_kmeans_4, ~,~] = spectal_indices_plots(image_clustered_ferric_kmeans_4,{},{},image_clustered_ferric_normal_kmeans_4,{},{},{},{},true," k-means 4 clusters");

%5
[image_clustered_kmeans_5,clustering_cell_kmeans_5,image_clustered_ferric_kmeans_5,~,~,image_clustered_ferric_normal_kmeans_5,~,~,~] = image_clustering(X_total,filtered_image_array, best_bel_k_means_full, 5, p,n,true," k-means 5 clusters");

% spectral indices
[mean_std_ferric_array_kmeans_5, ~,~] = spectal_indices_plots(image_clustered_ferric_kmeans_5,{},{},image_clustered_ferric_normal_kmeans_5,{},{},{},{},true," k-means 5 clusters");

%6
[image_clustered_kmeans_6,clustering_cell_kmeans_6,image_clustered_ferric_kmeans_6,~,~,image_clustered_ferric_normal_kmeans_6,~,~,~] = image_clustering(X_total,filtered_image_array, best_bel_k_means_full, 6, p,n,true," k-means 6 clusters");

% spectral indices
[mean_std_ferric_array_kmeans_6, ~,~] = spectal_indices_plots(image_clustered_ferric_kmeans_6,{},{},image_clustered_ferric_normal_kmeans_6,{},{},{},{},true," k-means 6 clusters");

%7
[image_clustered_kmeans_7,clustering_cell_kmeans_7,image_clustered_ferric_kmeans_7,~,~,image_clustered_ferric_normal_kmeans_7,~,~,~] = image_clustering(X_total,filtered_image_array, best_bel_k_means_full, 7, p,n,true," k-means 7 clusters");

% clustring plots full -k means
silhouette_total_mean_kmeans_3 = clustering_plots(filtered_image_array,clustering_cell_kmeans_3,best_bel_k_means_full{3},feature_names,"k-means 3 clusters",false);
silhouette_total_mean_kmeans_4 = clustering_plots(filtered_image_array,clustering_cell_kmeans_4,best_bel_k_means_full{4},feature_names,"k-means 4 clusters",false);
silhouette_total_mean_kmeans_5 = clustering_plots(filtered_image_array,clustering_cell_kmeans_5,best_bel_k_means_full{5},feature_names,"k-means 5 clusters",false);
silhouette_total_mean_kmeans_6 = clustering_plots(filtered_image_array,clustering_cell_kmeans_6,best_bel_k_means_full{6},feature_names,"k-means 6 clusters",false);
silhouette_total_mean_kmeans_7 = clustering_plots(filtered_image_array,clustering_cell_kmeans_7,best_bel_k_means_full{7},feature_names,"k-means 7 clusters",false);

% silhouette mean elbow plot
silhouette_elbow_plot([silhouette_total_mean_kmeans_3 silhouette_total_mean_kmeans_4 silhouette_total_mean_kmeans_5 ...
    silhouette_total_mean_kmeans_6 silhouette_total_mean_kmeans_7])

save_plots('C:\Users\P70556\Desktop\clustering\ergasia\plots\worldview');