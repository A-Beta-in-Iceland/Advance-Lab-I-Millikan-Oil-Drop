function out = data_process(input)
    input(:, 2) = -1 * input(:,2);
    out = [];
    len = size(input);
    num = floor(floor(len(1)/100)./2) *2 - 1;
  for i = 1 : 100
    target = input(1+ (i-1) * num: i * num, :);
    time = target(:,1);
    pos = target(:, 2);
    pos_out = median(pos) .* ones([num, 1]);
    mask = pos == median(pos);
    time = time(mask);
    pos_out = pos_out(mask);
    output = [time, pos_out];
    out = [out; output];
  end

end