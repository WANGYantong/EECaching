function [paths,costs] = MultiPath(G,s,t,k)

if nargin<4
    k=10;
elseif nargin<3
    warning('not enough input parameters');
    paths=[];
    costs=[];
    return;
end

adj_matrix=full(adjacency(G,'weighted'));
adj_matrix(adj_matrix==0)=inf;

[paths,costs]=kShortestPath(adj_matrix,s,t,k);

end

