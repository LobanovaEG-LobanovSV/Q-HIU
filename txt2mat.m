clc
clear
close all

Dir = uigetdir(cd,'Choose folder with Raman data');
if ~ischar(Dir)
    disp('Operation is canceled by user.')
    return
end

DirSave = fullfile(Dir,'Data');
if ~isdir(DirSave)
    mkdir(DirSave)
end

NuLaser = 370;
Names = {'O22_p_000','O25_p_001','O31_p_005','O43_000','O46_000', ...
    'O47_002'};
load(fullfile(cd,'Parameters','txt2mat.mat'))
Nx_loop = zeros(size(Names));
Ny_loop = zeros(size(Names));
for i = 1:length(Names)
    fileID = fopen((fullfile(Dir,[Names{i} ...
        '_Spec.Data 2 (Header).txt'])),'r');
    res = fscanf(fileID,'%s');
    fclose(fileID);
    
    nx1 = strfind(res,'SizeX=') + length('SizeX=');
    nx2 = strfind(res,'SizeY=') - 1;
    ny1 = strfind(res,'SizeY=') + length('SizeY=');
    ny2 = strfind(res,'SizeGraph=') - 1;
    
    Nx_loop(i) = str2double(res(nx1:nx2));
    Ny_loop(i) = str2double(res(ny1:ny2));
end

for i = 1:length(Names)
    Nu = load(fullfile(Dir,[Names{i} '_Spec.Data 2 (X-Axis).txt'])).';
    I = load(fullfile(Dir,[Names{i} '_Spec.Data 2 (Y-Axis).txt']));
    Nx = Nx_loop(i);
    Ny = Ny_loop(i);
    Ns = length(Nu);
    I = reshape(I,Ns,Nx,Ny);
    I = permute(I,[2 3 1]);
    
    Ny = find(all(mean(I,3) ~= 0,1),1,'last');
    Ny_loop(i) = Ny;
    I = I(:,1:Ny,:);
    
    I = I - min(min(min(I)));
    
    I = I(end:-1:1,end:-1:1,:);
    
    NLaser = find(Nu<NuLaser,1,'last');
    Nu = Nu(NLaser+1:end);
    I = I(:,:,NLaser+1:end);
    Ns = length(Nu);
    
    I(nn{i}) = nnI{i};
    
    save(fullfile(DirSave,[Names{i} '.mat']),'Nu','I')
end