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


%% Display Hue-Saturation wheel
% r = linspace(0,1,32);
% theta = linspace(-pi,pi,180);
% [rg, thg] = meshgrid(r,theta);
% %theta_unit = theta/(2*pi)+0.5;
% %[x,y] = pol2cart(thg,rg);
% thg_unit = thg/(2*pi)+0.5;
% hsv_grid = cat(3, thg_unit, rg, ones(size(rg)));
% rgb_grid = hsv2rgb(hsv_grid);
% %figure, imshow(rgb_grid,[])
% 
% rMin = 0; rMax = 1;
% Mr = 200; Nr = Mr;
% im(:,:,1) = PolarToIm(rgb_grid(:,:,1).', rMin, rMax, Mr, Nr);
% im(:,:,2) = PolarToIm(rgb_grid(:,:,2).', rMin, rMax, Mr, Nr);
% im(:,:,3) = PolarToIm(rgb_grid(:,:,3).', rMin, rMax, Mr, Nr);
% figure('color','white'); imshow(im,[])


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
%h_LoG = fspecial('log',31,6);
% Visualize the filter mask as an elevation map, in 3-D
figure('color','white'), mesh(h_LoG), axis vis3d, title('Laplacian of Gaussian')
f_LoG = imfilter(f,h_LoG,'replicate');
figure('Name','Filtered image: Laplacian of Gaussians'), imshow(f_LoG,[])

% Find edges by zero crossings of the output
figure, contour(f_LoG,[0,0],'Color','k'), axis ij equal tight

% Find edges by zero crossings of the filtered image using the 'edge' function
BW = edge(f,'zerocross',0.01,h_LoG);
figure, imshow(1-BW,[])


%% LoG approximated by a Difference of Gaussians (Band-pass filter)
% sigma1 = 5;
% sigma2 = 1.6 * sigma1;
% h_size = 2*ceil(3*sigma2)+1;
% g1 = fspecial('gaussian',h_size,sigma1);
% g2 = fspecial('gaussian',h_size,sigma2);
% h_DoG_LoG = g2-g1;
% 
% % Plot two Gaussians and the reslting DoG
% figure('color','white')
% subplot(1,3,1), mesh(g2), title('Gaussian G2')
% axis tight, zlim([0,max(g1(:))]), axis vis3d, view([-28,22])
% subplot(1,3,2), mesh(g1), title('Gaussian G1')
% axis tight, zlim([0,max(g1(:))]), axis vis3d, view([-28,22])
% subplot(1,3,3), mesh(g2-g1), title('Difference (DoG) G2-G1')
% axis tight, axis vis3d, view([-28,22])
% 
% sigma_LoG = 1.25 * sigma1;
% h_LoG = fspecial('log',h_size,sigma_LoG);
% 
% % Measure the relative approximation error between unitized kernels
% h_LoG = h_LoG/norm(h_LoG(:));
% h_DoG_LoG = h_DoG_LoG/norm(h_DoG_LoG(:));
% err_approx = h_LoG - h_DoG_LoG;
% rel_err = norm(err_approx,'fro') / norm(h_DoG_LoG,'fro');
% disp(['Relative Frobenius approximation error = ' num2str(rel_err)]);
% 
% % Plot LoG, DoG approximation and error
% figure('color','white')
% subplot(1,3,1), mesh(h_LoG), title('LoG kernel')
% axis tight, axis vis3d, view([-28,22])
% subplot(1,3,2), mesh(h_DoG_LoG), title('LoG approx by DoG')
% axis tight, axis vis3d, view([-28,22])
% subplot(1,3,3), mesh(err_approx), title('Difference')
% axis tight, axis vis3d, view([-28,22])


%% MATLAB's edge function
BW = edge(f,'sobel',20);
%BW = edge(f,'log',2.0);
%BW = edge(f,'canny',0.25);
figure, imshow(-BW,[])
