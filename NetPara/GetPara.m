function para=GetPara(topo,NUM_User)

[NUM_Link,NUM_AR,NUM_EC,~]=size(topo.B_laep);
NUM_EC=NUM_EC-1;
NUM_File=20;
Pop_Ratio=1;

para.alpha=2.5*1e-9*1024*1024*8; % caching factor (Watt/MB) 
para.beta=4*1e-8*1024*1024; % transmitting factor (Joule/Mb)

para.s_n=randi([1,10],NUM_File,1)*10; % content size (MB) 
para.b_n=para.s_n; % content bandwidth (Mbps), which is corresponding to its size
para.w_e=ones(NUM_EC,1)*1024; % caching space (MB) - 1GB, 2GB, 10GB
para.c_l=ones(NUM_Link,1)*1024; % link capacity (Mbps) - 1Gbps, 2Gbps, 10Gbps
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

end

