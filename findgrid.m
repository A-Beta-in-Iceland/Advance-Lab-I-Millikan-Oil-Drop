function meanGridLineSpacing = findgrid(imagename)
    % clc;	% Clear command window.
    % clear;	% Delete all variables.
    % close all;	% Close all figure windows except those created by imtool.
    % workspace;	% Make sure the workspace panel is showing.
    fontSize = 18;
    markerSize = 20;
    LineWidth = 2;
    rgbImage = imagename;
    grayImage = rgbImage(:, :, 3);
    subplot(2, 2, 1);
    imshow(grayImage, []);
    axis('on', 'image');
    title('Blue Channel of Image', 'fontSize', fontSize);
    % Do the radon transform to get projections at a bunch of angles.
    theta = 0 : 359;
    r = radon(grayImage, theta);
    subplot(2, 2, 2);
    imshow(r, []);
    axis('on', 'image');
    title('Radon Transform', 'fontSize', fontSize);
    % find peak
    maxValue = max(r(:));
    [rows, cols] = find(r == maxValue);
    hold on;
    plot(cols, rows, 'r+', 'LineWidth', 2, 'markerSize', 17);
    theProfile = r(:, cols(1));
    subplot(2, 2, 3:4);
    plot(theProfile, 'b-', 'LineWidth', 2);
    grid on;
    [peakValues, indexes] = findpeaks(-theProfile, 'MinPeakProminence', 1500);
    hold on;
    plot(indexes, -peakValues, 'r+', 'LineWidth', 2, 'markerSize', 17);
    % Get the spacing between the peaks
    spacings = diff(indexes);
    % Get the mean grid spacing.
    meanGridLineSpacing = mean(spacings);
    caption = sprintf('Mean Grid Spacing = %.1f Pixels.', meanGridLineSpacing);
    title(caption, 'fontSize', fontSize);
end