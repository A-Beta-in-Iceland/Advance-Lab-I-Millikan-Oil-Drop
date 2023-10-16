list = dir('Data/Data2');
len = length(list);

for l = 3:len
    imname = list(l).name;
    data = kalmanFilterForTracking(imname);
    v = VideoReader(imname);
    frame = readFrame(v);
    grid = findgrid(frame);
    %time in sec
    data(1,:) = data(1,:) ./ 30;
    %height in mm
    data(2, :) = data(2, :) .* 0.5 ./ grid;


    newdata = rmoutliers(data');
    new = num2cell(newdata);
    name = strtok(imname, '.')
    save(name, 'newdata')
    filename = [name, '.xlsx'];
    xlswrite(filename, new);
    
    figure;
    plot(newdata(:,1),newdata(:,2));
    title(name);
    xlabel('time (s)');
    ylabel('y-position (mm)')
end

