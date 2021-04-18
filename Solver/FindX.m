function x = FindX(s,w,lambda_a,N_ae)

x=zeros(size(w));
index=s<=w;

if ~any(index)
    return;
end

for ii=1:length(lambda_a)
    
    if lambda_a(ii)<=0
        continue;
    end
    [~,I]=sort(N_ae(ii,:));
    
    ec=find(index(I(1:length(I)-1)),1);
    
    x(I(ec))=1;
    
end

end

