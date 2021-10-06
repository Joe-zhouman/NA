function [L] = ll(A)
% ll - LL分解
%% Details
% A = LL^T
% A为正定矩阵，及A^T = A;
%% Syntax:  
% * [L] = ll(A)
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
%%TODO
% * TODO1
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
% * *Last revision*  : 03-10月-2021 
% * *Last version*   : 0.01 
%

%------------- BEGIN CODE --------------

n = length(A);
L = tril(A);
for k = 1:n
    L(k,k)=sqrt                                                                                                                                                                                                                                                                                                                                                                                    



%------------- END OF CODE --------------