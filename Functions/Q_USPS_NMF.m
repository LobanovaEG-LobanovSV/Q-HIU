%Q_USPS_NMF Quantitative Unsupervised/Partially Supervised Non-negative
%Matrix Factorization (Q-US/PS-NMF).
%
% Q_USPS_NMF decomposes the intensity matrix I into a product of
% non-negative spatial concentration maps C and corresponding non-negative
% spectra S with rows representing individual biochemical substances
% (components) using the algorithm described in "E. G. Lobanova and
% S. V. Lobanov, arXiv:1803.01823 (2018)".
%
% Syntax:
%   [C, S] = Q_USPS_NMF(I,Nu,N,Niter,Nrepl);
%   [C, S, Err] = Q_USPS_NMF(I,Nu,N,Niter,Nrepl);
%   [C, S] = Q_USPS_NMF(I,Nu,N,Niter,Nrepl,KS);
%   ...
%   [C, S, Err, ErrC, ErrS] = Q_USPS_NMF(I,Nu,N,Niter,Nrepl,KS, ...
%       Save,Nx,Ny,Names,DirSave)
% Use empty variables to choose default parameters, for example,
%   [C, S, Err, ErrC, ErrS] = Q_USPS_NMF(I,Nu,N,[],[],[], ...
%       Save,Nx,Ny,Names,DirSave,Sin,Tmax)
%
% Input:
%    I    - Intensity matrix. It consists of Nr submatrices combined
%           along first dimension. Its size is Np-by-Ns, where
%           Np = sum(Nx.*Ny) and Ns are the number of pixel and spectral
%           points, respectively.
%   Nu    - Raman shift. Its length is Ns.
%    N    - number of components in the Q_USPS_NMF procedure.
%   Niter - number of iterations for the Q_USPS_NMF procedure.
%   Nrepl - number of replications of the Q_USPS_NMF procedure.
%    KS   - Known spectra. Default value is [].
%   Save  - logical parameter specifying to save spectra and
%           concentration maps of factorized components or not. Default
%           value is false.
%   Nx    - vector with number of pixels along x-axis for each submatrix
%           of the intensity matrix I. Its length is Nr. Default value is
%           sqrt(size(I,1)).
%   Ny    - vector with number of pixels along y-axis for each submatrix
%           of the intensity matrix I. Its length is Nr. Default value is
%           size(I,1) / Nx.
%  Names  - cell array with names of the hyperspectral images. Its length
%           is Nr. Default is ''.
% DirSave - folder, where pictures with spectra and concentration maps of
%           factorized components are saved. Default is cd.
%   Sin   - initial spectral matrix for the Q_USPS_NMF procedure. If Sin is
%           given, the number of replications Nrepl is set to one. If Sin
%           is not specified or is empty, the Q_USPS_NMF procedure performs
%           Nrepl replications with random initial matrices. Default is [].
%  Tmax   - maximum calculation time per one replication. The iteration
%           procedure stop if computation time exceeds Tmax or iteration
%           exceeds Niter.
%
% Output:
%    C    - concentration matrix.
%    S    - spectral matrix.
%   Err   - relative factorization error, i.e.
%           Err = norm(I-C.'*S,'fro') / norm(I,'fro').
%
% 
% Function is created by S. Lobanov in 2018.