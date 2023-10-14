function [array_std_mean_abandance,array_std_mean_clustering] = plot_mineral_identification_mixed(all_data,filtered_data,mixed_mineral_data,image_clustered,type,mean_array_clustered_mixed,std_array_clustered_mixed,clustering_data_index,number_of_mineral,show_histogram)
[figure_index,~] = size(get(0,'Children'));
figure(figure_index+1)
[p,n] = size(image_clustered);
mineral_data = zeros(p,n);
position_image = find(ismember(all_data,filtered_data,"rows"));
position_size = size(position_image);
[~,feature_size] = size(filtered_data);
for i=1:position_size
    mineral_data(position_image(i)) = mixed_mineral_data(i);
end
% mineral_data = (mineral_data - min(mineral_data,[],'all'))/(max(mineral_data,[],'all') - min(mineral_data,[],'all'));
% imagesc(mineral_data,'InitialMagnification','fit');
imagesc(mineral_data);
colorbar
title([type ' identification'])
for i=1:p
    for j=1:n
        if image_clustered(i,j) ~=0
            text(j,i, num2str(image_clustered(i,j)),'Color','red');
        end
    end
end
hold off
[number_of_clusters,~] = size(std_array_clustered_mixed);
%  number_of_mineral * 3 +1
array_std_mean_abandance = zeros(number_of_clusters +1, number_of_mineral + 2);
array_std_mean_clustering = zeros(number_of_clusters, feature_size +1);

for i=1:number_of_clusters
    [~,size_cluster] = size(find( clustering_data_index == i));
    if size_cluster == 1
        mean_signature_cluster = filtered_data(clustering_data_index ==i,:);
        std_signature_cluster = zeros(1,feature_size);
    else
        mean_signature_cluster = mean(filtered_data(clustering_data_index ==i,:));
        std_signature_cluster = std(filtered_data(clustering_data_index ==i,:));
    end
%     array_std_mean_abandance(i,1) = size_cluster;
%     array_std_mean_abandance(i,2:number_of_mineral+1) = mean_array_clustered_mixed(i,:);
%     array_std_mean_abandance(i,number_of_mineral+2:2*number_of_mineral+1) = std_array_clustered_mixed(i,:);
%     array_std_mean_abandance(i,2*number_of_mineral+2) = array_std_mean_abandance(i,6) / array_std_mean_abandance(i,2);
%     array_std_mean_abandance(i,2*number_of_mineral+3) = array_std_mean_abandance(i,7) / array_std_mean_abandance(i,3);
%     array_std_mean_abandance(i,2*number_of_mineral+4) = array_std_mean_abandance(i,8) / array_std_mean_abandance(i,4);
%     array_std_mean_abandance(i,2*number_of_mineral+5) = array_std_mean_abandance(i,9) / array_std_mean_abandance(i,5);
    array_std_mean_abandance(i,1) = size_cluster;
    array_std_mean_abandance(i,2:number_of_mineral+1) = std_array_clustered_mixed(i,:) ./ mean_array_clustered_mixed(i,:);
    array_std_mean_clustering(i,1) = size_cluster;
    array_std_mean_clustering(i,2:feature_size+1) = std_signature_cluster ./ mean_signature_cluster;
    
end
nan_mean_abandance = nanmean(array_std_mean_abandance);
array_std_mean_abandance(number_of_clusters+1,2:number_of_mineral+1) = nan_mean_abandance(1,2:number_of_mineral+1);
for i=1:number_of_clusters
    row_abandance = array_std_mean_abandance(i,:);
    cluster_valid_abandance =true;
    for j=2:number_of_mineral+1
        if isnan(row_abandance(j))
             cluster_valid_abandance = cluster_valid_abandance && true;
        elseif row_abandance(j) <= array_std_mean_abandance(number_of_clusters+1,j)
            cluster_valid_abandance = cluster_valid_abandance && true;
        else
            cluster_valid_abandance = cluster_valid_abandance && false;
        end
    end
    array_std_mean_abandance(i,number_of_mineral + 2) = cluster_valid_abandance;
end
if number_of_mineral == 5
    mineral_names = {'muscovite','chlorite','goethite','barite','pyrochroite'};
else
    mineral_names = {'muscovite','chlorite','goethite','pyrochroite'};
end

if show_histogram
    [~,minerals_size] = size(mean_array_clustered_mixed);
    for i=1:minerals_size
        [figure_index,~] = size(get(0,'Children'));
        figure(figure_index+1)
        histogram(mean_array_clustered_mixed(:,i),10);
        title(['histogram mean ' mineral_names{i}])
        figure(figure_index+2)
        histogram(std_array_clustered_mixed(:,i),10);
        title(['histogram std ' mineral_names{i}])
        figure(figure_index+3)
        scatter(mean_array_clustered_mixed(:,i),std_array_clustered_mixed(:,i));
        title(['scatter mean/std ' mineral_names{i}])
    end
end
