function [ matrix ] = vec2mat( vector, rows, columns )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

matrix = zeros(rows, columns);
counter = 0;
for i = 1:columns
    for j = 1:rows
        counter = counter+1;
        matrix(j,i) = vector(counter);
    end
end

        
end

