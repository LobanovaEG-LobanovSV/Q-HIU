%RamanParameters Parameters of the Raman.m script.
%
% RamanParameters creates a dialog box initializing parameters
% of the Raman.m script.
%
% Syntax:
%   [nu1,dx,dy,dnu,R_thr_SVD,sigma,R_thr_BGF,Save,nu2,Speed,N,KS] = ...
%       RamanParameters;
%
% Output:
%   nu1   - Initial spectral range. If initial spectral range consists of
%           one interval, nu1 in the dialog box can be written as two
%           wavenumbers, for example, 500, 4000. If initial spectral range
%           consists of several intervals, square brackets must be
%           used, for example, [500, 1000], [3000, 4000].
%   dx    - "one" pixel shift along x-axis. Default is 1.
%   dy    - "one" pixel shift along y-axis. Default is 1.
%   dnu   - "one" pixel shift along spectral axis. Default is 1.
%R_thr_SVD- mean autocorrelation coefficient threshold which splits the
%           autocorrelation plane into noisy and non-noisy half-planes in
%           the SVD-ACD procedure.
%  sigma  - standard deviation, which is used for the BGF procedure.
%R_thr_BGF- spectral autocorrelation coefficient threshold which is used
%           in the the BGF procedure in order to discard the spatial
%           points, Raman intensity of which have correlation values lower
%           than R_thr_BGF.
%  Save   - logical parameter, which specify to save initial spectra and
%           results of SVD-ACD and BGF or not.
%   nu2   - Spectral range used in the Q-US/PS-NMF procedure. If initial
%           spectral range consists of one interval, nu2 in the
%           dialog box can be written as two wavenumbers, for example,
%           500, 4000. If initial spectral range consists of several
%           intervals, square brackets must be used, for example,
%           [500, 1000], [3000, 4000].
%    N    - number of components in the Q-US/PS-NMF procedure.
%  Niter  - number of iterations for the Q-US/PS-NMF procedure.
%  Nrepl  - number of replications of the Q-US/PS-NMF procedure.
%    KS   - logical parameter, which specifies whether known spectra are
%           used or not.
%
% 
% Function is created by E. Lobanova and S. Lobanov in 2018.