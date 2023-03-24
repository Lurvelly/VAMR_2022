% Example of intensity resolution comparison
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

% Convert image from RGB to grayscale, and display it
B0 = rgb2gray(A);
figure, imshow(B0,[]), axis on


%% Create images of the same spatial resolution but with coarser intensity
% resolution, that is, where each pixel can be represented with fewer
% number of bits.
% Halve the number of intensity levels in each step.
B1 = bitshift(B0,-1);
B2 = bitshift(B0,-2);
B3 = bitshift(B0,-3);
B4 = bitshift(B0,-4);
B5 = bitshift(B0,-5);

% Display all images, and their resolution (axes)
figure('Name','Effect of reducing intensity resolution')
NumRows = 2;
NumCols = 3;
subplot(NumRows,NumCols,1), imshow(B0,[]), axis on, title('Num bits = 8. Num gray levels = 256')
subplot(NumRows,NumCols,2), imshow(B1,[]), axis on, title('Num bits = 7. Num gray levels = 128')
subplot(NumRows,NumCols,3), imshow(B2,[]), axis on, title('Num bits = 6. Num gray levels = 64')
subplot(NumRows,NumCols,4), imshow(B3,[]), axis on, title('Num bits = 5. Num gray levels = 32')
subplot(NumRows,NumCols,5), imshow(B4,[]), axis on, title('Num bits = 4. Num gray levels = 16')
subplot(NumRows,NumCols,6), imshow(B5,[]), axis on, title('Num bits = 3. Num gray levels = 8')

return % Stop running the script



%% More efficiently, iterating using a 'for' loop.
% Get lower intensity resolution images by dividing by 2 (shifting one bit
% in binary representation) each level of the "pyramid".
% It is not really a pyramid, but the same code from the previous script works.
NumLevels = 6;
Pyramid{1} = B0;
figure('Name','Effect of reducing intensity resolution')
NumRows = 2;
NumCols = 3;
subplot(NumRows,NumCols,1), imshow(Pyramid{1},[]), axis on
title('Num bits = 8. Num gray levels = 256')
for k=1:NumLevels-1
    Pyramid{k+1} = bitshift(Pyramid{k}, -1);
    subplot(NumRows,NumCols,k+1), imshow(Pyramid{k+1},[]), axis on
    title(['Num bits = ' num2str(8-(k-1)) '. Num gray levels = ' num2str(2^(8-(k-1)))])
end
