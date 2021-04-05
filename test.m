clear;
clc;

addpath(genpath(pwd));


topo=GetTopo(1);

NUM_User=100;

result=zeros(1000,3);
ratio=zeros(1000,3);
% time=zeros(1000,3);
%%
para=GetPara(topo,NUM_User);

% opt=1 for P1, 2 for P2
opt=2;
solution_ILP=ILP_solver(topo,para,opt);

solution_GSAC=GSAC(topo,para,opt);


solution_Random=Random(topo,para,opt);

solution_NoCache=NoCache(topo,para,opt);
    
for ii=1:1000   
    
    Acc=0;
    result_ILP=AlgArena(solution_ILP,topo,para,opt,Acc);
    result_GSAC=AlgArena(solution_GSAC,topo,para,opt,Acc);
    result_Random=AlgArena(solution_Random,topo,para,opt,Acc);
    
    % Energy Gain
    Gain_ILP=solution_NoCache.fval/result_ILP.E;
    Gain_GSAC=solution_NoCache.fval/result_GSAC.E;
    Gain_Random=solution_NoCache.fval/result_Random.E;
    
    % Cache-Hit Ratio
    result(ii,:)=[Gain_ILP Gain_GSAC Gain_Random];
    ratio(ii,:)=[result_ILP.ratio result_GSAC.ratio result_Random.ratio];
%     time(ii,:)=[solution_ILP.time solution_GSAC.time solution_Random.time];
    
%     fprintf('Finish Loop %d \n',ii);
    
end
mean(result,1)
mean(ratio,1)
% mean(time,1)


