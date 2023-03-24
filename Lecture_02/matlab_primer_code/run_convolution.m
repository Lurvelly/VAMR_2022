% Example of computing 1-D convolution
%
% Guillermo Gallego

% You can run the entire script by pressing the F5 key
% Or, you can evaluate one or more lines by selecting them and pressing the
% F9 key (without needing to copy them to the prompt in the Command Window)

clear all % clear all variables in the workspace
close all % close all figures
clc       % clear the command window

% Convolution example
Na = 10;
x = linspace(0,1,Na);
a = 1.1*exp(-2*abs(x));
b = ones(1,2*Na);
c = conv(a,b);

figure, 
subplot(3,1,1), plot(a,'-o'), title('Input signal a')
subplot(3,1,2), plot(b,'-o'), title('Input signal b')
subplot(3,1,3), plot(c,'-o'), title('Convolution: a * b')


%% Display an animated movie of the convolution operation
a_rev = fliplr(a);
Nb = numel(b);
length_result = Na + Nb - 1;
xa = -Na;
xb = length_result + Na;

figID = figure;
subplot(3,1,1), stem(a,'.'), xlim([xa,xb]), title('Input signal a')
subplot(3,1,2), 
subplot(3,1,3), title('Convolution: a * b')
b_tmp = [zeros(1,Na), b, zeros(1,Na)]; % zero-pad b to model when the signals do not fully overlap
result = zeros(1,length_result); % avoid dynamic memory allocation
for k=1:(Na+Nb-1)
    figure(figID)
    % Compute one sample of the convolution
    result(k) = sum( a_rev.*b_tmp((1:Na)+k) );
    
    % Display result
    subplot(3,1,2), stem(b,'.')
    hold on, stem((1:Na)+(k-Na), a_rev,'r.'), hold off
    xlim([xa,xb])
    title('Input signal b and reversed & shifted signal a')
%     
    subplot(3,1,3), hold on, stem(k,result(k),'.'), hold off
    xlim([xa,xb])
    
    if (k==1)
        pause(0.5)
    end
    pause(0.4) % Wait some time (in units of seconds)
end

% Measure the error between the two ways we computed the convolution:
error_ = norm(c-result);
disp(['Error between convolution computations = ' num2str(error_)]);


%% Convolution as the product of the coefficients of two polynomials:
p_coeffs = [1,-2,3]     % polynomial x^2 -2*x +3
q_coeffs = [2,5]        % polynomial 2*x +5
pq_coeffs = conv(p_coeffs, q_coeffs) % multiply polynomials

