function [] = plot_mineral_custom(data,mineral_data,mineral_names,clustering_data,clustering_data_index)
[number_of_points,~] = size(data);
[~,number_of_mineral] = size(mineral_data);

for i=2:number_of_mineral-3
    combs = combntns(1:number_of_mineral,i);
    [number_of_combs,~] = size(combs);
    for j=1:number_of_combs
        combs_indexes = combs(j,:);
        [~,combs_indexes_size] = size(combs_indexes);
        sum = 0;
        count = 0;
        for k=1:combs_indexes_size
            sum = sum + mineral_data{combs_indexes(k)};
            count = count +1;
        end
        new_mineral = sum/count;
    end
end

data_der = find_derivative(data);
data_mineral_frechet = zeros(number_of_points,number_of_mineral);
for i=1:number_of_mineral
    dir_mineral = find_derivative(mineral_data{i}');
    for j=1:number_of_points
        data_mineral_frechet(j,i) = DiscreteFrechetDist(dir_mineral', data_der(j,:)');
    end
end

R = [0.7 0.7 0.7 0.05 0.05];
logical_mineral_data = zeros(number_of_points,number_of_mineral);
sort_data_mineral_frechet = sort(data_mineral_frechet,'ascend');
for i=1:number_of_mineral
    index_of_max_value = round(R(i) * number_of_points);
    max_value = sort_data_mineral_frechet(index_of_max_value,i);
    for j=1:number_of_points
        if data_mineral_frechet(j,i) < max_value
            logical_mineral_data(j,i) = 1;
        end
    end
end

number_of_clusters = max(clustering_data_index);
X = categorical(mineral_names);
X = reordercats(X,mineral_names);

for i=1:number_of_clusters
    figure(50+i);
    hold on
    points_in_cluster = clustering_data_index == i;
    sum_of_minerals_cluster = sum(logical_mineral_data(points_in_cluster,:));
    points_in_cluster_indexes = find(clustering_data_index == i);
    bar(X,sum_of_minerals_cluster);
    title(['Minerals in cluster: ' num2str(i)])
    hold off
    if sum_of_minerals_cluster(1) > 0
        points_in_cluster_indexes_with_mineral = points_in_cluster_indexes(logical_mineral_data(points_in_cluster_indexes,1) > 0);
        [figure_index,~] = size(get(0,'Children'));
        figure(figure_index+1);
        hold on
        plot(clustering_data{i}','b');
        plot(clustering_data{i}(ismember(clustering_data{i},data(points_in_cluster_indexes_with_mineral,:), 'rows'),:)','g');
        plot(mineral_data{1},'r');
        hold off
    end
    if sum_of_minerals_cluster(2) > 0
        points_in_cluster_indexes_with_mineral = points_in_cluster_indexes(logical_mineral_data(points_in_cluster_indexes,2) > 0);
        [figure_index,~] = size(get(0,'Children'));
        figure(figure_index+1);
        hold on
        plot(clustering_data{i}','b');
        plot(clustering_data{i}(ismember(clustering_data{i},data(points_in_cluster_indexes_with_mineral,:), 'rows'),:)','g');
        plot(mineral_data{2},'r');
        hold off
    end
    if sum_of_minerals_cluster(3) > 0
        points_in_cluster_indexes_with_mineral = points_in_cluster_indexes(logical_mineral_data(points_in_cluster_indexes,3) > 0);
        [figure_index,~] = size(get(0,'Children'));
        figure(figure_index+1);
        hold on
        plot(clustering_data{i}','b');
        plot(clustering_data{i}(ismember(clustering_data{i},data(points_in_cluster_indexes_with_mineral,:), 'rows'),:)','g');
        plot(mineral_data{3},'r');
        hold off
    end
    if sum_of_minerals_cluster(4) > 0
        points_in_cluster_indexes_with_mineral = points_in_cluster_indexes(logical_mineral_data(points_in_cluster_indexes,4) > 0);
        [figure_index,~] = size(get(0,'Children'));
        figure(figure_index+1);
        hold on
        plot(clustering_data{i}','b');
        plot(clustering_data{i}(ismember(clustering_data{i},data(points_in_cluster_indexes_with_mineral,:), 'rows'),:)','g');
        plot(mineral_data{4},'r');
        hold off
    end
    if sum_of_minerals_cluster(5) > 0
        points_in_cluster_indexes_with_mineral = points_in_cluster_indexes(logical_mineral_data(points_in_cluster_indexes,5) > 0);
        [figure_index,~] = size(get(0,'Children'));
        figure(figure_index+1);
        hold on
        plot(clustering_data{i}','b');
        plot(clustering_data{i}(ismember(clustering_data{i},data(points_in_cluster_indexes_with_mineral,:), 'rows'),:)','g');
        plot(mineral_data{5},'r');
        hold off
    end      
    end
end

