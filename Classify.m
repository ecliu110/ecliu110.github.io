% Classify.m 
% Compare songs to database to determine if electronic or classical
% Calls function compareDB
clear all;
close all

%%
dbname = 'database.mat';

[rE rC ans1] = compareDB('AokiCut.mp3',dbname);
ans1

[rE2 rC2 ans2] = compareDB('CrackCut.mp3',dbname);
ans2
rE2
rC2
%%

% Vivaldi Spring: Four season's symphony
[rE3 rC3 ans3] = compareDB('SpringCut.mp3',dbname);
ans3

% Bach's Symphony
[rE4 rC4 ans4] = compareDB('BachCut.mp3',dbname);
ans4
rE4
rC4




