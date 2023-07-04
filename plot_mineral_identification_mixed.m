function [] = plot_mineral_identification_mixed(all_data,filtered_data,mixed_mineral_data,image_clustered,type,mean_array_clustered_mixed,std_array_clustered_mixed,show_histogram)
[figure_index,~] = size(get(0,'Children'));
figure(figure_index+1)
[p,n] = size(image_clustered);
mineral_data = zeros(p,n);
position_image = find(ismember(all_data,filtered_data,"rows"));
position_size = size(position_image);
for i=1:position_size
    mineral_data(position_image(i)) = mixed_mineral_data(i);
end
% mineral_data = (mineral_data - min(mineral_data,[],'all'))/(max(mineral_data,[],'all') - min(mineral_data,[],'all'));
% imagesc(mineral_data,'InitialMagnification','fit');
imagesc(mineral_data);
title([type ' identification'])
for i=1:p
    for j=1:n
        if image_clustered(i,j) ~=0
            text(j,i, num2str(image_clustered(i,j)),'Color','red');
        end
    end
end
hold off

if show_histogram
    [~,minerals_size] = size(mean_array_clustered_mixed);
    for i=1:minerals_size
        figure(figure_index+2)
        histogram(mean_array_clustered_mixed(:,i),10);
        title('histogram mean')
        figure(figure_index+3)
        histogram(std_array_clustered_mixed(:,i),10);
        title('histogram std')
        figure(figure_index+4)
        scatter(mean_array_clustered_mixed(:,i),std_array_clustered_mixed(:,i));
        title('scatter mean/std')
    end
end
