%SVD_ADC Singular Value Decomposition with Automatic Divisive Correlation.
%
% SVD_ADC removes noise from the intensity matrix I using the algorithm
% described in "E. G. Lobanova and S. V. Lobanov, arXiv:1803.01823 (2018)".
%
% Syntax:
%   I = SVD_ADC(I);
%   I = SVD_ADC(I,Nx,Ny);
%   ...
%   I = SVD_ADC(I,Nx,Ny,R_thr,dx,dy,dnu,Save,Nu,DirSave,File);
% Use empty variables to choose default parameters, for example,
%   I = SVD_ADC(I,Nx,Ny,[],[],dy,[],Save);
%
% Input:
%    I    - noisy intensity matrix. It consists of Nr submatrices
%           combined along first dimension. Its size is Np-by-Ns, where
%           Np = sum(Nx.*Ny) and Ns are the number of pixel and spectral
%           points, respectively.
%   Nx    - vector with number of pixels along x-axis for each submatrix
%           of the intensity matrix I. Its length is Nr. Default value is
%           sqrt(size(I,1)).
%   Ny    - vector with number of pixels along y-axis for each submatrix
%           of the intensity matrix I. Its length is Nr. Default value is
%           size(I,1) / Nx.
%  R_thr  - mean autocorrelation coefficient threshold which splits the
%           autocorrelation plane into noisy and non-noisy half-planes.
%           Default is 0.5.
%   dx    - "one" pixel shift along x-axis. Default is 1.
%   dy    - "one" pixel shift along y-axis. Default is 1.
%   dnu   - "one" pixel shift along spectral axis. Default is 1.
%  Save   - logical parameter, which specify to save autocorrelation map
%           and singular vectors or not. Default is true.
%   Nu    - Raman shift. Its length is Ns.
% DirSave - folder, where pictures with autocorrelation map and singular
%           vectors are saved (default is cd).
%  Names  - cell array with names of the hyperspectral images. Its length
%           is Nr. Default value is ''.
%
% Output:
%    I    - intensity matrix with removed noise.
%
% 
% Function is created by S. Lobanov in 2018.