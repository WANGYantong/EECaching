function para=GetPara(topo,NUM_User)

[NUM_Link,NUM_AR,NUM_EC,~]=size(topo.B_laep);
NUM_EC=NUM_EC-1;
NUM_File=100;
Pop_Ratio=0.2;

para.alpha=2.5*1e-9*1024*1024*8; % caching factor (Watt/MB) 
para.beta=4*1e-8*1024*1024; % transmitting factor (Joule/Mb)

para.s_n=randi([1,10],NUM_File,1)*10; % content size (MB) 
para.b_n=para.s_n; % content bandwidth (Mbps), which is corresponding to its size
para.w_e=ones(NUM_EC,1)*1024*0.5; % caching space (MB) - 0.25GB,0.5GB,1GB
para.c_l=ones(NUM_Link,1)*1024*0.5; % link capacity (Mbps) - 0.25Gbps,0.5Gbps,1Gbps
para.c_l(NUM_Link-3:NUM_Link)=1024*10;
para.T=10; % time period (second)

rho_kn=zeros(NUM_User,NUM_File);
pi_ka=zeros(NUM_User,NUM_AR);
for ii=1:NUM_User
    rho_kn(ii,randi([1,NUM_File*Pop_Ratio]))=1;
    pi_ka(ii,randi([1,NUM_AR]))=1;
end

para.lambda_na=zeros(NUM_File,NUM_AR);
for ii=1:NUM_File
    for jj=1:NUM_AR
        para.lambda_na(ii,jj)=rho_kn(:,ii)'*pi_ka(:,jj);
    end
end

para.rho_kn=rho_kn;
para.pi_ka=pi_ka;

end

