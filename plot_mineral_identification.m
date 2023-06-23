function [] = plot_mineral_identification(all_data,filtered_data,logical_mineral_data,image_clustered,type)
[figure_index,~] = size(get(0,'Children'));
figure(figure_index+1)
[p,n] = size(image_clustered);
mineral_data = zeros(p,n);
mineral_data(ismember(all_data,filtered_data(logical_mineral_data,:),"rows")) = 1;
imagesc(mineral_data);
title([type ' identification'])
for i=1:p
    for j=1:n
        if image_clustered(i,j) ~=0
            text(j,i, num2str(image_clustered(i,j)));
        end
    end
end
hold off