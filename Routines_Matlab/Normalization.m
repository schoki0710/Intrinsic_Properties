[row column] = size(Total_cell);

Total_cell_normalized = zeros(row, column);

Mean = zeros(row, 1);
Std = zeros(row, 1);

for i = 1: row
    
    Mean (i) = mean( Total_cell(i, :));
    Std  (i) = std( Total_cell(i, :));
    
end

for i = 1: row;
    
    for j = 1: column
        
        Total_cell_normalized(i, j) = (Total_cell(i, j) - Mean(i))./ Std(i);
    
    end
end

