%% Test script for prank functions

clear all; %#ok<CLALL>
close all;
clc;

dbstop if error;

% Patrick Piprek
% patrick.piprek@hotmail.de

% Change log:
% 08-Dec-2019: Initial Setup

%% General setup
% Number of (random) tests for each prank
noRandTest = 20;

%% Plot function
for cntTest = uint32(1:1:noRandTest)
    % standard test function
    x = 0:pi/10:2*pi;
    y1 = sin(x);
    y2 = sin(x-0.25);
    y3 = sin(x-0.5);
    
    figure
    plot(x,y1,'g',x,y2,'b--o',x,y3,'c*');
    
    close;
end

%% Figure function
for cntTest = uint32(1:1:noRandTest)
    figure();
    
    close;
end