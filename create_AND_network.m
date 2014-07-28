function [units,connections] = create_AND_network(num)
units = zeros(2*num,3);
spacing = 1.0/num;
for i = 1:num
    x = (i-0.5)*spacing;
    units(i,:) = [x,0.25,1]; 
end
a = ceil(num/2);
vector = ones(num,1);
vector(a) = 0;
units(num+(1:num-1),:) = units(find(vector),:);
units(num+(1:num-1),2:3) = units(num+(1:num-1),2:3)+1;
units(end,:) = units(a,:);
units(end,2:3) = units(end,2:3)+2;
connections = cell(2*num,3);
for i = 1:num
    if i == a
        connections{i,3} = [(num+(1:num-1))',ones(num-1,1);size(units,1),1];
    elseif i < a
        connections{i,3} = [i+num,1];
    else
        connections{i,3} = [i+num-1,1];
    end
    if i < num
        connections{i+num,3} = [size(units,1),0];
        if i < a
            connections{i+num,2} = [i,0;a,1];
        else
            connections{i+num,2} = [i+1,0;a,1];
        end
    end
end
connections{end,2} = [(num+(1:num-1))',ones(num-1,1);a,1];

