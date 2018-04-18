clc
clear
close all
SetPath

%% Parameters

[nu1,dx,dy,dnu,R_thr_SVD,sigma,R_thr_BGF,Save,nu2,N,Niter,Nrepl,KS] = ...
    RamanParameters;

%% Load data

KS = LoadKnownSpectra(KS);

[Dir, Names, Ext] = LoadDirRaman;

figure('OuterPosition',[1, 10, 1600, 900])

DirSave = fullfile(Dir,['Raman_Sigma=' int2str(sigma)]);
if ~isdir(DirSave)
    mkdir(DirSave)
end

%% Main

KS = BGFKnownSpectra(KS,sigma,DirSave,Save);

[I0, Nu, Nx, Ny] = LoadDataRaman(Dir,Names,Ext,nu1,DirSave,Save);

Iter = 0;
while Iter == 0 || Nr > 0
    Iter = Iter + 1;
    disp(['Iteration ' int2str(Iter)])
    if Iter ~= 1
        disp([int2str(Nr) ' points were removed']);
    end
    disp('SVD_ADC...')
    
    DirIter = fullfile(DirSave,['Iteration_' int2str(Iter)]);
    if Save && ~isdir(DirIter)
        mkdir(DirIter)
    end
    
    I = SVD_ADC(I0,Nx,Ny,R_thr_SVD,dx,dy,dnu,Save,Nu,DirIter,Names);
    
    Im = mean(I(:));
    disp([int2str(sum(I(:)<Im/100)) ' points were negative'])
    I(I<Im/100) = Im/100;
    
    disp('BGF...')
    I = BGF(I,Nu,sigma,R_thr_BGF,dnu,Save,Nx,Ny,DirIter,Names);
    
    Nr = sum(isnan(I0(:,1)) ~= isnan(I(:,1)));
    
    I0(isnan(I(:,1)),:) = NaN;
end
clear I0 Im DirIter

[Nu, I] = RamanRemoveSpectraPoints(Nu,I,nu2);

KS = KSInterpolation(Nu,KS);

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
