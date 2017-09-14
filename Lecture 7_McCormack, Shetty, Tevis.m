%%%Lecture 7: McCormack , Shetty , Tevis %%%

[num2012 char2012 combined] = xlsread('coal860_data.xlsx', '2012_coal');
[num2015 char2012 combined] = xlsread('coal860_data.xlsx' , '2015_coal');

%Goal: Find the plants in 2012 that are not in 2015 and overlay it on 2015
%data ; create bins variable where each bin is one year 
years = 1925:1:2015;

bins = zeros(length(years),1);

for i = 1:length(num2015)
    
    yr = num2015(i,4);
    
    bin_number = find(years==yr);
    
    bins(bin_number) = bins(bin_number) + num2015(i,3);
end

C = setdiff(num2012, num2015, 'rows');  %returns retired plants since 2012

retiredbins = zeros(length(years));

for i = 1:length(C)
    
    yr = C(i,4);
    
    bin_number2 = find(years==yr);
    
    retiredbins(bin_number2) = retiredbins(bin_number2) + C(i,3);
end

figure
bar(bins,'FaceColor', [.8 .8 .8] , 'EdgeColor' , [.7 .7 .7,] , 'LineWidth' , 0.1); %Produces all of 2012 data
hold on
bar(retiredbins,'FaceColor', [.1 .1 .1] , 'EdgeColor' , [.1 .1 .1,] , 'LineWidth' , 0.1);
ax=gca;
ax.XTick=([1 11 21 31 41 51 61 71 81 91]);
ax.XTickLabel=({'1925','1935','1945','1955','1965','1975','1985','1995','2005','2010'});
xlabel('Year');
ylabel('Capacity (MW)');
set(ax,'FontSize',12)
title('Existing Coal Units by Initial Operating Year');
legend('Still operating' , 'Retired in 2012');
hold off

