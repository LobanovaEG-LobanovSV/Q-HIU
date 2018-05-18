clc
clear
close all

% Set path to the Functions folder
SetPath

%% Create artificial Raman spectra with broad background

Nu = 370:1783; % Raman shift

% Create an input artifficial spectrum displaying ten Raman bands
Is0 = zeros(size(Nu));
for i = 1:10
    muR = Nu(1) + (Nu(end)-Nu(1)) * rand(1); % \mu
    sigmaR = 5 + (20-5) * rand(1); % \sigma
    Is0 = Is0 + rand(1) * exp(-(Nu-muR).^2/(2*sigmaR^2));
end

muB = 1000; % \mu^{aB}
sigmaB = 400; % \sigma^{aB}
I = exp(-(Nu-muB).^2/(2*sigmaB^2)) + Is0;

%% Calculate Bottom Gaussian Fitting (BGF) for background subtraction

sigma = 300;
Is = BGF(I,Nu,sigma); % The result of the BGF

Ib = I-Is; % The bottom Gaussian

%% Draw results

plot(Nu,I,'b',Nu,Ib,'r--',Nu,Is0,'g',Nu,Is,'k--')
xlim([Nu(1), Nu(end)])
axis square
ylim([0, max(I)*1.01])
set(gca,'XTick',500:500:1500,'YTick',0:2)