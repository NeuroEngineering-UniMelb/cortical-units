function r_inputs = get_relevant_inputs(table,inputs,output)
r_inputs = [];
for i = 1:length(inputs)
    sorted_table = sortrows(table(:,[inputs,output]),[inputs(i),inputs(1:(i-1)),inputs(i+1:end)]);
    with_i_off = sorted_table(1:(size(sorted_table,1)/2),length(inputs)+1);
    with_i_on = sorted_table((size(sorted_table,1)/2)+1:end,length(inputs)+1);
    if any(with_i_off~=with_i_on)
        r_inputs = [r_inputs,i];
    end
end