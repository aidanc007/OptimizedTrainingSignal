# Optimised Training Signal (OTS)
This repository provides the code to generate the OTS training signal for PA modelling or digital predistortion.  The signal is optimised with respect to minimising the number of samples used. 
![OptimisedTrainingSignal Bench](https://github.com/aidanc007/OptimizedTrainingSignal/blob/main/OTS%20Bench.png)
## How to Use 
1. git clone the repository;
2. run OTS.m function in MATLAB.


## How it works
![OptimisedTrainingSignal Symbol Placement](https://github.com/aidanc007/OptimizedTrainingSignal/blob/main/OTS%20Symbol%20Placement.png)

The samples are generated in such a way that the training signal excites the PA over its operating frequency, bandwidth, power levels, and power transitions.
Whilst also minimizing the number of training signal samples needed to model or predistort a PA.

Generating an OTS signal of a specified bandwidth can be achieved using a subset of the subcarriers used for a typical OFDM signal. 
Selecting a sufficient but lower number of subcarriers will minimize the number of signal samples while maintaining the same format as the wireless transmission standard. 

Symbols are mapped to select subcarriers to cover the PA’s full range of operations in terms of the frequency and peak-to-average power ratio(PAPR).
Two of the most important design objectives are that the signal must cover all the symbols and the PAPR should be similar to that of the RF system it will be applied to.

Procedure is as follows
1) Symbols are selected on the constellation diagram of above Figure (a)
2) Next we choose our transitions between the symbols. Any arbitrary transition can be chosen, in Figure (a) a combination of horizontal & vertical symbol transitions are used
3) The symbols are mapped to specific subcarriers spanning desired signal bandwidth, see above Figure (b)
4) Inverse Fast Fourier Transform (IFFT) used to convert selection of frequency tones to time-domain signal

## Publications
R. Mushini, Y. Jiang, M. Leeser and J. Dooley, "Minimizing Training Signal Length for Power Amplifier Characterization and Linearization," in IEEE Microwave and Wireless Technology Letters, vol. 33, no. 11, pp. 1564-1567, Nov. 2023, doi: 10.1109/LMWT.2023.3317509.

R. Mushini, C. McDonald, P. Rashev, R. Farrell and J. Dooley, "High Accuracy DPD Approach for Hybrid Beamformer using Novel Training Symbol Mapping," 2024 IEEE Topical Conference on RF/Microwave Power Amplifiers for Radio and Wireless Applications (PAWR), San Antonio, TX, USA, 2024, pp. 55-58, doi: 10.1109/PAWR59907.2024.10438578.

J. G. Ribeiro, R. Bogrekci, A. Colgan, M. Codd, Z. Ren, Y. Jiang, D. Byrne, M. Leeser and J. Dooley, "Robust Digital Pre Distortion Parameter Estimation with Interpretable Feature Selection," 2025 IEEE Topical Conference on RF/Microwave Power Amplifiers for Radio and Wireless Applications (PAWR), San Juan, PR, USA, 2025
