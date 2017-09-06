function [ vector] = mat2vec( data )
%Convert matrix (data) to vector

[rows,columns] = size(data);
vector = zeros(rows*columns,1);

for i = 1:rows
    
    vector((i-1)*columns+1:(i-1)*columns+columns) = data(i,:);
        
end


end

