clc,clear,close all;
import SolveLinearEqn.Directly.*
A = [2 2 3;4 7 7;-2 4 5];
b = [3;1;-7];
[L,U] = lu(A);

y = backSub(L,b);
x = backSub(U,y);

disp("x=");
disp(x);
disp("error");
disp(x-A\b);