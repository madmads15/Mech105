%% Homework 9 - False Position Algorithim
% By: Maddie D'Amato
function [root, fx, ea, iter] = falsePosition (func, Xl, Xu, es, maxiter);
% This function estimates the root of any given function by using the false
% position method
%
%Variables:
%
% Inputs - 
% Xl = the lower guess
% Xu = the upper guess
% es = the desired relative error (Default number is 0.0001%)
% maxiter = the desired number of iterations (Default number is 200)
%
% Outputs - 
% root = the estimated root location
% fx = the function evaluated at the root location
% ea = the approximate relative error (percentage)
% iter = the number of performed iterations

root = 0; % This gives the root variable a starting value
ea = intmax; % This allows the ea variable to not have a capped value 
iter = 0; % This gives the iter variable a starting value

format long % This makes sure that the whole number is shown

if nargin < 3; % The function needs at least three input values (f,Xl,Xu)
    error ('There needs to be at least 3 inputs')
else if nargin == 3; % If there are three inputs then es and maxiter go to their default values
        es = 0.0001;
        maxiter = 200;
    else if nargin == 4; % If there are four inputs then the only default value is maxiter
            maxiter = 200;
        end
    end
end

sc = func(Xu) * func(Xl); % sc stands for sign change and to test if there is a sign change the functions of Xu and Xl need to be muliplied together
if sc > 0; % If sc is a positvie number that means that there was a neg*neg or pos*pos so there was no sign change
    error ('There is no boundary sign change so boundaries need to be repicked')
end

while (ea > es) && (iter < maxiter); % The while loop will continue to run until the approximate error and maxiter is greater than the desired error and number of iterations
    oldroot = root; % This re-stores the calculated root under the name oldroot so it is not forgotten when finding ea
    root = vpa(Xu-((func(Xu)*(Xl-Xu))/(func(Xl)-func(Xu)))); % This is the formula for finding the root with an upper and lower bound
    if func(root)*func(Xl) > 0; % This redefines the upper and lower bounds with the new root based on whether the root is negative or positive
        Xl = root;
    else if func(root)*func(Xl) < 0;
            Xu = root;
        end
    end
    if iter > 0; % This makes sure that at least one iterations is completed before the approximate relative error is calculated
        ea  = abs((root-oldroot)/root)*100; % This is the formula to calculate the approximate relative error
    end
    iter = iter + 1; % This adds to the number of iterations to get the closest approximated root
end
    disp(root) % This makes sure to display the root after the function is complete
    
