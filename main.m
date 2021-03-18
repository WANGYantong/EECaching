clear;
clc;

addpath(genpath(pwd));

%% Network Parameters
topo=GetTopo(1);

NUM_User=100;
para=GetPara(topo,NUM_User);

%% MILP Solution
% opt=1 for P1, 2 for P2
opt=2;
solution_ILP=ILP_solver(topo,para,opt);

%% Heuristic Algorithm


%% Performance Comparison