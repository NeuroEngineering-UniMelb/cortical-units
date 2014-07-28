function plot_line(type,values,c,w)
if ~exist('w','var')
    w = 0.5;
end
if type == 'y'
    for i = 1:length(values)
        plot(xlim(),values(i)*ones(1,2),c,'LineWidth',w);
        hold on
    end
elseif type == 'x'
    for i = 1:length(values)
        plot(values(i)*ones(1,2),ylim(),c,'LineWidth',w);
        hold on
    end
end