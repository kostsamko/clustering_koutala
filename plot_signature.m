function[] = plot_signature(signature)
[~,pixels] = size(signature);
ii = (1:pixels)';
[figure_index,~] = size(get(0,'Children'));
figure(figure_index+1)
h = plot(signature, 'LineWidth',3);
set(h, {'color'}, num2cell(jet(length(ii)), 2));
set(gca,'FontSize',20, 'FontName', 'Courier', 'FontWeight','bold')
