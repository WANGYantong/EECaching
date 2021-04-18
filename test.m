clear;
clc;

addpath(genpath(pwd));

topo=GetTopo(1);

NUM_User=100;

Iter=100;
% result=zeros(Iter,4);
% ratio=zeros(Iter,4);
% time=zeros(Iter,4);
result=zeros(Iter,2);
ratio=zeros(Iter,2);
%%

% for ii=1:Iter
    para=GetPara(topo,NUM_User);
    
    % opt=1 for P1, 2 for P2
    opt=2;
%     solution_ILP=ILP_solver(topo,para,opt);    
%     solution_GSAC=GSAC(topo,para,opt);    
    solution_Random=Random(topo,para,opt);
    solution_Greedy=Greedy(topo,para,opt);
    solution_NoCache=NoCache(topo,para,opt);

for ii=1:Iter
    Acc=0;
%     result_ILP=AlgArena(solution_ILP,topo,para,opt,Acc);
%     result_GSAC=AlgArena(solution_GSAC,topo,para,opt,Acc);
    result_Random=AlgArena(solution_Random,topo,para,opt,Acc);
    result_Greedy=AlgArena(solution_Greedy,topo,para,opt,Acc);
    
    % Energy Gain
%     Gain_ILP=solution_NoCache.fval/result_ILP.E;
%     Gain_GSAC=solution_NoCache.fval/result_GSAC.E;
    Gain_Random=solution_NoCache.fval/result_Random.E;
    Gain_Greedy=solution_NoCache.fval/result_Greedy.E;
    
    % Cache-Hit Ratio
%     result(ii,:)=[Gain_ILP Gain_GSAC Gain_Random Gain_Greedy];
%     ratio(ii,:)=[result_ILP.ratio result_GSAC.ratio result_Random.ratio result_Greedy.ratio];
%     time(ii,:)=[solution_ILP.time solution_GSAC.time solution_Random.time solution_Greedy.time];
    
    result(ii,:)=[Gain_Random Gain_Greedy];
    ratio(ii,:)=[result_Random.ratio result_Greedy.ratio];

%     fprintf('Finish Loop %d \n',ii);
    
end
mean(result,1)
mean(ratio,1)
% mean(time,1)


