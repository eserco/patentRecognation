close all
clear

%%OBTAIN SET S
%load random person dataset. Data sets starting with "Person" has to be in the same directory
%with the script
load("person"+sprintf('%02d',randperm(20,1))+".mat");

%Prelocate empty HD list S to store obtained distances later on
S = zeros(1, 10000);

%obtain 100000 HD values
for i = 1:10000
    
       %create random integer for row selection
        randomNumbers = randperm(20,2);

        %access two rows of person03.mat file using randomNumbers
        rowOne = iriscode(randomNumbers(1),:);
        rowTwo = iriscode(randomNumbers(2),:);

        %merge rows into 2 by 30 matrix 
        A = [rowOne(:), rowTwo(:)];

        %applying HD function
        HD = pdist(A','hamming');
        
        %store HD to S
        S(i) = HD;
        
end

%%OBTAIN SET D

%create random number
randomNumbers2 = randperm(20,2);

%load two random person datasets
personRandOne = load("person"+sprintf("%02d", randomNumbers2(1))+".mat");
personRandTwo =load("person"+sprintf("%02d", randomNumbers2(2))+".mat");

%Prelocate empty HD list D to store obtained distances later on
D = zeros(1, 10000);

for i = 1:10000
    
       %create random integer for row selection
        randomNumbers3 = randperm(20,2);

        %access two rows of person03.mat file using randomNumbers
        rowThree = personRandOne.iriscode(randomNumbers3(1),:);
        rowFour = personRandTwo.iriscode(randomNumbers3(2),:);

        %merge rows into 2 by 30 matrix 
        A_D = [rowThree(:), rowFour(:)];

        %applying HD function
        HD_D = pdist(A_D','hamming');
        
        %store HD to D
        D(i) = HD_D;
        
end

figure
h = axes();
hold(h,'on')
hist(S)
hist(D)