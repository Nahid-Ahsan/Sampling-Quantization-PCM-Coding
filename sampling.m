clc; close all; clear all;
% ------------------------------------------------------------
%% Sampling
% Define Message Signal
x = @(t) sin(20*pi*t) + sin(100*pi*t) + sin(200*pi*t);
Fs = 500; %Sampling Frequency
t = 0:0.0001:0.1; % Time Grid
ts = 0:1/Fs:0.1; % Sampling Time Grid
xs = x(ts); % Sampled Signal
figure(1)
subplot(2,1,1), plot(t, x(t), 'linewidth', 1);
title('Sampling Process');
ylabel('Message signal, x(t)');
subplot(2,1,2), stem(ts, xs, '.', 'linewidth', 1.5);
ylabel('Sampled Message Signal, x_s(n)');
xlabel('Time (sec)')
saveas(gcf, 'mu_law_sampling.png');
% ------------------------------------------------------------
compressed = compand(xs,255,max(xs),'mu/compressor')
% ------------------------------------------------------------
%% Quantization (Rounding)
L = 32; b = log2(L); %Quantization Levels and bits
delta = (max(xs)-min(xs))/(L-1); % Quantization Step
xq = round(xs/delta)*delta; % Quantized Signal
SQNR = 10*log10(mean(xs.^2)/mean((xs-xq).^2));
disp(['SQNR = ', num2str(SQNR), ' dB']);
figure(2)
subplot(2,1,1), stem(ts, xs, '.', 'linewidth', 1.5);
title('Quantization Process');
ylabel('Sampled Signal, x_s(n)');
subplot(2,1,2), stem(ts, xq, '.', 'linewidth', 1.5);
ylabel('Quantized Signal, x_q(n)');
saveas(gcf, 'mu_law_quantize.png');
%% PCM Encoding
xb = de2bi(round((xq/delta)+(L/2))); %Assigning bits for each Q-level
xbs = reshape(xb, [1, length(xq)*b]); %PCM Bitstream
figure(3)
stairs(xbs, 'linewidth', 1);
title('PCM Encoding');
ylabel('PCM Bitstream');
xlim([0, length(xbs)+1]);
ylim([-0.05, 1.05]);
saveas(gcf, 'mu_law_encoding.png');
expanded = compand(xs,255,max(xs),'mu/expander')
% ------------------------------------------------------------
%% Reconstruction
xbr = reshape(xbs, [length(xbs)/b, b]);
xqr = bi2de(xbr) - L/2; % reconstructed quantized signal
xr = interp1(ts, xqr, t); % reconstructed message
 
figure(4)
subplot(2,1,1), stem(ts, xqr, '.', 'linewidth', 1.5);
title('Reconstructed Signal');
ylabel('Reconstructed x_q(n)');
subplot(2,1,2), plot(t, xr, 'linewidth', 1);
ylabel('Reconstructed Message Signal, x_r(t)');
xlabel('Time (sec)');
saveas(gcf, 'mu_law_reconstructed.png');
