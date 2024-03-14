close all
clear

% load("clustering_koutala_world_view.mat");
% load("clustering_koutala_world_view_frechet.mat")
load("clustering_koutala_world_view_custom.mat")


% tick_labels = cell(1,number_of_clusters +1);
% tick_labels{1} = 'Sea';
% for i=2:number_of_clusters +1
%     tick_labels{i} = strcat('Cluster ', int2str(i-1));
% end
% 
% 
% [figure_index,~] = size(get(0,'Children'));
% figure(figure_index+1)
% imagesc(image_clustered_hier);
% colorbar('Ticks',0:number_of_clusters,...
%     'TickLabels',tick_labels)
% title(strcat("dfs"))
% hold off


% validation

% figure (200), hold on
% h = plot(squeeze(D(42,59,:)), 'r','LineWidth',3);
% h = plot(squeeze(D(42,60,:)), 'r','LineWidth',3);
% h = plot(squeeze(D(42,61,:)), 'r','LineWidth',3);
% h = plot(squeeze(D(42,62,:)), 'r','LineWidth',3);

% h = plot(squeeze(D(45,88,:)), 'g','LineWidth',3);
% h = plot(squeeze(D(45,89,:)), 'g','LineWidth',3);
% h = plot(squeeze(D(44,88,:)), 'g','LineWidth',3);
% h = plot(squeeze(D(44,89,:)), 'g','LineWidth',3);

% h = plot(squeeze(D(70,155,:)), 'b','LineWidth',3);
% h = plot(squeeze(D(71,155,:)), 'b','LineWidth',3);
% h = plot(squeeze(D(74,158,:)), 'b','LineWidth',3);
% h = plot(squeeze(D(74,159,:)), 'b','LineWidth',3);
% h = plot(squeeze(D(66,136,:)), 'b','LineWidth',3);
% h = plot(squeeze(D(67,137,:)), 'b','LineWidth',3);
% h = plot(squeeze(D(70,136,:)), 'b','LineWidth',3);
% h = plot(squeeze(D(70,137,:)), 'b','LineWidth',3);
% set(gca,'FontSize',20, 'FontName', 'Courier', 'FontWeight','bold')


% k-means

% plot_signature(clustering_cell_kmeans_8{1}')
% plot_signature(clustering_cell_kmeans_8{2}')
% plot_signature(clustering_cell_kmeans_8{3}')
% plot_signature(clustering_cell_kmeans_8{4}')
% plot_signature(clustering_cell_kmeans_8{5}')
% plot_signature(clustering_cell_kmeans_8{6}')
% plot_signature(clustering_cell_kmeans_8{7}')
% plot_signature(clustering_cell_kmeans_8{8}')

% frechet

% plot_signature(clustering_cell_frechet_8{1}')
% plot_signature(clustering_cell_frechet_8{2}')
% plot_signature(clustering_cell_frechet_8{3}')
% plot_signature(clustering_cell_frechet_8{4}')
% plot_signature(clustering_cell_frechet_8{5}')
% plot_signature(clustering_cell_frechet_8{6}')
% plot_signature(clustering_cell_frechet_8{7}')
% plot_signature(clustering_cell_frechet_8{8}')

% custom

plot_signature(clustering_cell_hier{1}')
plot_signature(clustering_cell_hier{2}')
plot_signature(clustering_cell_hier{3}')
plot_signature(clustering_cell_hier{4}')
plot_signature(clustering_cell_hier{5}')
plot_signature(clustering_cell_hier{6}')
plot_signature(clustering_cell_hier{7}')
plot_signature(clustering_cell_hier{8}')
