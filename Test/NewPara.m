function para_new = NewPara(para,NUM_File,Acc)

para_new=para;

if Acc==1
    return;
end

[NUM_User,NUM_AR]=size(para.pi_ka);

[~,File_Old]=size(para.rho_kn);
para_new.rho_kn=[para.rho_kn,zeros(NUM_User,NUM_File-File_Old)];

for ii=1:NUM_User
    if rand>Acc
        index=find(para.rho_kn(ii,:));
        while 1
            index_new=randi([1,NUM_File]);            
            if index_new~=index
                break;
            end
        end
        para_new.rho_kn(ii,index_new)=1;
        para_new.rho_kn(ii,index)=0;
    end
end

for ii=1:NUM_File
    for jj=1:NUM_AR
        para_new.lambda_na(ii,jj)=...
            para_new.rho_kn(:,ii)'*para_new.pi_ka(:,jj);
    end
end
    
end

