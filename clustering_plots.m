function[silhouette_total_mean] = clustering_plots(data,clustering_result,clustering_labels,features_names, plot_title,is_continium_removal)

[figure_index,~] = size(get(0,'Children'));
[~,number_of_clusters] = size(clustering_result);
std_cell = cell(1, number_of_clusters);
std_zero_cell = cell(1, number_of_clusters);
mean_cell = cell(1, number_of_clusters);
for i=1:number_of_clusters
    std_cell{i} = std(clustering_result{i});
    mean_cell{i} = mean(clustering_result{i});
end


X = categorical(features_names);
X = reordercats(X,features_names);

figure(figure_index+1), hold on
for i=1:number_of_clusters
     subplot(3,4,i)
     h = bar(X, diag(std_cell{i}),'stacked');
     title(strcat('cluster: ',int2str(i)));
     sgtitle(strcat(plot_title,' std bar plot'));
end
min_values = min(data);
max_values = max(data);
std_values = std(data);
mean_values = mean(data);
[~,feature_size] = size(features_names);
mean_index_array = 1:feature_size;
legend_cell = cell(1,feature_size);
for j=1:feature_size
     legend_cell{j} = strcat('min: ',sprintf('%.2f',min_values(j)),' max: ', sprintf('%.2f',max_values(j)), ' std: ', sprintf('%.2f',std_values(j)),' mean: ', sprintf('%.2f',mean_values(j)));
end
%create one more sublot to include the legend..
%matlab does not support overall legend for suplots.. 
%https://www.mathworks.com/matlabcentral/answers/98474-is-there-a-command-in-matlab-for-creating-one-overall-legend-when-i-have-a-figure-with-subplots
subplot(3,4,i+1)
for i=1:number_of_clusters
    std_zero_cell{i} = zeros(1,feature_size);
end
h = bar(X, diag(std_zero_cell{i}),'stacked');
axis off
set(h, {'DisplayName'}, legend_cell')
lg = legend();
lg.Location = 'northwest';
hold off

%signature of clusters
figure(figure_index+2),hold on

%find mix max across the clusters
min_y = 10000;
max_y = 0;
for i=1:number_of_clusters
     for j=1:feature_size
        value = mean_cell{1,i}(j);
        if value>max_y
            max_y = value;
        end
        if value< min_y
            min_y = value;
        end
     end
end

for i=1:number_of_clusters
    subplot(3,3,i)
    plot(mean_index_array,mean_cell{i});
    ylim([min_y max_y])
    for j=1:feature_size
        value = mean_cell{1,i}(j);
        txt = sprintf('%.3f',value);
        text(j,value,txt,'FontSize',7,'FontWeight','bold');
    end
    title(strcat('cluster: ',int2str(i)));
end
sgtitle(strcat(plot_title,' signature of clusters'));

if is_continium_removal
    local_maximum_array_cluster = cell(1,number_of_clusters);
    for i=1:number_of_clusters
        [number_of_points,~] = size(clustering_result{i});
        local_maximum_array_cluster{i} = zeros(1,feature_size);
        for j=1:number_of_points
            for k=2:feature_size-1
                current_value_minus_1 = clustering_result{1,i}(j,k-1);
                current_value = clustering_result{1,i}(j,k);
                current_value_plus_1 = clustering_result{1,i}(j,k+1);
                if current_value>current_value_minus_1 && current_value>=current_value_plus_1
                    local_maximum_array_cluster{1,i}(1,k) = local_maximum_array_cluster{1,i}(1,k) + 1;
                end
                if local_maximum_array_cluster{1,i}(1)> local_maximum_array_cluster{1,i}(2)
                    local_maximum_array_cluster{1,i}(1,1) = local_maximum_array_cluster{1,i}(1,1) + 1;
                end
                if local_maximum_array_cluster{1,i}(feature_size)>local_maximum_array_cluster{1,i}(feature_size-1)
                    local_maximum_array_cluster{1,i}(1,feature_size) =  local_maximum_array_cluster{1,i}(1,feature_size) +1;
                end
            end
        end
    end
    
    figure(figure_index+3), hold on
    for i=1:number_of_clusters
        subplot(3,3,i)
        bar(local_maximum_array_cluster{1,i});
        title(strcat('cluster: ',int2str(i)));
    end
    sgtitle(strcat(plot_title,' cluster signatures bar plot'));
    hold off
else
    local_manimum_array_cluster = cell(1,number_of_clusters);
    for i=1:number_of_clusters
        [number_of_points,~] = size(clustering_result{i});
        local_manimum_array_cluster{i} = zeros(1,feature_size);
        for j=1:number_of_points
            for k=2:feature_size-1
                current_value_minus_1 = clustering_result{1,i}(j,k-1);
                current_value = clustering_result{1,i}(j,k);
                current_value_plus_1 = clustering_result{1,i}(j,k+1);
                if current_value<=current_value_minus_1 && current_value<=current_value_plus_1 && current_value_plus_1~=current_value_minus_1
                    local_manimum_array_cluster{1,i}(1,k) = local_manimum_array_cluster{1,i}(1,k) + 1;
                end
                if local_manimum_array_cluster{1,i}(1)< local_manimum_array_cluster{1,i}(2)
                    local_manimum_array_cluster{1,i}(1,1) = local_manimum_array_cluster{1,i}(1,1) + 1;
                end
                if local_manimum_array_cluster{1,i}(feature_size)<local_manimum_array_cluster{1,i}(feature_size-1)
                    local_manimum_array_cluster{1,i}(1,feature_size) =  local_manimum_array_cluster{1,i}(1,feature_size) +1;
                end
            end
        end
    end
    
    figure(figure_index+3), hold on
    for i=1:number_of_clusters
        subplot(3,3,i)
        bar(local_manimum_array_cluster{1,i});
        title(strcat('cluster: ',int2str(i)));
    end
    sgtitle(strcat(plot_title,' cluster signatures bar plot'));
    hold off
end



figure(figure_index+4),hold on
[silhouette_values,~] = silhouette(data,clustering_labels);
strcat(plot_title,' silhouette plot');
hold off
silhouette_cell = cell(1, number_of_clusters);
silhouette_mean = zeros(1,number_of_clusters);
for i=1:number_of_clusters
    silhouette_cell{i} = silhouette_values(clustering_labels == i);
    silhouette_mean(i) = mean(silhouette_cell{i});
end
silhouette_total_mean = mean(silhouette_mean);
figure(figure_index+5),hold on
barh(silhouette_mean)
xlabel('Silhouette mean value')
ylabel('Cluster')
strcat(plot_title,' silhouette mean plot');
hold off
