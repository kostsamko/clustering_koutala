function [mean_std_ferric_array,mean_std_ferrous_array,mean_std_alteration_array]...
    =spectal_indices_plots(ferric_cell,ferrous_cell,alteration_cell,ferric_cell_normal,ferrous_cell_normal,alteration_cell_normal,image_clustered_mask,images_rgb,is_world_view, algorithm_title)



[~,number_of_clusters] = size(ferric_cell);
[figure_index,~] = size(get(0,'Children'));

mean_std_ferric_array = zeros(1, 2 * number_of_clusters);
mean_std_ferrous_array = zeros(1, 2 * number_of_clusters);
mean_std_alteration_array = zeros(1, 2 * number_of_clusters);

mean_std_ferric_array_normal = zeros(1, 2 * number_of_clusters);
mean_std_ferrous_array_normal = zeros(1, 2 * number_of_clusters);
mean_std_alteration_array_normal = zeros(1, 2 * number_of_clusters);


if is_world_view
    % ferric
    
    mean_std_ferric_names = cell(1,2 * number_of_clusters);
    mean_std_ferric_names_normal = cell(1,2 * number_of_clusters);
    figure(figure_index+1);
    montage(ferric_cell,"Size",[2 3],'DisplayRange',[]);   
    title(strcat('Ferric ', algorithm_title));
    hold off
    
    figure(figure_index+2);
    montage(ferric_cell_normal,"Size",[2 3],'DisplayRange',[]);   
    title(strcat('Ferric-normal ', algorithm_title));
    hold off

    j= 1;
    for i=1:number_of_clusters
        mean_std_ferric_array(j) =  mean(nonzeros(ferric_cell{i}) , 'all' );
        mean_std_ferric_array(j+1) = std(nonzeros(ferric_cell{i}) ,0, 'all' );
        mean_std_ferric_names{j} = strcat('Ferric mean cluster ', int2str(i));
        mean_std_ferric_names{j+1} = strcat('Ferric std cluster ', int2str(i));
        
        mean_std_ferric_array_normal(j) =  mean(nonzeros(ferric_cell_normal{i}) , 'all' );
        mean_std_ferric_array_normal(j+1) = std(nonzeros(ferric_cell_normal{i}) ,0, 'all' );
        mean_std_ferric_names_normal{j} = strcat('Ferric-normal mean cluster ', int2str(i));
        mean_std_ferric_names_normal{j+1} = strcat('Ferric-normal std cluster ', int2str(i));
        
        j =j +2;
    end

    figure(figure_index+3)
    barh(mean_std_ferric_array)
    yticklabels(mean_std_ferric_names)
    title(strcat('Ferric ', algorithm_title,' ', ' mean-std bar plot'));
    hold off
    
    figure(figure_index+4)
    barh(mean_std_ferric_array_normal)
    yticklabels(mean_std_ferric_names_normal)
    title(strcat('Ferric-normal ', algorithm_title,' ', ' mean-std bar plot'));
    hold off
    
