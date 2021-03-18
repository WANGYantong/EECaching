function beta = GetPathLinkRel(graph,direction,path,path_num)
%GETPATHLINKREL generate a binary matrix beta to show the ownership
%between paths and links
%
%   Input variables:
%     
%        graph:  the graph
%
%        direction: indicate graph is 'directed' or 'undirected'
%
%        path: the possible route of the graph, cell array
%
%        path_num: the K in K shortest paths
%
% 	Output variables:
%
%        beta: if beta(i,j,k,l)=1, it means the path{j,k}{l} goes across link(i)
%

if nargin ~= 4
    error('Illegal input number')
end

[s,t] = findedge(graph);

beta = zeros([length(s),size(path),path_num]);
arcs = [s,t]; 

for ii = 1:size(path,1)
    for jj = 1:size(path,2)
        if ~isempty(path{ii,jj})
            for kk = 1:length(path{ii,jj})
                for ll = 1:length(path{ii,jj}{kk})-1
                    link=FindLink(path{ii,jj}{kk}(ll:ll+1),arcs,direction);
                    if link
                        beta(link,ii,jj,kk) = 1;
                    end
                end
            end
        end
    end
end

end

function link = FindLink(path,arcs,direction)

link = 0;
if direction == "directed"
    for ii = 1:length(arcs)
        if arcs(ii,1) == path(1) && arcs(ii,2) == path(2)
            link = ii;
            break;
        end
    end
else
    for ii = 1:length(arcs)
        if (arcs(ii,1) == path(1) && arcs(ii,2) == path(2))...
                || (arcs(ii,1) == path(2) && arcs(ii,2) == path(1))           
            link = ii;
            break;
        end
    end
end

end

