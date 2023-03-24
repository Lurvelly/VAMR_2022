% Example of edge detection by filtering
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


%% Edge detection

% Create filter masks
h_horiz_edges = fspecial('sobel');
h_vert_edges = h_horiz_edges.';

% Filter the input image
g_h = imfilter(f,h_horiz_edges,'replicate');
g_v = imfilter(f,h_vert_edges,'replicate');
figure('Name','Filtered image: horizontal edges'), imshow(g_h,[])
figure('Name','Filtered image: vertical edges'), imshow(g_v,[])

% Edge strength
g_grad = sqrt( g_h.^2 + g_v.^2 );
figure('Name','Edge strength'), imshow(g_grad,[])  % Zero = black
figure('Name','Edge strength'), imshow(-g_grad,[]) % Zero = white

% Edge direction (angle)
g_ang = atan2(g_v,g_h);
figure('Name','Edge direction'), imshow(g_ang,[])

% Combine gradient magnitude and direction into a single image.
% Normalize for color coding
g_grad_unit = g_grad/max(g_grad(:));
g_ang_unit = g_ang/(2*pi)+0.5;
hsv_img = cat(3, g_ang_unit, g_grad_unit, ones(size(g_ang)));
rgb_edges = hsv2rgb(hsv_img);
figure, imshow(rgb_edges,[])


%% Edge detection using derivatives of Gaussians
% Create kernels with derivatives of a 2-D Gaussian
sigma = 2;
W = ceil(3*sigma); % Half of the kernel size
[u,v] = meshgrid(-W:W,-W:W);
dG_v = -u .* exp(-(u.^2 + v.^2)/(2*sigma^2)); % Derivative in u direction emphasizes vertical edges
dG_h = -v .* exp(-(u.^2 + v.^2)/(2*sigma^2)); % Derivative in v direction emphasizes horizontal edges

% Visualize the kernels
figure('color','white'), mesh(dG_v), axis vis3d, title('Derivative of Gaussian, horizontal direction')
figure('color','white'), mesh(dG_h), axis vis3d, title('Derivative of Gaussian, vertical direction')

% Filter the input image
g_v = imfilter(f,dG_v,'replicate');
g_h = imfilter(f,dG_h,'replicate');
figure('Name','Filtered image: Derivative of Gaussian, vertical edges'), imshow(g_v,[])
figure('Name','Filtered image: Derivative of Gaussian, horizontal edges'), imshow(g_h,[])

% Edge strength
g_grad = sqrt( g_h.^2 + g_v.^2 );
figure('Name','Edge strength'), imshow(g_grad,[])  % Zero = black
figure('Name','Edge strength'), imshow(-g_grad,[]) % Zero = white

% Edge direction (angle)
g_ang = atan2(g_v,g_h);

% Combine gradient magnitude and direction into a single image.
% Normalize for color coding
g_grad_unit = g_grad/max(g_grad(:));
g_ang_unit = g_ang/(2*pi)+0.5;
hsv_img = cat(3, g_ang_unit, g_grad_unit, ones(size(g_ang)));
rgb_edges = hsv2rgb(hsv_img);
figure, imshow(rgb_edges,[])


%% Laplacian of Gaussians
%h_LoG = fspecial('log',19,4);
h_LoG = fspecial('log',25,5);
% Visualize the filter mask as an elevation map, in 3-D
figure('color','white'), mesh(h_LoG), axis vis3d, title('Laplacian of Gaussian')
f_LoG = imfilter(f,h_LoG,'replicate');
figure('Name','Filtered image: Laplacian of Gaussians'), imshow(f_LoG,[])

% Find edges by zero crossings of the output
figure, contour(f_LoG,[0,0],'Color','k'), axis ij equal tight

% Find edges by zero crossings of the filtered image using the 'edge' function
BW = edge(f,'zerocross',0.01,h_LoG);
figure, imshow(1-BW,[])


%% MATLAB's edge function
BW = edge(f,'sobel',20);
%BW = edge(f,'log',2.0);
%BW = edge(f,'canny',0.25);
figure, imshow(-BW,[])
