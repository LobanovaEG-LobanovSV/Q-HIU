%RamanRemoveSpectraPoints Remove spectral points outside the interval nu.
%
% Syntax:
%   [Nu, I] = RamanRemoveSpectraPoints(Nu,I,nu)
%
% Input/Output:
%   Nu    - Raman shift.
%    I    - Intensity matrix.
%   nu    - Spectral range. If the spectral range consists of one
%           interval, nu should be set as a two-element vector, for
%           example, nu = [500, 4000]. If the spectral range consists of
%           several intervals, nu must be set as a cell array, for example,
%           nu = {[500, 1000], [3000, 4000]}.
%
% 
% Function is created by S. Lobanov in 2018.