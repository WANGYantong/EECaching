function solution=ILP_solver(topo,para)

[NUM_AR,NUM_EC,NUM_Path]=size(topo.N_aep);
NUM_File=length(para.s_n);
NUM_Link=length(para.c_l);

%% decision variables
x=optimvar('X_ne',NUM_File,NUM_EC-1,'Type','integer',...
    'LowerBound',0,'UpperBound',1); % exclude the server
y=optimvar('Y_naep',NUM_File,NUM_AR,NUM_EC,NUM_Path,'Type','integer',...
    'LowerBound',0,'UpperBound',1);

%% constraints

sn_x=repmat(para.s_n,1,NUM_EC-1);
constr1=squeeze(sum(sn_x.*x,1))<=para.w_e';

y_ex=reshape(y,1,NUM_File*NUM_AR*NUM_EC*NUM_Path);
y_ex=repmat(y_ex,[NUM_Link,1]);
y_ex=reshape(y_ex,NUM_Link,NUM_File,NUM_AR,NUM_EC,NUM_Path);
b_ex=zeros(size(y_ex));
for ii=1:NUM_Link
    for jj=1:NUM_File
        b_ex(ii,jj,:)=topo.B_laep(ii,:);
    end
end
buff=sum(sum(sum(b_ex.*y_ex,5),4),3);
b_buff=repmat(para.b_n',NUM_Link,1);
constr2=sum(b_buff.*buff,2)<=para.c_l;

% x_ne --> x_nae --> x_naep
x_ex=cat(2,x,ones(NUM_File,1));
x_ex=repmat(x_ex,[NUM_AR,1,1]);
x_ex=reshape(x_ex,NUM_File,NUM_AR,NUM_EC);
x_ex=repmat(x_ex,[1,1,1,NUM_Path]);
constr3=y<=x_ex;

lambda_y=repmat(para.lambda_na,[1,1,NUM_EC,NUM_Path]);
constr4=y<=lambda_y;

constr5=para.lambda_na.*squeeze(sum(sum(y,4),3))==para.lambda_na;

%% objective function
EC=sum(sn_x.*x,'all')*para.alpha*para.T;

N_y=reshape(topo.N_aep,1,NUM_AR*NUM_EC*NUM_Path);
N_y=repmat(N_y,[NUM_File,1]);
N_y=reshape(N_y,NUM_File,NUM_AR,NUM_EC,NUM_Path);
ET=para.s_n'*squeeze(sum(sum(sum(N_y.*y,4),3),2))*para.beta;

%% Optimization Model
ILP=optimproblem;

ILP.Objective=EC+ET;
ILP.Constraints.constr1=constr1;
ILP.Constraints.constr2=constr2;
ILP.Constraints.constr3=constr3;
ILP.Constraints.constr4=constr4;
ILP.Constraints.constr5=constr5;

opts=optimoptions('intlinprog','Display','off','MaxTime',3600*2);

[sol,fval,~,~]=solve(ILP,'Options',opts);

ind_x=find(sol.X_ne);
sz_x=size(sol.X_ne);
[solution.X(:,1),solution.X(:,2)]=ind2sub(sz_x,ind_x);
solution.X(:,3)=sol.X_ne(ind_x);

ind_y=find(sol.Y_naep);
sz_y=size(sol.Y_naep);
[solution.Y(:,1),solution.Y(:,2),solution.Y(:,3),solution.Y(:,4)]=...
    ind2sub(sz_y,ind_y);
solution.Y(:,5)=sol.Y_naep(ind_y);

solution.fval=fval;

end

