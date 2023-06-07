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


% run frechet distance hier
[best_bel_sequential_full] = sequential_custom(filtered_image_array,0.01,0.003);
[number_of_points,~] = size(filtered_image_array);
number_of_clusters = max(best_bel_sequential_full);
best_bel_sequential_full_cell = cell(1,number_of_clusters);
for i=1:number_of_clusters
    best_bel_sequential_full_cell{i} = zeros(1,number_of_points);
end
best_bel_sequential_full_cell{number_of_clusters} = best_bel_sequential_full;

% image clusters sequential
%3
[image_clustered_sequential, clustering_cell_sequential,~,~,~,~,~,~,~] ...
    = image_clustering(X_total,filtered_image_array, best_bel_sequential_full_cell, number_of_clusters, p,n, false,["sequential" num2str(number_of_clusters) "clusters"]);

% save_plots('C:\Users\P70556\Desktop\clustering\ergasia\plots\sentinel_continous_removed_custom');