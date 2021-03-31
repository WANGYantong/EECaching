function solution = NoCache(topo,para,opt)

[NUM_AR,NUM_EC,NUM_Path]=size(topo.N_aep);
NUM_File=length(para.s_n);

N_y=reshape(topo.N_aep,1,NUM_AR*NUM_EC*NUM_Path);
N_y=repmat(N_y,[NUM_File,1]);
N_y=reshape(N_y,NUM_File,NUM_AR,NUM_EC,NUM_Path);

y=zeros(NUM_File,NUM_AR,NUM_EC,NUM_Path);

if opt==1
    y(:,:,NUM_EC,1)=para.lambda_na>0;
else
    y(:,:,NUM_EC,1)=para.lambda_na;
end

solution.fval=para.s_n'*squeeze(sum(sum(sum(N_y.*y,4),3),2))*para.beta;

end

