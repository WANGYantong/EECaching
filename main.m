clear;
clc;

addpath(genpath(pwd));

%% Network Parameters
topo=GetTopo(1);

NUM_User=5;
para=GetPara(topo,NUM_User);

%% MILP Solution
% opt=1 for P1, 2 for P2
solution_ILP=ILP_solver(topo,para);

%% Heuristic Algorithm


%% Performance Comparison