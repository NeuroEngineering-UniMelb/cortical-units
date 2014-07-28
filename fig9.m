n = 100;

figure(1)
[perf_OR_2,~] = network_performance_with_all_noise_types('OR',0:0.05:0.5,n);
hold off
plot(0:0.05:0.5,perf_OR_2,'.')
hold on
fplot('(1-x)^5*(1-(1-(1-x)^3)^2)',[0 0.5])
fplot('(1-x)^2*(1-x^2)',[0 0.5])
fplot('(1-x)^5',[0 0.5])
fplot('(1-x)^2',[0 0.5])
fplot('1-(1-(1-x)^3)^2',[0 0.5])
fplot('1-x^2',[0 0.5])
xlabel('Noise, x')
ylabel('Performance')
title('OR (2 Inputs)')

figure(2)
[perf_OR_1,~] = network_performance_with_all_noise_types('OR_1',0:0.05:0.5,n);
hold off
plot(0:0.05:0.5,perf_OR_1,'.')
hold on
fplot('(1-x)^5*(1-(1-(1-x)^3)*(1-x*(1-x)^2))',[0 0.5])
fplot('(1-x)^3',[0 0.5])
fplot('(1-x)^5',[0 0.5])
fplot('(1-x)^2',[0 0.5])
fplot('(1-(1-(1-x)^3)*(1-x*(1-x)^2))',[0 0.5])
fplot('(1-x)^1',[0 0.5])
xlabel('Noise, x')
ylabel('Performance')
title('OR (1 Input)')

figure(3)
[perf_AND_NOT,~] = network_performance_with_all_noise_types('AND_NOT',0:0.05:0.5,n);
hold off
plot(0:0.05:0.5,perf_AND_NOT,'.')
hold on
fplot('(1-x)^8*(1-x*(1-x)^2)^2',[0 0.5])
fplot('(1-x)^3',[0 0.5])
fplot('(1-x)^5',[0 0.5])
fplot('(1-x)^2',[0 0.5])
fplot('(1-x)^3*(1-x*(1-x)^2)^2',[0 0.5])
fplot('(1-x)^1',[0 0.5])
xlabel('Noise, x')
ylabel('Performance')
title('AND NOT')

figure(4)
[perf_AND,~] = network_performance_with_all_noise_types('AND',0:0.05:0.5,n);
hold off
plot(0:0.05:0.5,perf_AND,'.')
hold on
xlabel('Noise, x')
ylabel('Performance')
title('AND')

