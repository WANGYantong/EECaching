function [x_star,y_star,E_star,w,c] = SimAnnealing(topo,para,opt,SA,file)

x=InitialX(para.s_n(file),para.w_e);
y=DeterminY(x,para.lambda_na(file,:),para.b_n(file),para.c_l,...
    topo.N_aep,topo.B_laep,opt);
T=SA.T_0;
k=1;
counter=0;

E=EnergyCalculator(x,y,para.alpha,para.s_n(file),para.T,para.beta,topo.N_aep);

x_star=x;
y_star=y;
E_star=E;

while(T>=SA.T_end)
    while(k<=SA.chain_length)
        x_new=GenerateX(x,para.s_n(file),para.w_e);
        y_new=DeterminY(x_new,para.lambda_na(file,:),para.b_n(file),para.c_l,...
            topo.N_aep,topo.B_laep,opt);
        E_new=EnergyCalculator(x_new,y_new,para.alpha,para.s_n(file),para.T,...
            para.beta,topo.N_aep);
        if E_new<E
            x=x_new;
%             y=y_new;
            E=E_new;
            if E_new<E_star
                x_star=x_new;
                y_star=y_new;
                E_star=E_new;
                counter=0;
            else
                counter=counter+1;
                if counter>SA.interrp
                    break;
                end
            end
        elseif exp(-(E_new-E)/T)>=rand
            x=x_new;
%             y=y_new;
            E=E_new;
        end
        k=k+1;
    end
    T=SA.decay_T*T;
end

w=para.s_n(file)*x_star;

[NUM_AR,NUM_EC,NUM_Path]=size(topo.N_aep);
NUM_Link=length(para.c_l);
y_ex=reshape(y_star,1,NUM_AR*NUM_EC*NUM_Path);
y_ex=repmat(y_ex,[NUM_Link,1]);
y_ex=reshape(y_ex,NUM_Link,NUM_AR,NUM_EC,NUM_Path);
c=sum(sum(sum(topo.B_laep.*y_ex,4),3),2)*para.b_n(file);

end

