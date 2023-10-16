function [rise, fall] = velocity(input)
    time1 = input(1: end-1 ,1);
    time2 = input(2: end ,1);
    pos1 = input(1:end-1, 2);
    pos2 = input(2: end ,2);
    v = (pos2 - pos1) ./ (time2 - time1);
    mask_r = v > 0;
    mask_f = v < 0;
    v = [time1, v];
    rise = v(mask_r, :);
    fall = v(mask_f, :);
end