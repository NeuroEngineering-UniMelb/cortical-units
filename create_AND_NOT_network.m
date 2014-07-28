function [units,connections] = create_AND_NOT_network(num)
units = zeros(num+1,3);
spacing = 1.0/num;
for i = 1:num
    x = (i-0.5)*spacing;
    units(i,:) = [x,0.25,1]; 
end
units(end,:) = [0.5,1.25,2];
connections = cell(num+1,3);
for i = 1:num
    connections{i,3} = [size(units,1),1];
end
connections{end,2} = [1,1;(2:num)',zeros(num-1,1)];

