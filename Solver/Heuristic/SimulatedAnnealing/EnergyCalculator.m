function Energy = EnergyCalculator(x,y,alpha,s,T,beta,N_aep)

EC=sum(x)*alpha*T*s;
ET=sum(N_aep.*y,'all')*beta*s;

Energy=EC+ET;

end

