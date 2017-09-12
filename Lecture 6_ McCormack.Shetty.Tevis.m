%Lecture 6

temps=csvread('tempdata.csv');
temps=temps(:,2);
%Read electricity demand data
data_2014 = csvread('hourly-day-ahead-bid-data-2014.csv',5,1); %need numerical data
vector = mat2vec(data_2014); %convert to vector
peak = zeros(365,1);

for i=1:365
    peak(i) = max(data_2014(i,:));
end

peak=peak/1000; %scaling

% forms 2-column matrix
combined = [temps peak];

% clusters for each row
IDX = kmeans(combined,3); %produces group labels for each value 

% forms 3-column matrix
clustered_data = [combined IDX];

% sorts 
sorted_data = sortrows(clustered_data,3); %sorts data in order ascend/descend sort by third column(IDX)

% find indices of cluster 1
ONE = clustered_data(clustered_data(:,3)==1,1:2);

% find indices of cluster 2
TWO = clustered_data(clustered_data(:,3)==2,1:2);

% find indices of cluster 3
THREE = clustered_data(clustered_data(:,3)==3,1:2);

figure; 
hold on;
scatter(ONE(:,1),ONE(:,2),'r'); 
scatter(TWO(:,1),TWO(:,2) ,'b');
scatter(THREE(:,1),THREE(:,2) ,'g');
xlabel('Average Temperature (degrees F)','FontSize',14);
ylabel('Peak Electricity Demand (GWh)','FontSize',14);
legend('Cluster 1', 'Cluster 2', 'Cluster 3');
hold off;


%Time Series Data

%Number 1 January and July  take average of each hour in july 

jan = data_2014(1:31,1:24);
jul = data_2014(182:213,1:24);

jan_avg = zeros(24,1);
jul_avg = zeros(24,1);
for i=1:24
    jan_avg(i) = mean(jan(:,i));
    jul_avg(i) = mean(jul(:,i));
end

figure;
plot(jan_avg);
xlabel('Hour of day');
ylabel('Average Electricity Demand');
title('Mean Hourly Demand for January 2014');

figure;
plot(jul_avg);
xlabel('Hour of day');
ylabel('Average Electricity Demand');
title('Mean Hourly Demand for July 2014');


% Question 2 
%1 = Sun, 2 = Mon, 3 = Tues, 4 = Wed, 5 = Thu, 6 = Fri 7 = Sat


%January 1, 2014 is a Wednesday 
%December 31, 2014 is a Wednesday 

dayofweek = zeros(365,1);
dayofweek(1) = 4;
for i = 1:364
    dayofweek(i+1) = dayofweek(i)+1;
    if dayofweek(i) >= 7
        dayofweek(i+1) = 1;
    end
end

daypeak_2014 = [dayofweek peak];

MON = daypeak_2014(daypeak_2014(:,1)==2,2);
TUE = daypeak_2014(daypeak_2014(:,1)==3,2);
WED = daypeak_2014(daypeak_2014(:,1)==4,2);
THU = daypeak_2014(daypeak_2014(:,1)==5,2);
FRI = daypeak_2014(daypeak_2014(:,1)==6,2);
SAT = daypeak_2014(daypeak_2014(:,1)==7,2);
SUN = daypeak_2014(daypeak_2014(:,1)==1,2);

WED(end) = [];

peakday_box = [MON TUE WED THU FRI SAT SUN];


boxplot(peakday_box,'Labels',{'MON','TUE','WED','THU','FRI','SAT','SUN'}); 
xlabel('Day of Week')  
ylabel('Peak Electricity Demand') %OUTLIER ON SUNDAY
title('Peak Electricty Demand Per Day of the Week')

