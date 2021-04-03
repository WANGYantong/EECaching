function x = InitialX(s,w)

x=zeros(size(w));
index=s<=w;

if ~any(index)
    return;
end

while 1
    temp=randi([1,length(w)]);
    if index(temp)==1
        break;
    end
end

x(temp)=1;

end

