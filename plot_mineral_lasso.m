function [array_std_mean_abandance,array_std_mean_clustering] = plot_mineral_least_lasso(data,all_data,mineral_data,mineral_names,clustering_data,clustering_data_index,image_clustered)
[number_of_points,number_of_features] = size(data);
[~,number_of_mineral] = size(mineral_data);
[p,n]= size(image_clustered);
mineral_data_array = zeros(number_of_features,number_of_mineral);
for i=1:number_of_mineral
    mineral_data_array(:,i) = mineral_data{i};
end

A = zeros(number_of_mineral,number_of_points);

for i=1:number_of_points
    lasso_result = lasso(mineral_data_array, data(i,:)');
    [~,number_of_results] = size(lasso_result);
    max = 0;
    best_lasso_value = [0;0;0;0;0;];
    for j=1:number_of_results
        %
        if sum(lasso_result(:,j) >= 0) == number_of_mineral && norm(lasso_result(:,j))> max
            max = max + norm(lasso_result(:,j));
            best_lasso_value = lasso_result(:,j);
        end
    end
    A(:,i) = best_lasso_value;
end

A = A';

[~,number_of_clusters] = size(clustering_data);
mean_array_clustered_mixed = zeros(number_of_clusters,number_of_mineral);
std_array_clustered_mixed = zeros(number_of_clusters,number_of_mineral);

for i=1:number_of_clusters
    indexes = clustering_data_index == i;
    if sum(indexes) == 1
        mean_array_clustered_mixed(i,:) = A(indexes,:);
        std_array_clustered_mixed(i,:) = zeros(1,number_of_mineral);
    else
        mean_array_clustered_mixed(i,:) = mean(A(indexes,:));
        std_array_clustered_mixed(i,:) = std(A(indexes,:));
    end
end

plot_mineral_identification_mixed(all_data,data,A(:,1),image_clustered,'muscovite lasso',[],[],[],0,false);
plot_mineral_identification_mixed(all_data,data,A(:,2),image_clustered,'chlorite lasso',[],[],[],0,false);
plot_mineral_identification_mixed(all_data,data,A(:,3),image_clustered,'goethite lasso',[],[],[],0,false);
plot_mineral_identification_mixed(all_data,data,A(:,4),image_clustered,'barite lasso',[],[],[],0,false);
[array_std_mean_abandance,array_std_mean_clustering] = plot_mineral_identification_mixed(all_data,data,A(:,5),image_clustered,'pyrochroite lasso',mean_array_clustered_mixed,std_array_clustered_mixed,clustering_data_index,number_of_mineral,true);

% number_of_clusters = max(clustering_data_index);
% X = categorical(mineral_names);
% X = reordercats(X,mineral_names);
% 
% figure_index = 50;
% for i=1:number_of_clusters
%     figure_index = figure_index +1; 
%     figure(figure_index);
%     hold on
%     points_in_cluster = clustering_data_index == i;
%     logic_mineral_cluster_array = logical_mineral_data(points_in_cluster,:);
%     [logic_mineral_cluster_size,~] = size(logic_mineral_cluster_array);
%     if logic_mineral_cluster_size>1
%         sum_of_minerals_cluster = sum(logic_mineral_cluster_array);
%     else
%         sum_of_minerals_cluster = logic_mineral_cluster_array;
%     end
%     points_in_cluster_indexes = find(clustering_data_index == i);
%     bar(X,sum_of_minerals_cluster);
%     title(['Minerals in cluster: ' num2str(i)])
%     hold off
%     if sum_of_minerals_cluster(1) > 0
%         points_in_cluster_indexes_with_mineral = points_in_cluster_indexes(logical_mineral_data(points_in_cluster_indexes,1) > 0);
%         figure_index = figure_index +1; 
%         figure(figure_index);
%         hold on
%         plot(clustering_data{i}','b');
%         plot(clustering_data{i}(ismember(clustering_data{i},data(points_in_cluster_indexes_with_mineral,:), 'rows'),:)','g');
%         plot(mineral_data{1},'r');
%         hold off
%     end
%     if sum_of_minerals_cluster(2) > 0
%         points_in_cluster_indexes_with_mineral = points_in_cluster_indexes(logical_mineral_data(points_in_cluster_indexes,2) > 0);
%         figure_index = figure_index +1; 
%         figure(figure_index);
%         hold on
%         plot(clustering_data{i}','b');
%         plot(clustering_data{i}(ismember(clustering_data{i},data(points_in_cluster_indexes_with_mineral,:), 'rows'),:)','g');
%         plot(mineral_data{2},'r');
%         hold off
%     end
%     if sum_of_minerals_cluster(3) > 0
%         points_in_cluster_indexes_with_mineral = points_in_cluster_indexes(logical_mineral_data(points_in_cluster_indexes,3) > 0);
%         figure_index = figure_index +1; 
%         figure(figure_index);
%         hold on
%         plot(clustering_data{i}','b');
%         plot(clustering_data{i}(ismember(clustering_data{i},data(points_in_cluster_indexes_with_mineral,:), 'rows'),:)','g');
%         plot(mineral_data{3},'r');
%         hold off
%     end
%     if sum_of_minerals_cluster(4) > 0
%         points_in_cluster_indexes_with_mineral = points_in_cluster_indexes(logical_mineral_data(points_in_cluster_indexes,4) > 0);
%         figure_index = figure_index +1; 
%         figure(figure_index);
%         hold on
%         plot(clustering_data{i}','b');
%         plot(clustering_data{i}(ismember(clustering_data{i},data(points_in_cluster_indexes_with_mineral,:), 'rows'),:)','g');
%         plot(mineral_data{4},'r');
%         hold off
%     end
%     if sum_of_minerals_cluster(5) > 0
%         points_in_cluster_indexes_with_mineral = points_in_cluster_indexes(logical_mineral_data(points_in_cluster_indexes,5) > 0);
%         figure_index = figure_index +1;
%         figure(figure_index);
%         hold on
%         plot(clustering_data{i}','b');
%         plot(clustering_data{i}(ismember(clustering_data{i},data(points_in_cluster_indexes_with_mineral,:), 'rows'),:)','g');
%         plot(mineral_data{5},'r');
%         hold off
%     end      
%     end
% end

