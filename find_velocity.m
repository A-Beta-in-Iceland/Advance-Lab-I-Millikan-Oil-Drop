list = dir('initialized_output');
len = length(list);
for l = 3:len
    imname = list(l).name;
    load(imname);
    [rise, fall] = velocity(out);
    name = [strtok(imname, '.'), '_velocity'];
    save(name, 'rise', 'fall');
    figure
    scatter(rise(:,1), rise(:, 2), 'r');
    hold on
    scatter(fall(:,1), fall(:,2), 'b');
    hold off
end