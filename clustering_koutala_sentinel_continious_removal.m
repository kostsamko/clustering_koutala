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
number_of_clusters = 10;
% full data k-means
[best_thetas_k_means_full,best_bel_k_means_full,best_J_k_means_full] = cfo_algorithms(filtered_image_array',number_of_clusters,5000, 'k_means');
% plot elbow curve to find the number of clusters
figure(3), plot(2:number_of_clusters,best_J_k_means_full(2:end))
title('K-means elbow plot - full')
hold off;

% image clusters full k-means: 3,4,5,6
%3
[image_clustered_kmeans_3, clustering_cell_kmeans_3,~,~,~,~,~,~,~] ...
    = image_clustering(X_total,filtered_image_array, best_bel_k_means_full, 3, p,n, false," k-means 3 clusters");


%4
[image_clustered_kmeans_4,clustering_cell_kmeans_4,~,~,~,~,~,~,~] ...
    = image_clustering(X_total,filtered_image_array, best_bel_k_means_full, 4, p,n,false," k-means 4 clusters");


%5
[image_clustered_kmeans_5,clustering_cell_kmeans_5,~,~,~,~,~,~,~] ...
    = image_clustering(X_total,filtered_image_array, best_bel_k_means_full, 5, p,n,false," k-means 5 clusters");

%6
[image_clustered_kmeans_6,clustering_cell_kmeans_6,~,~,~,~,~,~,~] ...
    = image_clustering(X_total,filtered_image_array, best_bel_k_means_full, 6, p,n,false," k-means 6 clusters");


%7
[image_clustered_kmeans_7,clustering_cell_kmeans_7,~,~,~,~,~,~,~] ...
    = image_clustering(X_total,filtered_image_array, best_bel_k_means_full, 7, p,n,false," k-means 7 clusters");




% clustring plots full -k means
silhouette_total_mean_kmeans_3 = clustering_plots(filtered_image_array,clustering_cell_kmeans_3,best_bel_k_means_full{3},feature_names,"k-means 3 clusters",true);
silhouette_total_mean_kmeans_4 = clustering_plots(filtered_image_array,clustering_cell_kmeans_4,best_bel_k_means_full{4},feature_names,"k-means 4 clusters",true);
silhouette_total_mean_kmeans_5 = clustering_plots(filtered_image_array,clustering_cell_kmeans_5,best_bel_k_means_full{5},feature_names,"k-means 5 clusters",true);
silhouette_total_mean_kmeans_6 = clustering_plots(filtered_image_array,clustering_cell_kmeans_6,best_bel_k_means_full{6},feature_names,"k-means 6 clusters",true);
silhouette_total_mean_kmeans_7 = clustering_plots(filtered_image_array,clustering_cell_kmeans_7,best_bel_k_means_full{7},feature_names,"k-means 7 clusters",true);

% silhouette mean elbow plot
silhouette_elbow_plot([silhouette_total_mean_kmeans_3 silhouette_total_mean_kmeans_4 silhouette_total_mean_kmeans_5 ...
    silhouette_total_mean_kmeans_6 silhouette_total_mean_kmeans_7])


save_plots('C:\Users\P70556\Desktop\clustering\ergasia\plots\sentinel-continious-removal');