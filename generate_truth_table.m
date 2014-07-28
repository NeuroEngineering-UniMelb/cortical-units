function table = generate_truth_table(connections,inputs,outputs,phase,duration,type)
all_inputs = all_binary_vectors(length(inputs));
if ~exist('type','var') || isempty(type) || strcmp(type,'all_on')
    all_outputs = ones(1,length(outputs));
elseif strcmp(type,'all_possible_outputs')
    all_outputs = all_binary_vectors(length(outputs));
else
    disp('Unknown type.');
    table = [];
    return
end

table = zeros(size(all_inputs,1)*size(all_outputs,1),length(inputs)+2*length(outputs));
for i = 1:size(all_inputs,1)
    for j = 1:size(all_outputs,1)
        ext = zeros(size(connections,1),4);
        ext(inputs,1+phase) = all_inputs(i,:)';
        ext(outputs,3) = 2*all_outputs(j,:)';
        act = test_network(connections,ext,duration);
        row = [all_inputs(i,:),all_outputs(j,:),2*mean(act(outputs,end-1:end),2)'];
        table(i+(j-1)*size(all_inputs,1),:) = row;
    end
end