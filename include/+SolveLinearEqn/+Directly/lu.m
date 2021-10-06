function [L,U] = lu(A)
% LU - 矩阵的LU分解
%% Details
% Optional file header info (to give more details about the function than in the H1 line)
% Optional file header info (to give more details about the function than in the H1 line)
%
%% Syntax:  
% * [L,U] = LU(A)
%
%% Inputs:
% * *A* - Description
%
%% Outputs:
% * *L* - Description
%
%% Example:
% # Line 1 of example
% # Line 2 of example
% # Line 3 of example
% # Line 4 of example
%
%% Dependence
% # Other m-files required: none
% # Subfunctions: none
% # MAT-files required: none
% # See Also : 
% * OTHER_FUNCTION_NAME1
% * OTHER_FUNCTION_NAME2
%
%% TODO
% * use mex
%
%% authorizer
% * *Author*  : Joe, Zhou Man 
% * *Email*   : man.man.man.man.a@gmail.com 
% * *Email*   : joe_zhouman@foxmail.com 
% * *QQ*      : 1592020915 
% * *Weibo*   : @zhouman_LFC 
% * *Twitter* : @zhouman_LFC 
% * *Website* : www.joezhouman.com 
% * *Github*  : github.com/Joe-zhouman 
%
%% Version
% * *Matlab Version* : R2019a
% * *Created time*   : 十月 2021 
% * *Last revision*  : 02-10月-2021 
% * *Last version*   : 0.01 
%

%------------- BEGIN CODE --------------
n = length(A);

L = tril(A);
U = triu(A);
for i = 1:n
    L(i,i)=1;
    for k = 1:(i-1)
            U(i,i) = U(i,i)-L(i,k)*U(k,i);
    end
    for j = (i+1):n
        
        for k = 1:(i-1)
            U(i,j) = U(i,j)-L(i,k)*U(k,j);
            L(j,i) = L(j,i)-L(j,k)*U(k,i);
        end
        L(j,i)=L(j,i)/U(i,i);
    end
end

%------------- END OF CODE --------------