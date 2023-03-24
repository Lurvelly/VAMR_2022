% Example of filtering 1-D signals
%
% Guillermo Gallego

% You can run the entire script by pressing the F5 key
% Or, you can evaluate one or more lines by selecting them and pressing the
% F9 key (without needing to copy them to the prompt in the Command Window)

clear all % clear all variables in the workspace
close all % close all figures
clc       % clear the command window

% Generate a signal, for example, a sine wave + constant DC component
L = 1;    % Length of the interval [0,L]
N = 200;  % Number of samples in the interval
k0 = 3;   % Which multiple of the base frequency of the interval
x = linspace(0,L,N);  % Samples in the horizontal axis
y = 2.0 + sin(k0*2*pi/L*x); % Signal samples

% Display signal
figID = figure;
plot(x,y)
xlabel('X'), ylabel('Y')
grid % Show a grid of horizontal and vertical dotted lines in the plot

% Add noise (random, Gaussian) to the signal
sigma = 0.2; % Standard deviation of the noise amplitude
noise = sigma*randn(size(y)); % randn draws random samples from a standard Gaussian distribution
y_noisy = y + noise; % Noisy signal

% Display the noisy signal in the same plot as the "clean" one
figure(figID), hold on, plot(x,y_noisy,'c'), hold off 


%% Filter the signal. Noise removal by smoothing using a linear filter

% Weighted running average
filterSize = 11; 
% Choose a filter:
% h = ones(filterSize,1) / filterSize;    % Rectangular / box filter
h = gausswin(filterSize);               % Gaussian filter

h = h / sum(h); % Coefficents add up to 1 so that mean intensity level is unchanged by filtering
figure, plot(1:filterSize,h,'-o')
title('Filter samples (i.e., the "impulse response" of the filter)')

y_filtered = filter(h,1, y_noisy);

% Alignment: remove the delay caused by zero initial conditions 
% (Need to wait for the filter to have a minimum of input data samples)
delay = round((filterSize-1)/2);
figure(figID), hold on 
plot(x(1+delay:N-delay),y_filtered(filterSize:N),'k')
hold off
legend('Original','Noisy','Filtered')


%% Frequency interpretation (optional)
N_fft = 2^ceil(log2(N)) * 4;    % Number of points used in the Discrete Fourier Transform (DFT, FFT)
Y = fft(y, N_fft);              % Fourier Transform of the original
H = fft(h.', N_fft);            % Fourier Transform of the filter
Y_noisy = fft(y_noisy, N_fft);  % Fourier Transform of the noisy signal
Y_filt = Y_noisy .* H;          % Product of Fourier Transforms

% Show only the positive part of the spectrum due to symmetry
f_axis_positive = (0 : N_fft/2) / N_fft;
idx = 1:(N_fft/2+1);
%figure, semilogy(f_axis_positive, abs(Y(idx)))
figure,semilogy(f_axis_positive, abs(Y_noisy(idx)),'c')
xlabel('Normalized frequency. Nyquist frecuency is 1.0')
title('Amplitude of the spectrum (Fourier Transform), in logarithmic scale')
hold on
semilogy(f_axis_positive, abs(H(idx)),'g')
semilogy(f_axis_positive, abs(Y_filt(idx)), 'k')
hold off
legend('Noisy','Filter transfer function','Filtered')

% Filter in the frequency domain: multiply Fourier Transforms of input and
% the filter, and then compute the inverse Fourier Transform of the result. 
y_filt = real( ifft(Y_filt,N_fft) );
figure(figID)
hold on
plot(x(1+delay:N-delay), y_filt(filterSize:N), 'm-.')
hold off
legend('Original','Noisy','Filtered', 'Filtered (inverse FFT)')
