% Copyright 2025 Rahul Mushini, Jonathan Guimaraes Ribeiro, Aidan Colgan,
% Rana Bogrekci, Michael John Codd, Miriam Leeser,  John Dooley
% 
% Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
% documentation files (the “Software”), to deal in the Software without restriction, including without limitation 
% the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, 
% and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
% 
% The above copyright notice and this permission notice shall be included in all copies or substantial portions 
% of the Software.
% 
% THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
% TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
% THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
% CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS 
% IN THE SOFTWARE.

%First clear the workspace
clear all; close all; clc

%Choose constellation points; similar to result of log2(M) in other code
Constellation_Point = 64; 

%Ammount of valid data points
Data_Points = 8130;%104; %subcarriers

%Size of each ofdm block-> null and full data points
Frequency_Bins = 10e3; %2^7; 

%Sampling frequency which decides the bandwidth
fs = 122.88e6;
fcs = fs*8;

%This function simplifies resampling
[l,m] = rat(fs/fcs);

%Generate random data
Data_Source = randsrc(1, Data_Points, 0:Constellation_Point-1);

%Modulate data
qpsk_modulated_data = qammod(Data_Source, Constellation_Point);

%Reshape
data_matrix = reshape(qpsk_modulated_data, [], 1);

% Normalizing
data_matrix = data_matrix/sqrt(Constellation_Point);
data_matrix = reshape(data_matrix,[],1);

%Reorgansing in matrix for FFT
fft_vector = zeros(Frequency_Bins,1);
lower_bound = Frequency_Bins/2-Data_Points/2;
higher_bound = lower_bound+Data_Points/2-1;

%Plot to see structure: wanted data to be centred
fft_vector(lower_bound:higher_bound) = data_matrix(1:Data_Points/2);
fft_vector(higher_bound+2:higher_bound+2+Data_Points/2-1) = data_matrix((Data_Points/2)+1:end);

y = ifft(fftshift(fft_vector));

y1 = resample(y,m,l);

y1_samples = resample(y1, l, m);

sr1 = fcs;
df1 = sr1 / length(y1_samples); %Frequency Interval 
f1 = -0.5*sr1:df1:(0.5*sr1 - df1);

figure(1)
%normalized plot wrt to max.
plot(f1,20*log10(fftshift(abs(fft(y1_samples./abs(max(y1_samples)))))), 'k');


