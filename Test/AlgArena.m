function result = AlgArena(solution,topo,para,opt,Acc)

if Acc==1
    result.Y=solution.Y;
    result.E=solution.fval;
    result.ratio=CacheHit(topo,result.Y);
    return;
end

NUM_File=100;
[NUM_AR,NUM_EC,NUM_Path]=size(topo.N_aep);

para_new=NewPara(para,NUM_File,Acc);

x=zeros(NUM_File,NUM_EC-1);
y=zeros(NUM_File,NUM_AR,NUM_EC,NUM_Path);
fval=0;

for ii=1:size(solution.X,1)
    x(solution.X(ii,1),solution.X(ii,2))=solution.X(ii,3);
end

[value,index]=sort(sum(para_new.lambda_na,2),'descend');

for ii=1:length(index)
    if value<=0
        break;
    end
    % get y
    y_n=DeterminY(x(index(ii),:),para_new.lambda_na(index(ii),:),para_new.b_n(index(ii)),para_new.c_l,...
        topo.N_aep,topo.B_laep,opt);
    y(index(ii),:,:,:)=y_n;
    
    % update bandwidth
    NUM_Link=length(para.c_l);
    y_ex=reshape(y_n,1,NUM_AR*NUM_EC*NUM_Path);
    y_ex=repmat(y_ex,[NUM_Link,1]);
    y_ex=reshape(y_ex,NUM_Link,NUM_AR,NUM_EC,NUM_Path);
    c_n=sum(sum(sum(topo.B_laep.*y_ex,4),3),2)*para_new.b_n(index(ii));
    para_new.c_l=para_new.c_l-c_n;
    
    % calculate energy
    E=EnergyCalculator(x(index(ii),:),y_n,para_new.alpha,para_new.s_n(index(ii)),...
        para_new.T,para_new.beta,topo.N_aep);
    fval=fval+E;
end

result.E=fval;

ind_y=find(y);
sz_y=size(y);
[result.Y(:,1),result.Y(:,2),result.Y(:,3),result.Y(:,4)]=...
    ind2sub(sz_y,ind_y);
result.Y(:,5)=y(ind_y);
result.ratio=CacheHit(topo,result.Y);

end

