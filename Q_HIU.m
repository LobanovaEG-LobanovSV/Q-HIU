clc
clear
close all

% Set path to the Functions folder
SetPath

%% Create dialog boxes initializing parameters and choosing data

% Create a dialog box initializing parameters of this script
[nu1,dx,dy,dnu,R_thr_SVD,sigma,R_thr_BGF,Save,nu2,N,Niter,Nrepl,KS] = ...
    RamanParameters;

% Create a dialog box choosing data with known spectra
KS = LoadKnownSpectra(KS);

% Create a dialog box choosing data with Raman spectra
[Dir, Names, Ext] = LoadDirRaman;

figure('OuterPosition',[1, 10, 1600, 900])

% Create folder where results will be saved
DirSave = fullfile(Dir,['Raman_Sigma=' int2str(sigma)]);
if ~isdir(DirSave)
    mkdir(DirSave)
end

%% Loading the data

% Load the data with known spectra
KS = BGFKnownSpectra(KS,sigma,DirSave,Save);

% Load the data with Raman spectra
[I0, Nu, Nx, Ny] = LoadDataRaman(Dir,Names,Ext,nu1,DirSave,Save);

%% Remove noise and subtract quasi-slowly varied background

for i = 1:length(Nu)
    disp(['Iteration ' int2str(i)])
    
    DirIter = fullfile(DirSave,['Iteration_' int2str(i)]);
    if Save && ~isdir(DirIter)
        mkdir(DirIter)
    end
    
    % Remove noise
    disp('SVD_ADC...')
    I = SVD_ADC(I0,Nx,Ny,R_thr_SVD,dx,dy,dnu,Save,Nu,DirIter,Names);
    
    % Replace negative or close to zero intensities by small positive
    % values
    Im = mean(mean(I,'omitnan'),'omitnan');
    disp([int2str(sum(sum(I<Im/100))) ' points were negative'])
    I(I<Im/100) = Im/100;
    
    % Subtract quasi-slowly varied background
    disp('BGF...')
    I = BGF(I,Nu,sigma,R_thr_BGF,dnu,Save,Nx,Ny,DirIter,Names);
    
    % Find number of points with low spectral autocorrelation coefficient
    Nr = sum(isnan(I0(:,1)) ~= isnan(I(:,1)));
    if Nr == 0
        break
    else
        disp([int2str(Nr) ' points were removed']);
    end
    
    % Translate points with low spectral autocorrelation coefficient from
    % the matrix I to the matrix I0
    I0(isnan(I(:,1)),:) = NaN;
end
clear I0 Im DirIter

%% Remove spectral points outside the interval nu

% Remove spectral points outside the interval nu2
[Nu, I] = RamanRemoveSpectraPoints(Nu,I,nu2);

% Interpolate known spectra
KS = KSInterpolation(Nu,KS);

%% Q-US/PS-NMF

for i = 1:length(N)
    disp(['Q_USPS_NMF: step ' int2str(i) ' from ' int2str(length(N))])
    DirSave2 = fullfile(DirSave,['Niter=' int2str(Niter) ...
        '_Nrepl=' int2str(Nrepl) '_N=' int2str(N(i))]);
    if ~isdir(DirSave2)
        mkdir(DirSave2)
    end
    
    [C, S, Err, ErrC, ErrS] = Q_USPS_NMF(I,Nu,N(i),Niter,Nrepl,KS, ...
        true,Nx,Ny,Names,DirSave2);

    FileSave = fullfile(DirSave2,'Results.mat');
    save(FileSave,'Nu','C','S','Err','ErrC','ErrS','Nx','Ny','Names', ...
        'sigma','R_thr_SVD','KS','nu1','nu2','dx','dy','dnu', ...
        'R_thr_BGF')
end