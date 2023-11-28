close all
clear

% load("clustering_koutala_world_view.mat");
% load("clustering_koutala_world_view_frechet.mat")
load("clustering_koutala_world_view_custom.mat")


tick_labels = cell(1,number_of_clusters +1);
tick_labels{1} = 'Sea';
for i=2:number_of_clusters +1
    tick_labels{i} = strcat('Cluster ', int2str(i-1));
end


[figure_index,~] = size(get(0,'Children'));
figure(figure_index+1)
imagesc(image_clustered_hier);
colorbar('Ticks',0:number_of_clusters,...
    'TickLabels',tick_labels)
title(strcat("dfs"))
hold off


% validation

% figure (200), hold on
% plot(squeeze(D(42,59,:)), 'r');
% plot(squeeze(D(42,60,:)), 'r');
% plot(squeeze(D(42,61,:)), 'r');
% plot(squeeze(D(42,62,:)), 'r');
% 
% plot(squeeze(D(45,88,:)), 'g');
% plot(squeeze(D(45,89,:)), 'g');
% plot(squeeze(D(44,88,:)), 'g');
% plot(squeeze(D(44,89,:)), 'g');
% 
% plot(squeeze(D(70,155,:)), 'b');
% plot(squeeze(D(71,155,:)), 'b');
% plot(squeeze(D(74,158,:)), 'b');
% plot(squeeze(D(74,159,:)), 'b');
% plot(squeeze(D(66,136,:)), 'b');
% plot(squeeze(D(67,137,:)), 'b');
% plot(squeeze(D(70,136,:)), 'b');
% plot(squeeze(D(70,137,:)), 'b');


% 
% plot(squeeze(D(68,155,:)), 'b');
% plot(squeeze(D(69,155,:)), 'b');
% plot(squeeze(D(70,155,:)), 'b');
% plot(squeeze(D(71,155,:)), 'b');
% plot(squeeze(D(74,158,:)), 'b');
% plot(squeeze(D(74,159,:)), 'b');
% plot(squeeze(D(74,160,:)), 'b');
% plot(squeeze(D(74,161,:)), 'b');
% 
% plot(squeeze(D(66,136,:)), 'g');
% plot(squeeze(D(67,137,:)), 'g');
% plot(squeeze(D(70,136,:)), 'g');
% plot(squeeze(D(70,137,:)), 'g');

% k-means

% figure(100)
% plot(clustering_cell_kmeans_8{1}')
% % 
% figure(101)
% plot(clustering_cell_kmeans_8{2}')
% % 
% figure(102)
% plot(clustering_cell_kmeans_8{3}')
% % 
% figure(103)
% plot(clustering_cell_kmeans_8{4}')
% figure(104)
% plot(clustering_cell_kmeans_8{5}')
% figure(105)
% plot(clustering_cell_kmeans_8{6}')
% figure(106)
% plot(clustering_cell_kmeans_8{7}')
% figure(107)
% plot(clustering_cell_kmeans_8{8}')

% frechet

% figure(100)
% plot(clustering_cell_frechet_8{1}')
% 
% figure(101)
% plot(clustering_cell_frechet_8{2}')
% 
% figure(102)
% plot(clustering_cell_frechet_8{3}')
% 
% figure(103)
% plot(clustering_cell_frechet_8{4}')
% 
% figure(104)
% plot(clustering_cell_frechet_8{5}')
% 
% figure(105)
% plot(clustering_cell_frechet_8{6}')
% figure(106)
% plot(clustering_cell_frechet_8{7}')
% figure(107)
% plot(clustering_cell_frechet_8{8}')

% custom

figure(100)
plot(clustering_cell_hier{1}')

figure(101)
plot(clustering_cell_hier{2}')
% 
figure(102)
plot(clustering_cell_hier{3}')
% 
figure(103)
plot(clustering_cell_hier{4}')

figure(104)
plot(clustering_cell_hier{5}')

figure(105)
plot(clustering_cell_hier{6}')

figure(106)
plot(clustering_cell_hier{7}')
figure(107)
plot(clustering_cell_hier{8}')
