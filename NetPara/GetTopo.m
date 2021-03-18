function topo=GetTopo(case_number)

%% graph generation
switch case_number
    case 1
        s=[11,1,1,2,2,2,3,3,4,5,4,4,5,5,6,6];
        t=[1,2,3,3,4,5,5,6,5,6,7,8,8,9,9,10];
        XData=[3,2,4,1,3,5,0,2,4,6,3];
        YData=[6,4,4,2,2,2,0,0,0,0,7];
        weights=ones(size(s));
        weights(1)=12;
        G=graph(s,t,weights);
    otherwise
        error('The available topo option is 1');
end

plot(G,'LineWidth',1.5,'Marker','o','MarkerSize',10,...
    'XData',XData,'YData',YData);

%% multipath collection
source=7:10;
target=1:11;

paths=cell(length(source),length(target));
costs=paths;
path_num=5;
for ii=1:length(source)
    for jj=1:length(target)
        [paths{ii,jj},costs{ii,jj}]=MultiPath(G,source(ii),target(jj),path_num);
    end
end

%% N_{aep} generation
N_aep=ones([size(costs),path_num])*1e6;
N_aep(:,:,1)=0; % within the assumption every nodes are connected

for ii=1:size(costs,1)
    for jj=1:size(costs,2)
        if ~isempty(costs{ii,jj})
            for kk=1:length(costs{ii,jj})
                N_aep(ii,jj,kk)=costs{ii,jj}(kk);
            end
        end
    end
end

%% B_{laep} generation
B_laep=GetPathLinkRel(G,"undirected",paths,path_num);

%% Output loading
topo.N_aep=N_aep;
topo.B_laep=B_laep;

end