else
    % ferric
    mean_std_ferric_names = cell(1,2 * number_of_clusters);
    mean_std_ferric_names_normal = cell(1,2 * number_of_clusters);

    figure(figure_index+1);
    montage(ferric_cell,"Size",[2 3],'DisplayRange',[]);
    title(strcat('Ferric ', algorithm_title));
    hold off
    
    figure(figure_index+2);
    montage(ferric_cell_normal,"Size",[2 3],'DisplayRange',[]);   
    title(strcat('Ferric-normal ', algorithm_title));
    hold off

    j= 1;
    for i=1:number_of_clusters
        mean_std_ferric_array(j) =  mean(nonzeros(ferric_cell{i}) , 'all' );
        mean_std_ferric_array(j+1) = std(nonzeros(ferric_cell{i}) ,0, 'all' );
        mean_std_ferric_names{j} = strcat('Ferric mean cluster ', int2str(i));
        mean_std_ferric_names{j+1} = strcat('Ferric std cluster ', int2str(i));
        
        mean_std_ferric_array_normal(j) =  mean(nonzeros(ferric_cell_normal{i}) , 'all' );
        mean_std_ferric_array_normal(j+1) = std(nonzeros(ferric_cell_normal{i}) ,0, 'all' );
        mean_std_ferric_names_normal{j} = strcat('Ferric-normal mean cluster ', int2str(i));
        mean_std_ferric_names_normal{j+1} = strcat('Ferric-normal std cluster ', int2str(i));
        
        j =j +2;
    end

    figure(figure_index+3)
    barh(mean_std_ferric_array)
    yticklabels(mean_std_ferric_names)
    title(strcat('Ferric ', algorithm_title,' ', ' mean-std bar plot'));
    hold off
    
    figure(figure_index+4)
    barh(mean_std_ferric_array_normal)
    yticklabels(mean_std_ferric_names_normal)
    title(strcat('Ferric-normal ', algorithm_title,' ', ' mean-std bar plot'));
    hold off
    
    % ferrous
    mean_std_ferrous_names = cell(1,2 * number_of_clusters);
    mean_std_ferrous_names_normal = cell(1,2 * number_of_clusters);

    figure(figure_index+5);
    montage(ferrous_cell,"Size",[2 3],'DisplayRange',[]);
    title(strcat('Ferrous ', algorithm_title));
    hold off
    
    figure(figure_index+6);
    montage(ferrous_cell_normal,"Size",[2 3],'DisplayRange',[]);
    title(strcat('Ferrous-normal ', algorithm_title));
    hold off
    
    
    j= 1;
    for i=1:number_of_clusters
        mean_std_ferrous_array(j) =  mean(nonzeros(ferrous_cell{i}) , 'all' );
        mean_std_ferrous_array(j+1) = std(nonzeros(ferrous_cell{i}) ,0, 'all' );
        mean_std_ferrous_names{j} = strcat('Ferrous mean cluster ', int2str(i));
        mean_std_ferrous_names{j+1} = strcat('Ferrous std cluster ', int2str(i));
        
        mean_std_ferrous_array_normal(j) =  mean(nonzeros(ferrous_cell_normal{i}) , 'all' );
        mean_std_ferrous_array_normal(j+1) = std(nonzeros(ferrous_cell_normal{i}) ,0, 'all' );
        mean_std_ferrous_names_normal{j} = strcat('Ferrous-normal mean cluster ', int2str(i));
        mean_std_ferrous_names_normal{j+1} = strcat('Ferrous-normal std cluster ', int2str(i));
        
        j =j +2;
    end

    figure(figure_index+7)
    barh(mean_std_ferrous_array)
    yticklabels(mean_std_ferrous_names)
    title(strcat('Ferrous ', algorithm_title,' ', ' mean-std bar plot'));
    hold off
    
    figure(figure_index+8)
    barh(mean_std_ferrous_array_normal)
    yticklabels(mean_std_ferrous_names_normal)
    title(strcat('Ferrous-normal ', algorithm_title,' ', ' mean-std bar plot'));
    hold off


    % alteration index
    mean_std_alteration_names = cell(1,2 * number_of_clusters);
    mean_std_alteration_names_normal = cell(1,2 * number_of_clusters);

    figure(figure_index+9);
    montage(alteration_cell,"Size",[2 3],'DisplayRange',[]);
    title(strcat('Alteration index', algorithm_title, ' '));
    hold off
    
    figure(figure_index+10);
    montage(alteration_cell_normal,"Size",[2 3],'DisplayRange',[]);
    title(strcat('Alteration index-normal ', algorithm_title));
    hold off

    j= 1;
    for i=1:number_of_clusters
        mean_std_alteration_array(j) =  mean(nonzeros(alteration_cell{i}) , 'all' );
        mean_std_alteration_array(j+1) = std(nonzeros(alteration_cell{i}) ,0, 'all' );
        mean_std_alteration_names{j} = strcat('Alteration index mean cluster ', int2str(i));
        mean_std_alteration_names{j+1} = strcat('Alteration index std cluster ', int2str(i));
        
        mean_std_alteration_array_normal(j) =  mean(nonzeros(alteration_cell_normal{i}) , 'all' );
        mean_std_alteration_array_normal(j+1) = std(nonzeros(alteration_cell_normal{i}) ,0, 'all' );
        mean_std_alteration_names_normal{j} = strcat('Alteration-normal index mean cluster ', int2str(i));
        mean_std_alteration_names_normal{j+1} = strcat('Alteration-normal index std cluster ', int2str(i));
        
        j =j +2;
    end

    figure(figure_index+11)
    barh(mean_std_alteration_array)
    yticklabels(mean_std_alteration_names)
    title(strcat('Alteration index ', algorithm_title,' ', ' mean-std bar plot'));
    hold off
    
    
    figure(figure_index+12)
    barh(mean_std_alteration_array_normal)
    yticklabels(mean_std_alteration_names_normal)
    title(strcat('Alteration-normal index ', algorithm_title,' ', ' mean-std bar plot'));
    hold off
    
    %rgb plots
    for i=1:number_of_clusters
        [p,n,f] =size(images_rgb);
        rgb_spectral_clustered_image = zeros(p,n,f);
        rgb_spectral_clustered_image(:,:,1) = images_rgb(:,:,1) .* image_clustered_mask{i};
        rgb_spectral_clustered_image(:,:,2) = images_rgb(:,:,2) .* image_clustered_mask{i};
        rgb_spectral_clustered_image(:,:,3) = images_rgb(:,:,3) .* image_clustered_mask{i};
        figure(figure_index+12+i)
        M = repmat(all(~rgb_spectral_clustered_image,3),[1 1 3]);
        rgb_spectral_clustered_image(M) = 255;
        imshow(rgb_spectral_clustered_image,'InitialMagnification','fit');
        title(strcat('RGB spectral indices image koutala sentintel 2 ', algorithm_title, ' ', 'cluster ', int2str(i)));
        hold off;
    end
        
    % scatter plots
    [figure_index,~] = size(get(0,'Children'));

    color_names = {'red','green','blue', 'cyan', 'magenta', 'yellow'};

    % ferric vs alteration
    for i=1:number_of_clusters
       figure(figure_index+1),hold on
       legend_name = strcat('cluster: ', int2str(i));
       scatter(nonzeros(ferric_cell{i}), nonzeros(alteration_cell{i}),[],color_names{i},'DisplayName', legend_name) 
       title(strcat('Scatter plot ferric/alteration ', algorithm_title));
    end
    hold off
    legend show
     
    % ferric vs alteration normalized
    for i=1:number_of_clusters
       figure(figure_index+2),hold on
       legend_name = strcat('cluster: ', int2str(i));
       scatter(reshape(ferric_cell_normal{i},[],1), reshape(alteration_cell_normal{i},[],1),[],color_names{i},'DisplayName', legend_name)
       title(strcat('Scatter plot ferric-normal/alteration-normal ', algorithm_title));
    end
    hold off
    legend show   
    

    % ferrous vs alteration
    for i=1:number_of_clusters
       figure(figure_index+3),hold on
       legend_name = strcat('cluster: ', int2str(i));
       scatter(nonzeros(ferrous_cell{i}), nonzeros(alteration_cell{i}),[],color_names{i}, 'DisplayName', legend_name)
       title(strcat('Scatter plot ferrous/alteration ', algorithm_title));
    end
    hold off
    legend show
    
    % ferrous vs alteration normal
    for i=1:number_of_clusters
       figure(figure_index+4),hold on
       legend_name = strcat('cluster: ', int2str(i));
       scatter(reshape(ferrous_cell_normal{i},[],1), reshape(alteration_cell_normal{i},[],1),[],color_names{i},'DisplayName', legend_name)
       title(strcat('Scatter plot ferrous-normal/alteration-normal ', algorithm_title));
    end
    hold off
    legend show    
    

    % ferric vs ferrous
    for i=1:number_of_clusters
       figure(figure_index+5),hold on
       legend_name = strcat('cluster: ', int2str(i));
       scatter(nonzeros(ferric_cell{i}), nonzeros(ferrous_cell{i}),[],color_names{i},'DisplayName', legend_name)
       title(strcat('Scatter plot ferric/ferrous ', algorithm_title));
    end
    hold off
    legend show
    
    % ferric vs ferrous normal
    for i=1:number_of_clusters
       figure(figure_index+6),hold on
       legend_name = strcat('cluster: ', int2str(i));
       scatter(reshape(ferric_cell_normal{i},[],1), reshape(ferrous_cell_normal{i},[],1),[],color_names{i},'DisplayName', legend_name) 
       title(strcat('Scatter plot ferric-normal/ferrous-normal ', algorithm_title));
    end
    hold off
    legend show    
end
    
