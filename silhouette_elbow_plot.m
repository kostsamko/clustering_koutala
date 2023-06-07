function[] = silhouette_elbow_plot(silhouette_total_mean_array)

[~, number_of_clusters] = size(silhouette_total_mean_array);
[figure_index,~] = size(get(0,'Children'));
figure(figure_index+1), plot(3:number_of_clusters+2,silhouette_total_mean_array)
title('K-means silhouette mean elbow plot - full')
hold off;