function[] = basic_mineral(mineral_data,mineral_names)
[~,number_of_mineral] = size(mineral_data);
[bands_size,~] = size(mineral_data{1});
bands_size_array = 1:bands_size;
[figure_index,~] = size(get(0,'Children'));

min_y = 10000;
max_y = 0;
for i=1:number_of_mineral
     for j=1:bands_size
        value = mineral_data{1,i}(j);
        if value>max_y
            max_y = value;
        end
        if value< min_y
            min_y = value;
        end
     end
end

figure(figure_index+1), hold on
for i=1:number_of_mineral
    subplot(2,3,i)
    plot(bands_size_array,mineral_data{i});
    ylim([min_y max_y])
    for j=1:bands_size
        value = mineral_data{1,i}(j);
        txt = sprintf('%.3f',value);
        text(j,value,txt,'FontSize',7,'FontWeight','bold');
    end
    title(mineral_names{i});
end
sgtitle('Mineral signatures');
hold off

local_maximum_array = cell(1,number_of_mineral);
for i=1:number_of_mineral
   local_maximum_array{i} = zeros(1,bands_size);
  for j=2:bands_size-1
     current_value_minus_1 = mineral_data{1,i}(j-1);
     current_value = mineral_data{1,i}(j);
     current_value_plus_1 = mineral_data{1,i}(j+1);
     if current_value>current_value_minus_1 && current_value>=current_value_plus_1
         local_maximum_array{1,i}(j) = 1;
     end
  end
  if mineral_data{1,i}(1)> mineral_data{1,i}(2)
      local_maximum_array{1,i}(1) = 1;
  end
   if mineral_data{1,i}(bands_size)>mineral_data{1,i}(bands_size-1)
      local_maximum_array{1,i}(bands_size) = 1;
  end 
end


figure(figure_index+2), hold on
for i=1:number_of_mineral
    subplot(2,3,i)
    bar(local_maximum_array{1,i});
    title(mineral_names{i});
end
sgtitle('Mineral signatures-local max bar plot');
hold off
