% Example of image filtering and noise removal
%
% Guillermo Gallego

% You can run the entire script by pressing the F5 key
% Or, you can evaluate one or more lines by selecting them and pressing the
% F9 key (without needing to copy them to the prompt in the Command Window)

clear all % clear all variables in the workspace
close all % close all figures
clc       % clear the command window

% Read an image from file
filename = 'tiger.jpg';
%filename = 'lena.bmp';
A = imread(filename);

% Convert image from RGB to grayscale
f = rgb2gray(A);


%% Filter the image
hsize = 21;  % Filter size (in pixels). Odd number to avoid shifted output
hsigma = 5;  % Gaussian width of the filter (in pixels)
h = fspecial('gaussian', hsize, hsigma); % Create filter mask or kernel

figure, mesh(h) % Visualize the filter (as an elevation map z(x,y) )

g = imfilter(f,h,'replicate');
figure('Name','Original image'), imshow(f,[])
figure('Name','Filtered (blurred) image'), imshow(g,[])


%% Add noise to the image and filter it

sigma = 10; % Standard deviation of the noise, in the units of f, i.e., intensity levels.
f_noisy = double(f) + sigma*randn(size(f));
figure('Name','Noisy image'), imshow(f_noisy,[])

hsize = 5;   % Filter size (in pixels). Odd number to avoid shifted output
hsigma = 2;  % Gaussian width of the filter (in pixels)
h = fspecial('gaussian', hsize, hsigma); % Create filter mask or kernel

% g = filter2(h,f_noisy);
% figure('Name','Noisy image, filtered [filter2]'), imshow(g,[])

gg = imfilter(f_noisy,h,'replicate');
figure('Name','Noisy image, filtered [imfilter]'), imshow(gg,[])


disp('Removal of additive noise');
% Measure quality of cleaned image (against the original image):
rel_err_gg = norm(double(gg)-double(f),'fro') / norm(double(f),'fro');
disp(['Relative error (Gaussian filter) = ' num2str(100*rel_err_gg) ' %']);
disp(' ');


%% Add salt & pepper noise and filter it
PercetageNoisyPix = 10.;
f_sp = imnoise(f,'salt & pepper', 10/100); % input must be uint8, not double

% % Alternative method to add salt & pepper noise
% noise_uniform = rand(size(f));
% f_sp = f;
% PercetageNoisyPix = 10.;
% f_sp( noise_uniform > (1-PercetageNoisyPix/100/2) ) = 255; % salt pixels (white)
% f_sp( noise_uniform < PercetageNoisyPix/100/2 ) = 0; % pepper pixels (black)

figure('Name','Noisy (salt & pepper) image'), imshow(f_sp,[])

% Filter using a linear filter (Gaussian)
g = imfilter(f_sp,h,'replicate');
figure('Name','Noisy (salt & pepper) image, Gaussian-filtered'), imshow(g,[])

% Filter using a non-linear filter (median)
gm = medfilt2(f_sp, [3 3]);
figure('Name','Noisy (salt & pepper) image, median-filtered'), imshow(gm,[])

% Measure quality of cleaned image (against the original image):
disp('Removal of Salt & pepper noise');

rel_err_g = norm(double(g)-double(f),'fro') / norm(double(f),'fro');
disp(['Relative error (Gaussian filter) = ' num2str(100*rel_err_g) ' %']);

rel_err_gm = norm(double(gm)-double(f),'fro') / norm(double(f),'fro');
disp(['Relative error (Median) = ' num2str(100*rel_err_gm) ' %']);

% -20*log10(rel_err_g)
% -20*log10(rel_err_gm)
