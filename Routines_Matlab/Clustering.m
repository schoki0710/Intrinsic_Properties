% all about label

Label = cell( length(Total_cell_name), 1);

for k = 1: length( Total_cell_name)
    
    Label{k} = num2str(Total_cell_name(k)');
    
end


%%%%

distance_euc = pdist (Total_cell_normalized', 'euclidean');
link = linkage(distance_euc, 'ward');

D = dendrogram(link, 0, 'Orientation', 'left', 'Labels', Label, 'ColorThreshold', 'default');

%%%%

set(D, 'LineWidth', 3)
xlabel('Euclidean distance','FontSize',20);
ylabel('cells','FontSize',20);
title('Physiological Cluster Analysis','FontSize',20);

