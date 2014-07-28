clc

figure(1)
[units,connections] = create_lever_pulling_a_network;
plot_network(units,connections)
[ext1,ext2,ext3] = create_lever_pulling_a_feedbacks;
t1 = generate_truth_table_with_certain_feedback(connections,ext1,1:2,3:4,0,10);
t2 = generate_truth_table_with_certain_feedback(connections,ext2,1:2,3:4,0,10);
t3 = generate_truth_table_with_certain_feedback(connections,ext3,1:2,3:4,0,10);
r1 = [length(get_relevant_inputs(t1,1:2,3)),length(get_relevant_inputs(t1,1:2,4))];
r2 = [length(get_relevant_inputs(t2,1:2,3)),length(get_relevant_inputs(t2,1:2,4))];
r3 = [length(get_relevant_inputs(t3,1:2,3)),length(get_relevant_inputs(t3,1:2,4))];
table_a = [t1(:,1:2),t1(:,3:4)==2,t2(:,3:4)==2,t3(:,3:4)==2]
rinputs_a = [r1,r2,r3]

figure(2)
[units,connections] = create_lever_pulling_b_network;
plot_network(units,connections)
[ext1,ext2,ext3] = create_lever_pulling_b_feedbacks;
t1 = generate_truth_table_with_certain_feedback(connections,ext1,1:2,5:6,0,10);
t2 = generate_truth_table_with_certain_feedback(connections,ext2,1:2,5:6,0,10);
t3 = generate_truth_table_with_certain_feedback(connections,ext3,1:2,5:6,0,10);
r1 = [length(get_relevant_inputs(t1,1:2,3)),length(get_relevant_inputs(t1,1:2,4))];
r2 = [length(get_relevant_inputs(t2,1:2,3)),length(get_relevant_inputs(t2,1:2,4))];
r3 = [length(get_relevant_inputs(t3,1:2,3)),length(get_relevant_inputs(t3,1:2,4))];
table_b = [t1(:,1:2),t1(:,3:4)==2,t2(:,3:4)==2,t3(:,3:4)==2]
rinputs_b = [r1,r2,r3]

figure(3)
[units,connections] = create_lever_pulling_c_network;
plot_network(units,connections)
[ext1,ext2,ext3,ext4] = create_lever_pulling_c_feedbacks;
t1 = generate_truth_table_with_certain_feedback(connections,ext1,1:2,7:8,0,10);
t2 = generate_truth_table_with_certain_feedback(connections,ext2,1:2,7:8,0,10);
t3 = generate_truth_table_with_certain_feedback(connections,ext3,1:2,7:8,0,10);
t4 = generate_truth_table_with_certain_feedback(connections,ext4,1:2,7:8,0,10);
r1 = [length(get_relevant_inputs(t1,1:2,3)),length(get_relevant_inputs(t1,1:2,4))];
r2 = [length(get_relevant_inputs(t2,1:2,3)),length(get_relevant_inputs(t2,1:2,4))];
r3 = [length(get_relevant_inputs(t3,1:2,3)),length(get_relevant_inputs(t3,1:2,4))];
r4 = [length(get_relevant_inputs(t4,1:2,3)),length(get_relevant_inputs(t4,1:2,4))];
table_c = [t1(:,1:2),t1(:,3:4)==2,t2(:,3:4)==2,t3(:,3:4)==2,t4(:,3:4)==2]
rinputs_c = [r1,r2,r3,r4]

