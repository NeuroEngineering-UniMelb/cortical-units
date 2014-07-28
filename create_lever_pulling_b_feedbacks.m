function [ext1,ext2,ext3] = create_lever_pulling_b_feedbacks
ext1 = zeros(6,4);
ext1(5,4) = 1;
ext2 = zeros(6,4);
ext2(6,4) = 1;
ext3 = zeros(6,4);
ext3(5:6,4) = 1;
