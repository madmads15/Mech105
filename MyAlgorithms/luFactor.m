%% Homework 15 - LU Factorization with Partial Pivoting
% By: Maddie D'Amato
function [L,U,P] = luFactor (A);
% Variables:
% Inputs -  
% A = coefficient matrix
% when putting into command window format A = [a(11)_a(12); a(21)_a(22)]
% for the desired size of the matrix (_ = space)
% Outputs -
% L = lower triangular matrix
% U = upper triangular matrix
% P = the pivot matrix

%% Sets Up The Main Conditions of the Function
[row,col] = size(A);
AI = inv(A); % This finds the inverse of the A matrix
L = A*AI; %The matrix times the inverse of the matrix make the identity matrix
P = L; %P is also the identity matrix
U = A;

%% Checks for User Error
if row ~= col %The matrix needs to be a square so it will have the same number of rows and columns
        error ('The matrix needs to be a square matrix')
end

%% Partial Pivoting
for a = 1 : row; %This sets up one entire row of the matrix with a being the first row
  [pivot, i] = max(abs(U(a : row,a))); %This finds the row of the first colum woth the max value that needs to be pivoted
   i = i + (row - 1); %This sets up the condition for i which helps determine which rows to switch suring pivoting
   if  row >= 2 %This sets up all conditions where the max value isn't in the first row and needs to be pivoted 
       matrix1 = L(a,(1 : (a - 1))); %%This switches a and row of L to make the max value in the first row  
       L(i,(1 : (a - 1))) = matrix1; 
   else %This is the easiest condition where the highest absolute value is already first
       %This else statement switches rows i and a so it switches the max value with the first row
       matrix2 = U(i,:); %This is where row and i are being switched in the U matrix
       matrix3 = P(i,:); %This is where row and i are being switched in the P matrix
   end
  
%% Forward Elimination
for b = (a + 1) : row;
    L(b,a) = U(b,a) / U(a,a);
    U (b,:) = U(b,:) - (L(b,a) * U(a,:));
end
   end
%% Displays Results At The End
L %Displays the L matrix
U %DIsplays the U matrix
check1 = L*U %This checks to make sure that L*U = P*A so check1 should equal check 2
check2 = P*A

   
    
