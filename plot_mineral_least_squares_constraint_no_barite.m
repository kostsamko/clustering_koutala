function [array_std_mean_abandance_all_constr,array_std_mean_clustering_all_constr,array_std_mean_abandance_eq_constr,array_std_mean_clustering__eq_constr,array_std_mean_abandance_uneq_constr,array_std_mean_clustering__uneq_constr] ...
=plot_mineral_least_squares_constraint_no_barite(data,all_data,mineral_data,mineral_names,clustering_data,clustering_data_index,image_clustered)
[number_of_points,number_of_features] = size(data);
[~,number_of_mineral] = size(mineral_data);
[p,n]= size(image_clustered);
mineral_data_array = zeros(number_of_features,number_of_mineral);
for i=1:number_of_mineral
    mineral_data_array(:,i) = mineral_data{i};
end

x0 = [0.2,0.2,0.2,0.2];
A = [-1 -1 -1 -1];
A = diag(A);
b = [0;0;0;0];
Aeq = [1,1,1,1];
beq = 1;

result_array_all = zeros(number_of_mineral,number_of_points);
result_array_eq = zeros(number_of_mineral,number_of_points);
result_array_ueq = zeros(number_of_mineral,number_of_points);

for i=1:number_of_points
    fun = @(x)(norm(data(i,:)' - ((x(1) * mineral_data_array(:,1)) -(x(2) * mineral_data_array(:,2)) - (x(3) * mineral_data_array(:,3)) ... 
    - (x(4) * mineral_data_array(:,4))))) ^ 2;

    result_array_all(:,i) = fmincon(fun,x0,A,b,Aeq,beq);
    result_array_eq(:,i) = fmincon(fun,x0,[],[],Aeq,beq);
    result_array_ueq(:,i) = fmincon(fun,x0,A,b,[],[]);
end
% A(:,i) = best_lasso_value;

result_array_all = result_array_all';
result_array_eq = result_array_eq';
result_array_ueq = result_array_ueq';

for i=1:number_of_mineral
    pos = result_array_eq(:,i) <= 0;
    result_array_eq(pos,i) = 0;
end

[~,number_of_clusters] = size(clustering_data);
mean_array_clustered_mixed_all = zeros(number_of_clusters,number_of_mineral);
std_array_clustered_mixed_all = zeros(number_of_clusters,number_of_mineral);
mean_array_clustered_mixed_eq = zeros(number_of_clusters,number_of_mineral);
std_array_clustered_mixed_eq = zeros(number_of_clusters,number_of_mineral);
mean_array_clustered_mixed_uneq = zeros(number_of_clusters,number_of_mineral);
std_array_clustered_mixed_uneq = zeros(number_of_clusters,number_of_mineral);

for i=1:number_of_clusters
    indexes = clustering_data_index == i;
    mean_array_clustered_mixed_all(i,:) = mean(result_array_all(indexes,:));
    std_array_clustered_mixed_all(i,:) = std(result_array_all(indexes,:));
    mean_array_clustered_mixed_eq(i,:) = mean(result_array_eq(indexes,:));
    std_array_clustered_mixed_eq(i,:) = std(result_array_eq(indexes,:));
    mean_array_clustered_mixed_uneq(i,:) = mean(result_array_ueq(indexes,:));
    std_array_clustered_mixed_uneq(i,:) = std(result_array_ueq(indexes,:));
end

plot_mineral_identification_mixed(all_data,data,result_array_all(:,1),image_clustered,'muscovite all constraints',[],[],[],0,false);
plot_mineral_identification_mixed(all_data,data,result_array_all(:,2),image_clustered,'chlorite all constraints',[],[],[],0,false);
plot_mineral_identification_mixed(all_data,data,result_array_all(:,3),image_clustered,'goethite all constraints',[],[],[],0,false);
% plot_mineral_identification_mixed(all_data,data,result_array_all(:,4),image_clustered,'barite all constraints');
[array_std_mean_abandance_all_constr,array_std_mean_clustering_all_constr] = plot_mineral_identification_mixed(all_data,data,result_array_all(:,4),image_clustered,'pyrochroite all constraints',mean_array_clustered_mixed_all,std_array_clustered_mixed_all,clustering_data_index,number_of_mineral,true);

plot_mineral_identification_mixed(all_data,data,result_array_eq(:,1),image_clustered,'muscovite eq constraint',[],[],[],0,false);
plot_mineral_identification_mixed(all_data,data,result_array_eq(:,2),image_clustered,'chlorite eq constraint',[],[],[],0,false);
plot_mineral_identification_mixed(all_data,data,result_array_eq(:,3),image_clustered,'goethite eq constraint',[],[],[],0,false);
% plot_mineral_identification_mixed(all_data,data,result_array_eq(:,4),image_clustered,'barite eq constraint');
[array_std_mean_abandance_eq_constr,array_std_mean_clustering__eq_constr] = plot_mineral_identification_mixed(all_data,data,result_array_eq(:,4),image_clustered,'pyrochroite eq constraint',mean_array_clustered_mixed_eq,std_array_clustered_mixed_eq,clustering_data_index,number_of_mineral,true);

plot_mineral_identification_mixed(all_data,data,result_array_ueq(:,1),image_clustered,'muscovite uneq constraint',[],[],[],0,false);
plot_mineral_identification_mixed(all_data,data,result_array_ueq(:,2),image_clustered,'chlorite uneq constraint',[],[],[],0,false);
plot_mineral_identification_mixed(all_data,data,result_array_ueq(:,3),image_clustered,'goethite uneq constraint',[],[],[],0,false);
% plot_mineral_identification_mixed(all_data,data,result_array_ueq(:,4),image_clustered,'barite uneq constraint');
[array_std_mean_abandance_uneq_constr,array_std_mean_clustering__uneq_constr] = plot_mineral_identification_mixed(all_data,data,result_array_ueq(:,4),image_clustered,'pyrochroite uneq constraint',mean_array_clustered_mixed_uneq,std_array_clustered_mixed_uneq,clustering_data_index,number_of_mineral,true);

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

