function ratio = CacheHit(topo,y)

[~,NUM_EC,~]=size(topo.N_aep);

index=y(:,3)<NUM_EC;
cache_hit=sum(y(index,5));
all=sum(y(:,5));

ratio=cache_hit/all;

end

