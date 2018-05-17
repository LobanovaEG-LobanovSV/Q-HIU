%BGF Bottom Gaussian Fitting.
%
% BGF subtracts a quasi-slowly varied background approaching the
% intensity matrix I from the bottom using the algorithm described in
% "E. G. Lobanova and S. V. Lobanov, arXiv:1803.01823 (2018)".
%
% Syntax:
%   I = BGF(I,Nu,sigma);
%   I = BGF(I,Nu,sigma,R_thr);
%   ...
%   I = BGF(I,Nu,sigma,R_thr,dnu,Save,Nx,Ny,DirSave,File);
% Use empty variables to choose default parameters, for example,
%   I = BGF(I,Nu,sigma,[],dnu,Save);
%
% Input:
%    I    - intensity matrix with broad background. It consists of Nr
%           submatrices combined along first dimension. Its size is
%           Np-by-Ns, where Np = sum(Nx.*Ny) and Ns are the number of
%           pixel and spectral points, respectively.
%   Nu    - Raman shift. Its length is Ns.
%  sigma  - standard deviation, which is used for BGF.
%  R_thr  - spectral autocorrelation coefficient threshold which is used
%           in order to discard spatial points, which have correlation
%           values lower than R_thr. Default value is 0.
%   dnu   - "one" pixel shift along spectral axis. Default value is 1.
%  Save   - logical parameter specifying to save results of BGF or not.
%           Default value is false.
%   Nx    - vector with number of pixels along x-axis for each submatrix
%           of the intensity matrix I. Its length is Nr. Default value is
%           sqrt(size(I,1)).
%   Ny    - vector with number of pixels along y-axis for each submatrix
%           of the intensity matrix I. Its length is Nr. Default value is
%           size(I,1) / Nx.
% DirSave - folder, where pictures with autocorrelation map and singular
%           vectors are saved (default is cd).
%  Names  - cell array with names of the hyperspectral images. Its length
%           is Nr. Default value is ''.
%
% Output:
%    I    - intensity matrix with removed quasi-slowly varied background.
%
% 
% Function is created by S. Lobanov in 2018.