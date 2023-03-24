% Example of image enhancement by sharpening
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
f = double( rgb2gray(A) );


%% Sharpening, general method

% Create sharpen kernel as ( Identiy + alpha * detail )
alpha = 0.6;    % Weight of the detail added to the original image
sigma = 4;      % Standard deviation of Gaussian filter (in pixels)
W = ceil(3*sigma); % Half of the kernel size
h_size = 2*W+1; 
h_smooth = fspecial('gaussian', h_size, sigma);
h_sharpen = -alpha * h_smooth;
h_sharpen(W,W) = h_sharpen(W,W) + (1+alpha);

% Filter the image
f_sharp = imfilter(f,h_sharpen,'replicate');
figure('Name','Unsharpened image'), imshow(f,[0,255])
figure('Name','Sharpened image'), imshow(f_sharp,[0,255])

% Show the detail that was added to the image to sharpen it.
% Create filter kernel
h_detail = - h_smooth;
h_detail(W,W) = h_detail(W,W) + 1;

% Filter the input image
f_detail = imfilter(f,h_detail,'replicate');
figure('Name','Detail added to sharpen the image'), imshow(f_detail,[])


%% Sharpening by adding the negative Laplacian of Gaussians (LoG)
% Create sharpen kernel as ( Identiy - alpha * LoG )
alpha = 3;  % Weight of the detail added to the original image
sigma = 2;  % Parameter of the LoG filter
W = ceil(3*sigma); % Half of the kernel size
h_size = 2*W+1;
h_sharpen = -alpha * fspecial('log',h_size,sigma);
h_sharpen(W,W) = h_sharpen(W,W) + 1;

% Filter the image
f_sharp = imfilter(f,h_sharpen,'replicate');
figure('Name','Unsharpened image'), imshow(f,[0,255])
figure('Name','Sharpened image using Laplacian of Gaussians'), imshow(f_sharp,[0,255])
