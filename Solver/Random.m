function solution=Random(topo,para,opt)

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
    
    file=index(ii);
    w_e_copy=para.w_e;
    w_e_copy(1:3)=0;
    x_n=InitialX(para.s_n(file),w_e_copy);
    y_n=DeterminY(x_n,para.lambda_na(file,:),para.b_n(file),para.c_l,...
        topo.N_aep,topo.B_laep,opt);
    E=EnergyCalculator(x_n,y_n,para.alpha,para.s_n(file),para.T,...
        para.beta,topo.N_aep);
    w_n=para.s_n(file)*x_n;
    
    [NUM_AR,NUM_EC,NUM_Path]=size(topo.N_aep);
    NUM_Link=length(para.c_l);
    y_ex=reshape(y_n,1,NUM_AR*NUM_EC*NUM_Path);
    y_ex=repmat(y_ex,[NUM_Link,1]);
    y_ex=reshape(y_ex,NUM_Link,NUM_AR,NUM_EC,NUM_Path);
    c_n=sum(sum(sum(topo.B_laep.*y_ex,4),3),2)*para.b_n(file);
    
    x(file,:)=x_n;
    y(file,:,:,:)=y_n;
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



