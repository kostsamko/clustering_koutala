close all
clear

% load("clustering_koutala_sentinel_refl_kmeans.mat")
% load("clustering_koutala_sentinel_refl_frechet.mat")
load("clustering_koutala_sentinel_refl_custom.mat")


% validation

figure (200), hold on
h = plot(squeeze(D(14,10,:)), 'r', 'LineWidth',3);
h = plot(squeeze(D(14,11,:)), 'r', 'LineWidth',3);
h = plot(squeeze(D(14,12,:)), 'r', 'LineWidth',3);

h = plot(squeeze(D(16,22,:)), 'b', 'LineWidth',3);
h = plot(squeeze(D(16,23,:)), 'b', 'LineWidth',3);
h = plot(squeeze(D(16,24,:)), 'b', 'LineWidth',3);
h = plot(squeeze(D(16,25,:)), 'b', 'LineWidth',3);
h = plot(squeeze(D(17,22,:)), 'b', 'LineWidth',3);
h = plot(squeeze(D(17,23,:)), 'b', 'LineWidth',3);
h = plot(squeeze(D(17,24,:)), 'b', 'LineWidth',3);
h = plot(squeeze(D(17,25,:)), 'b', 'LineWidth',3);
set(gca,'FontSize',20, 'FontName', 'Courier', 'FontWeight','bold')


% k-means 22
% number_of_clusters = 22;
% tick_labels = cell(1,number_of_clusters +1);
% tick_labels{1} = 'Sea';
% for i=2:number_of_clusters +1
%     tick_labels{i} = strcat('Cluster ', int2str(i-1));
% end
% 
% 
% [figure_index,~] = size(get(0,'Children'));
% figure(figure_index+1)
% imagesc(image_clustered_kmeans_22);
% colorbar('Ticks',0:number_of_clusters,...
%     'TickLabels',tick_labels)
% title(strcat(["K-means" num2str(number_of_clusters) "clusters"]))
% hold off
% 
% for i=1:p
%     for j=1:n
%         if image_clustered_kmeans_22(i,j) ~=0
%             text(j,i, num2str(image_clustered_kmeans_22(i,j)),'Color','red');
%         end
%     end
% end


% plot_signature(clustering_cell_kmeans_22{12}')
% 
% plot_signature(clustering_cell_kmeans_22{21}')
% 
% plot_signature(clustering_cell_kmeans_22{7}')
% 
% plot_signature(clustering_cell_kmeans_22{14}')

% frechet 26

% number_of_clusters = 26;
% tick_labels = cell(1,number_of_clusters +1);
% tick_labels{1} = 'Sea';
% for i=2:number_of_clusters +1
%     tick_labels{i} = strcat('Cluster ', int2str(i-1));
% end
% 
% 
% [figure_index,~] = size(get(0,'Children'));
% figure(figure_index+1)
% imagesc(image_clustered_frechet_26);
% colorbar('Ticks',0:number_of_clusters,...
%     'TickLabels',tick_labels)
% title(strcat(["Hier-Fréchet" num2str(number_of_clusters) "clusters"]))
% hold off
% 
% for i=1:p
%     for j=1:n
%         if image_clustered_frechet_26(i,j) ~=0
%             text(j,i, num2str(image_clustered_frechet_26(i,j)),'Color','red');
%         end
%     end
% end


% plot_signature(clustering_cell_frechet_26{7}')
% 
% plot_signature(clustering_cell_frechet_26{2}')
% 
% plot_signature(clustering_cell_frechet_26{23}')
% 
% plot_signature(clustering_cell_frechet_26{9}')
% 
% plot_signature(clustering_cell_frechet_26{11}')

% custom 29

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
% title(strcat(["hier after sequential" num2str(new_number_of_clusters) "clusters"]))
% hold off
% 
% for i=1:p
%     for j=1:n
%         if image_clustered_hier(i,j) ~=0
%             text(j,i, num2str(image_clustered_hier(i,j)),'Color','red');
%         end
%     end
% end


% plot_signature(clustering_cell_hier{25}')
% 
% plot_signature(clustering_cell_hier{10}')
% 
% plot_signature(clustering_cell_hier{16}')
% 
% plot_signature(clustering_cell_hier{2}')
% 
% plot_signature(clustering_cell_hier{3}')
% 
% plot_signature(clustering_cell_hier{12}')
