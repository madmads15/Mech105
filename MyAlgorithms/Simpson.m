%% Homework 21 - Simpon's 1/3 Rule Algorithm
% By: Maddie D'Amato

function I = Simpson(x,y)
% This function is designed to evaluate the integral of an inputed vector
% of function values "y" with respect to "x" using the Simpson's 1/3 rule
% and trapezoidal rule for a vector with an odd number of intervals
% Input an x and y variable before calling the function Simpson(x,y)

%% Checking For Lenght and Spacing of Vectors
xcheck = size(x(1:end)); %Setting up variables
ycheck = size(y(1:end));

if xcheck ~= xcheck; %This is checking to see if the lenght of "x" and "y" are equal 
   error('Inputed vectors "x" and "y" are not the same length')
end

if diff(x) ~= x(end)-x(end-1); %This is checking to to make sure that the step size of the "x" vector is equal
    error('The spacing of the "x" vector is not equal')
end

%% Setting Up Conditions and Variablel
n = x(end)-x(end-1); %This is calculating the step size of the vector
i = (x(end)-x(1))/n; %This calculates the number of intervals
j = [y(2):y(end-1)]; %This calls all of the middle numbers in the "y" vector
jsum = sum(j); %This takes the sum of the middle numbers in the "y" vector

%% Setting Up Odd and Even Elements
A=round(100*rand(20,1));
 even=A(mod(A,2)==0); %This sets up a variable with all even numbers
 odd=A(mod(A,2)~=0); %This sets up a variable with all odd  numbers

%% Simpson's 1/3 Rule with Needed Trapezoidal Rule
for i = even; %This sets up the condition for the number of intervals to be even in order to use the Simpson's 1/3 Rule
    I = (x(end)-x(1))*((y(1)+(4*jsum)+y(end))/6) %This is the equation for Simpson's 1/3 Rule
end

%% Simpson's 1/3 Rule with the Trapezoidal Rule
for i = odd; %If the number of intervals is odd the the last interval of the section needs to be done with the Trapezoidal Rule
    warning('Trapezoidal Rule needs to be used on the last interval')
    I = (x(end-1)-x(1))*((y(1)+(4*j)+y(end-1))/6); %This is the equation for Simpson's 1/3 Rule
    T = (x(end)-x(end-1))*((y(end)+y(end-1))/2); %This does the Trapezoidal Rule for the last interval of the vector
    Isumandtrap = (I + T) %This adds the Simpson's 1/3 Rule with the last Trapezoidal interval  
end
        
