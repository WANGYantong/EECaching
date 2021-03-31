function y_aep = DeterminY(x,lambda_a,b,c_l,N_aep,B_laep,opt)

[NUM_AR,NUM_EC,NUM_Path]=size(N_aep);

y_aep=zeros(NUM_AR,NUM_EC,NUM_Path);

if opt==1
    
    if ~any(x)
        y_aep(lambda_a>0,NUM_EC,1)=1;
    else
        for ii=1:NUM_AR
            if lambda_a(ii)>0
                flag=0;
                [~,index]=sort(N_aep(ii,:,1),'ascend');
                for jj=1:length(index)
                    if jj<length(index)
                        if x(index(jj))==1
                            for kk=1:NUM_Path
                                if N_aep(ii,index(jj),kk)>=1e4
                                    break;
                                end
                                bw=c_l(B_laep(:,ii,index(jj),kk)==1);
                                if ~isempty(bw)
                                    if all(bw>=b)
                                        y_aep(ii,index(jj),kk)=1;
                                        c_l(B_laep(:,ii,index(jj),kk)==1)=bw-b;
                                        flag=1;
                                        break;
                                    end
                                else
                                    y_aep(ii,index(jj),kk)=1;
                                    flag=1;
                                    break;
                                end
                            end
                        end
                    else
                        y_aep(ii,NUM_EC,1)=1;
                    end
                    if flag==1
                        break;
                    end
                end
            end
        end
    end
    
else
    
    if ~any(x)
        y_aep(:,NUM_EC,1)=lambda_a;
    else
        for ii=1:NUM_AR
            if lambda_a(ii)>0
                flag=0;
                [~,index]=sort(N_aep(ii,:,1),'ascend');
                for jj=1:length(index)
                    if jj<length(index)
                        if x(index(jj))==1
                            for kk=1:NUM_Path
                                if N_aep(ii,index(jj),kk)>=1e4
                                    break;
                                end
                                bw=c_l(B_laep(:,ii,index(jj),kk)==1);
                                if ~isempty(bw)
                                    if all(bw>=b)
                                        y_aep(ii,index(jj),kk)=min(min(floor(bw/b)),lambda_a(ii));
                                        c_l(B_laep(:,ii,index(jj),kk)==1)=bw-y_aep(ii,index(jj),kk)*b;
                                        lambda_a(ii)=lambda_a(ii)-y_aep(ii,index(jj),kk);
                                        if lambda_a(ii)<=0
                                            flag=1;
                                            break;
                                        end
                                    end
                                else
                                    y_aep(ii,index(jj),kk)=lambda_a(ii);
                                    flag=1;
                                    break;
                                end
                            end
                        end
                    else
                        y_aep(ii,NUM_EC,1)=lambda_a(ii);
                    end
                    if flag==1
                        break;
                    end
                end
            end
        end
    end
    
end

end

