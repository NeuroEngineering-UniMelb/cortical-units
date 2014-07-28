function all_activity = test_network(connections,external,duration)
if ~exist('duration','var') || isempty(duration)
    duration = 10;
end
all_activity = zeros(size(connections,1),duration+1);
all_ff_inputs = zeros(size(connections,1),duration+1);
all_fb_inputs = zeros(size(connections,1),duration+1);
for t = 1:duration % timestep of a half gamma oscillation
    i = t+1;
    if mod(t,2)
        ext = external(:,[2,4]);
    else
        ext = external(:,[1,3]);
        if t<3
            ext([1,3],2) = 1;
        end
    end
    [ff_in,fb_in] = get_fixed_inputs(all_activity(:,i-1),ext,connections);
    [ff_in,fb_in] = update_inputs(ff_in,fb_in,all_activity(:,i),connections);
    all_ff_inputs(:,i) = ff_in;
    all_fb_inputs(:,i) = fb_in;
    all_activity(:,i) = get_unit_activity(all_ff_inputs(:,i-1:i),all_fb_inputs(:,i-1:i));
    for j = 1:10
        [ff_in,fb_in] = update_inputs(ff_in,fb_in,all_activity(:,i),connections);
        if (all(ff_in==all_ff_inputs(:,i)) && all(fb_in==all_fb_inputs(:,i)))
            break
        end
        all_ff_inputs(:,i) = ff_in;
        all_fb_inputs(:,i) = fb_in;
        all_activity(:,i) = get_unit_activity(all_ff_inputs(:,i-1:i),all_fb_inputs(:,i-1:i));
        if (j==10)
            disp('Unstable!');
        end
    end
end

function activity = get_unit_activity(ff_ins,fb_ins)
activity = zeros(size(ff_ins,1),1);
for unit = 1:size(ff_ins,1)
    if (fb_ins(unit,1)==0 && fb_ins(unit,2)==1)
        if (ff_ins(unit,1)==0 && ff_ins(unit,2)==1)
            activity(unit,1) = 2;
        else
            activity(unit,1) = 1;
        end
    end
end

function [ff_in,fb_in] = update_inputs(ff_in,fb_in,curr_act,connections)
[ff_in_new,fb_in_new] = get_new_inputs(curr_act,connections);
ff_in = ff_in | ff_in_new;
fb_in = fb_in | fb_in_new;

function [ff_in,fb_in] = get_fixed_inputs(prev_act,ext,connections)
ff_in = zeros(size(connections,1),1);
fb_in = zeros(size(connections,1),1);
for target = 1:size(connections,1)
    ff_in(target,1) = ff_in(target,1) || (ext(target,1)==1) || (rand < ext(target,1));
    fb_in(target,1) = fb_in(target,1) || (ext(target,2)==1) || (rand < ext(target,2));
    [ff_in(target,1),fb_in(target,1)] = propagate_activity(ff_in(target,1),fb_in(target,1),prev_act,connections(target,:),1);
end

function [ff_in,fb_in] = get_new_inputs(curr_act,connections)
ff_in = zeros(size(connections,1),1);
fb_in = zeros(size(connections,1),1);
for target = 1:size(connections,1)
    [ff_in(target,1),fb_in(target,1)] = propagate_activity(ff_in(target,1),fb_in(target,1),curr_act,connections(target,:),0);
end

function [ff_in,fb_in] = propagate_activity(ff_in,fb_in,act,connections,d)
for j = 1:3
    for k = 1:size(connections{1,j},1)
        source = connections{1,j}(k,1);
        delay = connections{1,j}(k,2);
        if (delay==d)
            if j==1 % lateral
                fb_in = fb_in || (act(source,1)==2);
            elseif j==2 % feedforward
                ff_in = ff_in || (act(source,1)==2);
            elseif j==3 % feedback
                fb_in = fb_in || (act(source,1)>0);
            end
        end
    end
end
