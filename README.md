# Sampling-Quantization-PCM-Coding
To understand the basics of sampling, quantization &amp; PCM encoding/decoding. And simulate the complete sampling process in both companded and uncompanded version of message and thus realize the importance of compansion in sampling process.


# Introduction
Most signals of practical interest, such as speech, biological signals, communication signals etc.
are analog. These signals must be processed for different purposes. Digital signal processing of an
analog signal is preferable to processing the signals directly in the analog domain because of its
flexibility in reconfiguration, better accuracy in control, better storing capability and cost
effectiveness. That’s why the analog signals are to be converted into corresponding digital domain
for the purpose of processing. The analog signals are converted into digital signals through
sampling, quantization and encoding.


# Theory
Analog to digital conversion (A/D) process consists of the following modules.
![](https://github.com/Nahid-Ahsan/Sampling-Quantization-PCM-Coding/blob/master/Block_Diagram.PNG)

# Sampling
In this section, a continuous time signal is converted into a discrete time signal by taking samples
at discrete time instants. The analog signal is sampled once every Ts seconds, resulting in a sampled
data sequence. The sampler is assumed to be ideal so that the value of the signal at an instant (an
infinitely small time) is sampled. The most important parameter in the sampling process is the
sampling period Ts or the sampling frequency or sampling rate, which is defined as fs = 1/Ts.
Sampling frequency is given in units of ‘samples per second’ or ‘Hertz’.

## Sampling Theorem
For successful reconstruction of the sampled signal, the sampling frequency must be equal to or
greater than the twice time of the highest frequency component of the original signal. Otherwise
the signal cannot be successfully recovered. If a continuous time signal contains no frequency
components higher than BM Hz, then it can be completely determined by uniform samples taken
at a rate of Fs samples per second if Fs ≥ 2BM. If the sampling rate satisfies this condition, the
reconstruction of the signal can be done by simple low pass filtering only.

# Quantization
In this section, a discrete time continuous-valued signal is converted into a discrete-time discretevalued
(digital) signal. The value of each signal sample is represented by a value selected from a
finite set of possible values. The quantizer assigns each sample of to the nearest quantization level
by either rounding or truncation.


Quantization Noise and SQNR:
Let xq(n) is the quantized version of x(n) and Δ is the quantization step, then the average power
of quantization noise can be derived as,
![](https://latex.codecogs.com/gif.latex?%5CLARGE%20%5Csigma%20_%7Bnq%7D%5E%7B2%7D%3D%20E%5Bx_%7Bq%7D%28n%29%20-%20x%28n%29%5D%20%3D%20%5Cfrac%7B%5CDelta%5E%7B2%7D%7D%7B12%7D%20%3D%20%5Cfrac%7BV_%7Bm%7D%5E%7B2%7D%7D%7B3L%5E%7B2%7D%7D)
Where, the quantization step, Δ = 2Vm/L, where Vm = Amplitude of the sinusoidal message
signal, L = number of quantization level.
