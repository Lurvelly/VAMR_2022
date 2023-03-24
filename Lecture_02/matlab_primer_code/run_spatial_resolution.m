% Example of spatial resolution comparison
%
% Guillermo Gallego

% You can run the entire script by pressing the F5 key
% Or, you can evaluate one or more lines by selecting them and pressing the
% F9 key (without needing to copy them to the prompt in the Command Window)

clear all % clear all variables in the workspace
close all % close all figures
clc       % clear the command window

% Read an image from file
%filename = 'tiger.jpg';
%filename = 'ramp.jpg';
filename = 'lena.bmp';
A = imread(filename);

% Get the image dimensions
Height = size(A,1);  % Height is the number of rows
Width  = size(A,2);  % Width is the number of columns

% Display image
figure, imshow(A,[])
axis on % Turn on axes tickmarks to see the image dimensions (resolution)

% Convert image from RGB to grayscale, and display it
B0 = rgb2gray(A);
figure, imshow(B0,[]), axis on


%% Create smaller (coarser) images, using imresize, 
% by halving the image dimensions in each step.
B1 = imresize(B0,1/2);
B2 = imresize(B0,1/4);
B3 = imresize(B0,1/8);
B4 = imresize(B0,1/16);
B5 = imresize(B0,1/32);

% Display all images, and their resolution (axes)
figure('Name','Effect of reducing spatial resolution')
NumRows = 2;
NumCols = 3;
subplot(NumRows,NumCols,1), imshow(B0,[]), axis on
subplot(NumRows,NumCols,2), imshow(B1,[]), axis on
subplot(NumRows,NumCols,3), imshow(B2,[]), axis on
subplot(NumRows,NumCols,4), imshow(B3,[]), axis on
subplot(NumRows,NumCols,5), imshow(B4,[]), axis on
subplot(NumRows,NumCols,6), imshow(B5,[]), axis on

return % Stop running the script



%% More efficiently, iterating using a 'for' loop.
% Get coarser images from the finest pyramid level.
NumLevels = 6;
Pyramid{1} = B0;
figure('Name','Effect of reducing spatial resolution')
NumRows = 2;
NumCols = 3;
subplot(NumRows,NumCols,1), imshow(Pyramid{1},[]), axis on
for k=1:NumLevels-1
    Pyramid{k+1} = imresize(B0, 1/(2^k));
    subplot(NumRows,NumCols,k+1), imshow(Pyramid{k+1},[]), axis on
end



%% Almost the same result.
% Get coarser images from consecutive pyramid levels.
NumLevels = 6;
Pyramid{1} = B0;
figure('Name','Effect of reducing spatial resolution')
NumRows = 2;
NumCols = 3;
subplot(NumRows,NumCols,1), imshow(Pyramid{1},[]), axis on
for k=1:NumLevels-1
    Pyramid{k+1} = imresize(Pyramid{k}, 1/2);
    subplot(NumRows,NumCols,k+1), imshow(Pyramid{k+1},[]), axis on
end
