clc,clear,close all;
import SolveLinearEqn.Directly.*

A = [1 1 1 0 0 0 0
0 -1 0 1 1 0 0
0 0 -1 0 -1 -1 1
0 0 0 -1 0 1 0
0 0 0 -8 7 -15 0
0 -30 10 0 -7 0 0 
-35 0 10 0 0 0 5];
tic
[L,U]=lu(A);

toc
tic
[L1, U1] = lu_mex(A);
toc
E = L*U-A;
disp("L=")
disp(L);
disp(L1)
disp("U=")
disp(U);
disp(U1)
