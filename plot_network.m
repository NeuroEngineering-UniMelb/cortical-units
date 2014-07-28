function plot_network(units,connections)
marker_size = 30;
hold off
shortness1 = 0.2;
shortness2 = 0.7;
if exist('connections','var')
    c = ['g','b','r'];
    for i = 1:size(connections,1)
        for j = 1:size(connections,2)
            for k = 1:size(connections{i,j},1)
                have_states = (size(units,2) > 3);
                from_on = units(connections{i,j}(k,1),end)>=5;
                from_searching = ~from_on && units(connections{i,j}(k,1),end)>=3;
                to_on = units(i,end)>0;
                if have_states
                    if ~(from_on && to_on)
                        if ~(from_searching && (j==3) && to_on)
                            continue
                        end
                    end
                end
                n0 = units(connections{i,j}(k,1),:);
                n1 = units(i,:);
                if connections{i,j}(k,2) == 1
                    quiver(n0(1),n0(2),1.1*(n1(1)-n0(1)),1.1*(n1(2)-n0(2)),c(j));
                else
                    quiver(n0(1)+shortness1*(n1(1)-n0(1)),n0(2)+shortness1*(n1(2)-n0(2)),shortness2*(n1(1)-n0(1)),shortness2*(n1(2)-n0(2)),c(j));
                end
                hold on
            end
        end
    end
end
if size(units,2) == 3
    plot(units(:,1),units(:,2),'b.','MarkerSize',marker_size)
elseif size(units,2) > 3
    states = [0,1,2,3,4,5,6];
    c = [0,0,0; 0,0,1; 0,0,0.5; 1,0,0; 0.5,0,0; 0,1,0; 0,0.5,0];  
    for i = 1:length(states)
        h = plot(units(units(:,end)==states(i),1),units(units(:,end)==states(i),2),'.','MarkerSize',marker_size);
        set(h,'Color',c(i,:));
        hold on
    end
end
xlim([0 1])
ylim([0 (max(units(:,3))-0.5)])
for i = 1:(max(units(:,3))-1)
    hold on
    plot_line('y',i-0.25,'k--')
end
axis off
hold off

