function [ext1,ext2,ext3] = create_lever_pulling_a_feedbacks
ext1 = zeros(4,4);
ext1(3,4) = 1;
ext2 = zeros(4,4);
ext2(4,4) = 1;
ext3 = zeros(4,4);
ext3(3:4,4) = 1;
