function [ matrix ] = monthly_stats( data )
% matrix that describes the sample mean and 
% standard deviation for each month in years 2008-present.

%NOTE: When I was doing this, in [number date combined] in my lecture_3
%script, I couldn't manipulate the numerical section of the "combined" set.
%Matlab didn't recognize them as numerical values until I went with
%"numbers" instead of "combined"


jan = data(1:12:end,:);
feb = data(2:12:end,:);
mar = data(3:12:end,:);
apr = data(4:12:end,:);
may = data(5:12:end,:);
jun = data(6:12:end,:);
jul = data(7:12:end,:);
aug = data(8:12:end,:);
sep = data(9:12:end,:);
oct = data(10:12:end,:);
nov = data(11:12:end,:);
dec = data(12:12:end,:);

matrix1 = [jan feb mar apr may jun jul];
matrix2 = [aug sep oct nov dec];

mean1 = mean(matrix1)';
mean2 = mean(matrix2)';
std1 = std(matrix1)';
std2 = std(matrix2)';

matrix = [mean1 , std1
          mean2 , std2];
end

