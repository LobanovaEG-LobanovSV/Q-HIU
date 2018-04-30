# Q-HIU

Quantitative Hyperspectral Image Unmixing (Q-HIU) method retrieves biochemical constituents (components) from Raman micro-spectroscopy data as described in the paper "E. G. Lobanova and S. V. Lobanov, arXiv:1803.01823 (2018)" (https://arxiv.org/abs/1803.01823).

The main function is Q_HIU.m. It consists of three main steps: Singular Value Decomposition with Automatic Divisive Correlation (SVD_ADC.p), Bottom Gaussian Fitting (BGF.p), and Quantitative Unsupervised/Partially Supervised Non-negative Matrix Factorization (Q_USPS_NMF.p).

The best way to understand how the Q-HIU works is to consider the following example.

## Example of using Q-HIU

- Download the Raman micro spectroscopy data from [You et al., Research data supporting "Raman spectroscopy imaging reveals interplay between atherosclerosis and medial calcification in human aorta", Zenodo (2017)](https://zenodo.org/record/1045174):

  ![Download data from Zenodo](https://github.com/LobanovaEG-LobanovSV/Q-HIU/blob/master/Images/ZenodoDownload.png)

- Unzip the 'Raman.zip' folder and run 'txt2mat.m' script which converts text data into MATLAB format:
  - choose 'Raman' folder
    ![Choose Raman folder](https://github.com/LobanovaEG-LobanovSV/Q-HIU/blob/master/Images/Start_txt2mat.png)
  - the script 'txt2mat.m' will create a subfolder 'Data':
    ![Data folder](https://github.com/LobanovaEG-LobanovSV/Q-HIU/blob/master/Images/Data_folder.png)
  - the 'Data' subfolder contains six MATLAB data files with intensity matrix `I` and Raman shift `Nu`:
    ![Raman data](https://github.com/LobanovaEG-LobanovSV/Q-HIU/blob/master/Images/Raman_data.png)
    
- Run 'Q_HIU.m' script
  - Choose the following initial parameters
    ![Initial parameters](https://github.com/LobanovaEG-LobanovSV/Q-HIU/blob/master/Images/Initial_parameters.png)
  - Choose the folder with Raman data ('\Raman\Data\'):
    ![Folder with Raman Data](https://github.com/LobanovaEG-LobanovSV/Q-HIU/blob/master/Images/Folder_with_Raman_Data.png)
