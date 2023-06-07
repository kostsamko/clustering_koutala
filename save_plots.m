function []=save_plots(path)

FolderName = (path);  
FigList = findobj(allchild(0), 'flat', 'Type', 'figure');
for iFig = 1:length(FigList)
  FigHandle = FigList(iFig);
  FigName= num2str(get(FigHandle, 'Number'));
  FigHandle.WindowState = 'maximized';
  set(0, 'CurrentFigure', FigHandle);
%   saveas(FigHandle, strcat(FigName, '.jpg'));
  saveas(FigHandle, fullfile(FolderName,strcat(FigName, '.png')));
  saveas(FigHandle, fullfile(FolderName,strcat(FigName, '.fig')));% specify the full path
end