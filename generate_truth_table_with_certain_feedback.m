function table = generate_truth_table_with_certain_feedback(connections,feedback,inputs,outputs,phase,duration)
all_inputs = all_binary_vectors(length(inputs));

table = zeros(size(all_inputs,1),length(inputs)+length(outputs));
for i = 1:size(all_inputs,1)
    ext = zeros(size(connections,1),4);
    ext(inputs,1+phase) = all_inputs(i,:)';
    act = test_network(connections,ext + feedback,duration);
    row = [all_inputs(i,:),2*mean(act(outputs,end-1:end),2)'];
    table(i,:) = row;
end