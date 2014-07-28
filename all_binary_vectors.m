function out = all_binary_vectors(len,num)
if len > 20
    disp('Cannot handle binary vectors this long');
    return
end
out = dec2bin(0:(2^len-1))=='1';
if exist('num','var') && (num < size(out,1))
    out = choose(out,num);
end