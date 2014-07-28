function [performances,stddev] = network_performance_with_all_noise_types(network_type,noise,n)
performances = zeros(6,length(noise));
stddev = zeros(6,length(noise));
disp('-> both / all');
[performances(1,:),stddev(1,:)] = network_performance_with_noise(network_type,'both','all',noise,n);
disp('-> peak / all');
[performances(2,:),stddev(2,:)] = network_performance_with_noise(network_type,'peak','all',noise,n);
disp('-> both / fb-only');
[performances(3,:),stddev(3,:)] = network_performance_with_noise(network_type,'both','fb-only',noise,n);
disp('-> peak / fb-only');
[performances(4,:),stddev(4,:)] = network_performance_with_noise(network_type,'peak','fb-only',noise,n);
disp('-> both / ff-only');
[performances(5,:),stddev(5,:)] = network_performance_with_noise(network_type,'both','ff-only',noise,n);
disp('-> peak / ff-only');
[performances(6,:),stddev(6,:)] = network_performance_with_noise(network_type,'peak','ff-only',noise,n);

