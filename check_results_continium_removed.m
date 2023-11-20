close all
clear

% load("clustering_koutala_sentinel_continious_removal_kmeans.mat")
load("clustering_koutala_sentinel_continious_removal_frechet.mat")
load("clustering_koutala_sentinel_continious_removal_custom.mat")


% validation

% figure (200), hold on
% plot(squeeze(D(14,10,:)), 'r');
% plot(squeeze(D(14,11,:)), 'r');
% plot(squeeze(D(14,12,:)), 'r');
% 
% plot(squeeze(D(16,22,:)), 'b');
% plot(squeeze(D(16,23,:)), 'b');
% plot(squeeze(D(16,24,:)), 'b');
% plot(squeeze(D(16,25,:)), 'b');
% plot(squeeze(D(17,22,:)), 'b');
% plot(squeeze(D(17,23,:)), 'b');
% plot(squeeze(D(17,24,:)), 'b');
% plot(squeeze(D(17,25,:)), 'b');


% k-means

% figure(100)
% plot(clustering_cell_kmeans_25{11}')
% % 
% figure(101)
% plot(clustering_cell_kmeans_25{19}')
% % 
% figure(102)
% plot(clustering_cell_kmeans_25{14}')
% % 
% figure(103)
% plot(clustering_cell_kmeans_25{8}')

% frechet

% figure(100)
% plot(clustering_cell_frechet_27{6}')
% 
% figure(101)
% plot(clustering_cell_frechet_27{20}')
% 
% figure(102)
% plot(clustering_cell_frechet_27{13}')
% 
% figure(103)
% plot(clustering_cell_frechet_27{23}')
% 
% figure(104)
% plot(clustering_cell_frechet_27{9}')
% 
% figure(105)
% plot(clustering_cell_frechet_27{1}')

% custom

figure(100)
plot(clustering_cell_hier{14}')

figure(101)
plot(clustering_cell_hier{13}')
% 
figure(102)
plot(clustering_cell_hier{2}')
% 
figure(103)
plot(clustering_cell_hier{1}')

figure(104)
plot(clustering_cell_hier{3}')

figure(105)
plot(clustering_cell_hier{27}')

figure(106)
plot(clustering_cell_hier{15}')
