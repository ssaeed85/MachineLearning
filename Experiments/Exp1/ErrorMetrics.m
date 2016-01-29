function [ precision,recall,accuracy,fScore ] = ErrorMetrics(p,y)
%ERRORMETRICS Summary of this function goes here
%   Detailed explanation goes here

TP = sum((p+y)==2);
TN = sum((p+y)==0);
FP = sum(((p==1)+(y==0))==2);
FN = sum(((p==0)+(y==1))==2);
m=length(y);

precision = TP/(TP+FP);
recall = TP/(TP+FN);
accuracy = (TP + TN)/m;
fScore = (2 * precision * recall)/(precision + recall);

end

