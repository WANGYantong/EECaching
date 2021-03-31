function x_new = GenerateX(x,s,w)

x_new=x;
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

x_new(temp)=~x_new(temp);

end

