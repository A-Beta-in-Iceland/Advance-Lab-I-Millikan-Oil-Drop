list = dir('initialized_data');
len = length(list);
for l = 4:len
    imname = list(l).name;
    load(imname);
    out = data_process(newdata);
    name = [strtok(imname, '.'), '_processed'];
    save(name, 'out');
end