close all
clear

% load("clustering_koutala_sentinel_refl_kmeans.mat")
% load("clustering_koutala_sentinel_refl_frechet.mat")
load("clustering_koutala_sentinel_refl_custom.mat")
% k-means

% figure(100)
% plot(clustering_cell_kmeans_22{12}')
% 
% figure(101)
% plot(clustering_cell_kmeans_22{21}')
% 
% figure(102)
% plot(clustering_cell_kmeans_22{7}')
% 
% figure(103)
% plot(clustering_cell_kmeans_22{14}')

% frechet

% figure(100)
% plot(clustering_cell_frechet_26{7}')
% 
% figure(101)
% plot(clustering_cell_frechet_26{2}')
% 
% figure(102)
% plot(clustering_cell_frechet_26{23}')
% 
% figure(103)
% plot(clustering_cell_frechet_26{9}')
% 
% figure(104)
% plot(clustering_cell_frechet_26{11}')

% custom

figure(100)
plot(clustering_cell_hier{25}')

figure(101)
plot(clustering_cell_hier{10}')
% 
figure(102)
plot(clustering_cell_hier{14}')
% 
figure(103)
plot(clustering_cell_hier{4}')

figure(104)
plot(clustering_cell_hier{1}')

figure(105)
plot(clustering_cell_hier{12}')
