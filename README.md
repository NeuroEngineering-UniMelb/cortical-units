Cortical Unit Model
=====================

A sample of the code used in the study: 

> Kerr RR, Grayden DB, Thomas DA, Gilson M, and Burkitt AN (2014). "Goal-directed control with cortical units that are gated by both top-down feedback and oscillatory coherence." Front. Neural Circuits, 8: 94. 

Run `fig6.m` to generate figures showing the three networks in Figure 6A, C, and E and outputs corresponding to the three tables in Figure 6B, D, and F.  

Run `fig9.m` to generate the four plots in Figure 9. 

### Notes:

- Each of the functions `create_*_network.m` return two outputs (`units` and `connections`), which can be viewed with `plot_network(units,connections)`.
- Each of the functions `text_network.m` and `text_network_with_stochastic_externals.m` contain the logic of the model presented in this study (the latter is modified slightly to accomodate stochastic inputs). 
- Each of the functions `generate_truth_table.m` and `generate_truth_table_with_certain_feedback.m` simulate networks with all possible input combinations in order to create truth tables, such as those in Figure 6. 
- The function `get_relevant_inputs.m` determines which inputs are relevant in determining the value of a certain output. 
- The function `network_performance_with_all_noise_types.m` runs `network_performance_with_noise.m` with the six different noise types that were considered. 
- The function `network_performance_with_noise.m` simulates a network `n` times (via `trial_inputs_on_motif_networks.m`) for different noise levels to determine how frequently the network is able to perform its operation successfully. 

