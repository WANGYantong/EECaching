function solution=GSAC(topo,para,opt)

SA.T_0=1e3;
SA.T_end=1e-3;
SA.decay_T=0.8;
SA.chain_length=200;
SA.interrp=20;

[value,index]=sort(sum(para.lambda_na,2),'descend');
[NUM_AR,NUM_EC,NUM_Path]=size(topo.N_aep);
NUM_File=length(para.s_n);

x=zeros(NUM_File,NUM_EC-1);
y=zeros(NUM_File,NUM_AR,NUM_EC,NUM_Path);
fval=0;

tic;
for ii=1:length(index)
    if value(ii)<=0
        break;
    end
    [x_n,y_n,E,w_n,c_n]=SimAnnealing(topo,para,opt,SA,index(ii));
    x(index(ii),:)=x_n;
    y(index(ii),:,:,:)=y_n;
    para.w_e=para.w_e-w_n;
    para.c_l=para.c_l-c_n;
    fval=fval+E;
end
solution.time=toc;

ind_x=find(x);
sz_x=size(x);
[solution.X(:,1),solution.X(:,2)]=ind2sub(sz_x,ind_x);
solution.X(:,3)=x(ind_x);

ind_y=find(y);
sz_y=size(y);
[solution.Y(:,1),solution.Y(:,2),solution.Y(:,3),solution.Y(:,4)]=...
    ind2sub(sz_y,ind_y);
solution.Y(:,5)=y(ind_y);

solution.fval=fval;

end

