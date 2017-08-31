%McCormack_Briana Lecture3

%Statistics%

%Question 1

[number date combined] = xlsread('RNGWHHDm.xls', 'Data 1','A4:B250');

%Question 2
jan2dec = monthly_stats(number);


%Question 3
april = jan2dec(4,1)+jan2dec(4,2).*randn(1000,1);
january = jan2dec(1,1)+jan2dec(1,2).*randn(1000,1)

%Question 4
histogram(april)
hold on
histogram(january)
xlabel('Prices');
ylabel('Number of Months');
title('Natural Gas Prices of April and January');
legend('april','january');

%Negative prices?

