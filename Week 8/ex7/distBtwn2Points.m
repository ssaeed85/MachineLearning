function [ distance ] = distBtwn2Points(X,Y)
%DISTBTWN2POINTS Summary of this function goes here
%   Detailed explanation goes here

distance = ( X(1)-Y(1) )^2 + ( X(2)-Y(2) )^2;
distance = abs(distance);
end

