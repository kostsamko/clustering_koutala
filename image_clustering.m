function[image_clustered, clustering_cell,image_clustered_ferric,image_clustered_ferrous,image_alteration_index,image_clustered_ferric_normal,image_clustered_ferrous_normal,image_alteration_index_normal,image_clustered_mask]...
    = image_clustering(image_data,filtered_data,bel,number_of_clusters,first_dimension,second_dimension, is_world_view, algorithm_title)

clustering_cell = cell(1,number_of_clusters);
for j=1:number_of_clusters
    clustering_cell{j} = filtered_data(bel{number_of_clusters} == j,:);
end
image_clustered = zeros(first_dimension,second_dimension);
image_clustered_mask = cell(1,number_of_clusters);
image_clustered_ferric = cell(1,number_of_clusters);
image_clustered_ferrous = cell(1,number_of_clusters);
image_alteration_index = cell(1,number_of_clusters);
image_clustered_ferric_normal = cell(1,number_of_clusters);
image_clustered_ferrous_normal = cell(1,number_of_clusters);
image_alteration_index_normal = cell(1,number_of_clusters);
for j=1:number_of_clusters
    image_clustered(ismember(image_data, clustering_cell{j},"rows")) = j ;
    image_clustered_ferric{j} = zeros(first_dimension,second_dimension);
    image_clustered_ferric_normal{j} = zeros(first_dimension,second_dimension);
    if is_world_view
       image_clustered_ferric{j}(ismember(image_data, clustering_cell{j},"rows")) = clustering_cell{1,j}(:,5)./clustering_cell{1,j}(:,3);
       image_clustered_ferric_normal{j}(ismember(image_data, clustering_cell{j},"rows")) = (clustering_cell{1,j}(:,5) - clustering_cell{1,j}(:,3)) ./ (clustering_cell{1,j}(:,5) + clustering_cell{1,j}(:,3)); 
       image_clustered_ferric_normal{j}(image_clustered_ferric_normal{j}<0) = 0; 
    else
       image_clustered_mask{j} = zeros(first_dimension,second_dimension); 
       image_clustered_mask{j}(ismember(image_data, clustering_cell{j},"rows")) = 1;
       image_clustered_ferrous{j} = zeros(first_dimension,second_dimension);
       image_alteration_index{j} = zeros(first_dimension,second_dimension);
       image_clustered_ferric{j}(ismember(image_data, clustering_cell{j},"rows")) = clustering_cell{1,j}(:,4)./clustering_cell{1,j}(:,2);
       image_clustered_ferrous{j}(ismember(image_data, clustering_cell{j},"rows")) = (clustering_cell{1,j}(:,12)./clustering_cell{1,j}(:,8)) + (clustering_cell{1,j}(:,3)./clustering_cell{1,j}(:,4));
       image_alteration_index{j}(ismember(image_data, clustering_cell{j},"rows")) = clustering_cell{1,j}(:,11)./clustering_cell{1,j}(:,12);
       
       image_clustered_ferrous_normal{j} = zeros(first_dimension,second_dimension);
       image_alteration_index_normal{j} = zeros(first_dimension,second_dimension);
       image_clustered_ferric_normal{j}(ismember(image_data, clustering_cell{j},"rows")) = (clustering_cell{1,j}(:,4) - clustering_cell{1,j}(:,2)) ./ (clustering_cell{1,j}(:,4) + clustering_cell{1,j}(:,2));
       image_clustered_ferric_normal{j}(image_clustered_ferric_normal{j}<0) = 0;
       image_clustered_ferrous_normal{j}(ismember(image_data, clustering_cell{j},"rows")) = ((clustering_cell{1,j}(:,12) - clustering_cell{1,j}(:,8)) ./ (clustering_cell{1,j}(:,12) + clustering_cell{1,j}(:,8))) + ((clustering_cell{1,j}(:,3) - clustering_cell{1,j}(:,4)) ./ (clustering_cell{1,j}(:,3) + clustering_cell{1,j}(:,4)));
       image_clustered_ferrous_normal{j}(image_clustered_ferrous_normal{j}<0) = 0;
       image_alteration_index_normal{j}(ismember(image_data, clustering_cell{j},"rows")) = (clustering_cell{1,j}(:,11) - clustering_cell{1,j}(:,12)) ./ (clustering_cell{1,j}(:,11) + clustering_cell{1,j}(:,12));
       image_alteration_index_normal{j}(image_alteration_index_normal{j}<0) = 0; 
    end
end

tick_labels = cell(1,number_of_clusters +1);
tick_labels{1} = 'Sea';
for i=2:number_of_clusters +1
    tick_labels{i} = strcat('Cluster ', int2str(i-1));
end

[figure_index,~] = size(get(0,'Children'));
figure(figure_index+1)
imagesc(image_clustered);
colorbar('Ticks',0:number_of_clusters,...
    'TickLabels',tick_labels)
title(strcat(algorithm_title))
hold off