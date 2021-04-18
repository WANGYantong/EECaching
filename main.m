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

%% Heuristic Solution
solution_GSAC=GSAC(topo,para,opt);

%% Random Solution
solution_Random=Random(topo,para,opt);

%% Greedy Solution
solution_Greedy=Greedy(topo,para,opt);

%% No Cache (Benchmark)
solution_NoCache=NoCache(topo,para,opt);

%% Performance Comparison
Acc=1;
result_ILP=AlgArena(solution_ILP,topo,para,opt,Acc);
result_GSAC=AlgArena(solution_GSAC,topo,para,opt,Acc);
result_Random=AlgArena(solution_Random,topo,para,opt,Acc);
result_Greedy=AlgArena(solution_Greedy,topo,para,opt,Acc);

% Energy Gain
Gain_ILP=solution_NoCache.fval/result_ILP.E;
Gain_GSAC=solution_NoCache.fval/result_GSAC.E;
Gain_Random=solution_NoCache.fval/result_Random.E;
Gain_Greedy=solution_NoCache.fval/result_Greedy.E;

% Result
[Gain_ILP Gain_GSAC Gain_Random Gain_Greedy]
[result_ILP.ratio result_GSAC.ratio result_Random.ratio result_Greedy.ratio]