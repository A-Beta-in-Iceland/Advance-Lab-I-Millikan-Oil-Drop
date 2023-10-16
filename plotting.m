list = dir('initialized_output');
len = length(list);
for l = 3:len
    imname = list(l).name;
    display(imname)
    load(imname);
    name = strtok(imname, '.');
    figure;
    plot(out(:,1), out(:,2));
end

xlabel('time (s)')
ylabel('vertical position (mm)')