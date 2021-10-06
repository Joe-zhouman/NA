function [x] = backSub(A, b)
    % backSub  - 回代法解方程 Ax=b
    %% Details
    % Optional file header info (to give more details about the function than in the H1 line)
    % Optional file header info (to give more details about the function than in the H1 line)
    %
    %% Syntax:
    % * [x] = backSub (A,b)
    %
    %% Inputs:
    % * *A* - 系数矩阵，必须为上三角或下三角矩阵
    % * *b* - Description
    %
    %% Outputs:
    % * *x* - 求解结果
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

    if ~(istril(A)) & ~(istriu(A))
        error("When using, %s must be a triangular matrix!", inputname(A));
    end

    x = b;
    n = size(b);

    if istril(A)

        for i = 1:n

            for k = 1:i - 1
                x(i) = x(i) - A(i, k) * x(k);
            end

            x(i) = x(i) / A(i, i);
        end

    else

        for i = n:-1:1

            for k = i + 1:n
                x(i) = x(i) - A(i, k) * x(k);
            end
            x(i) = x(i) / A(i, i);
        end      
    end

end

%------------- END OF CODE --------------
