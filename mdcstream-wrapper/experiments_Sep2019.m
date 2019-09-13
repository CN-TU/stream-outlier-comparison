
% mdcstream wrapper configuration for the experiments included in:
% MDCstream: A MATLAB tool for Generating Stream Data
%
% by F.Iglesias, D.Odjanic, A.Hartl, and T.Zseby
% comments/issues: felix.iglesias@tuwien.ac.at
% 
% CN Group - TU Wien 
% Sep 2019

clear;
p.seed = 15;
p.nDatapoints = 10000;

p.scenarioName = {'sty-small-stc','seq-small-stc','nos-small-stc','sty-big-stc','seq-big-stc','nos-big-stc','sty-small-dyn','seq-small-dyn','nos-small-dyn','sty-big-dyn','seq-big-dyn','nos-big-dyn'};
p.nOfDataSets = {20,20,20,20,20,20,20,20,20,20,20,20};
p.dimensions = {'many','many','many','many','many','many','many','many','many','many','many','many'};
p.stationary = {'stationary','sequential','nonstationary','stationary','sequential','nonstationary','stationary','sequential','nonstationary','stationary','sequential','nonstationary'};
p.outliers = {'medium','medium','medium','medium','medium','medium','medium','medium','medium','medium','medium','medium'};
p.clusters = {'few','few','few','few','few','few','few','few','few','few','few','few'};
p.densityDiff = {'many','many','many','many','many','many','many','many','many','many','many','many'};
p.space = {'tight','tight','tight','extensive','extensive','extensive','tight','tight','tight','extensive','extensive','extensive'};
p.movingClusters = {'no','no','no','no','no','no','all','all','all','all','all','all'};
p.overlap = {'no','no','no','no','no','no','no','no','no','no','no','no'};

addpath(genpath('src'));
generateDataSets(p, 'dataRoot');

