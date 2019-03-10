# Q-HIU

Quantitative hyperspectral image unmixing (Q-HIU) method is intended for quantitative data analysis of multi-set and individual Raman micro-spectroscopy images, allowing to efficiently retrieve non-negative spatial concentration maps and non-negative spectral profiles of the images’ chemical constituents (components) with no a priori information, minimum input parameters, and great operation speed. Theory and application of the Q-HIU together with the verifications and comparisons with state-of-the-art methods using both simulated and real experimental data is presented in [E.G. Lobanova, S.V. Lobanov, "Efficient quantitative hyperspectral image unmixing method for large-scale Raman micro-spectroscopy data analysis", Analytica Chimica Acta 1050 (2019) 32e43](https://www.sciencedirect.com/science/article/pii/S0003267018313564?via%3Dihub). 

In brief, Q-HIU consists of three chemometric methods (functions) each representing the data steps of analysis. These consecutive steps include Singular Value Decomposition with Automatic Divisive Correlation (SVD_ADC.m) used for data denoising, Bottom Gaussian Fitting (BGF.m) intended for fluorescent background removal and Quantitative Unsupervised/Partially Supervised Non-negative Matrix Factorization (Q_USPS_NMF.m) enabling to identify and quantify the unknown or partially unknown biochemical composition of analytes from the hyperspectral Raman data. As a useful Q_USPS_NMF modality, the user can retrieve partially unknown biochemical composition of analysing samples by simply uploading the Raman spectra of biochemical components that a priori known to be present in the samples.

Altogether, the Q-HIU software is an efficient chemometric technique, which will be beneficial for the biomolecular characterization and quantitative imaging of individual biochemical components in chemical and biomedical samples of various complexity.

The main function is Q_HIU.m. It consists of three main steps: Singular Value Decomposition with Automatic Divisive Correlation (SVD_ADC.m), Bottom Gaussian Fitting (BGF.m), and Quantitative Unsupervised/Partially Supervised Non-negative Matrix Factorization (Q_USPS_NMF.m).

The best way to understand how the Q-HIU works is to consider the following examples.

## Example 1: using BGF to reproduce Fig. 1B

- Run the script 'Example_Fig_1B.m'

## Example 2: using Q-HIU to reproduce Figs. 2-3 and Figs. S3-S17 of the Supporting Information

- Download the Raman micro spectroscopy data from [You et al., Research data supporting "Raman spectroscopy imaging reveals interplay between atherosclerosis and medial calcification in human aorta", Zenodo (2017)](https://zenodo.org/record/1045174):

  ![Download data from Zenodo](https://github.com/LobanovaEG-LobanovSV/Q-HIU/blob/master/Images/ZenodoDownload.png)

- Unzip the 'Raman.zip' archive and run 'txt2mat.m' script which converts text data into MATLAB format:
  - choose 'Raman' folder
    ![Choose Raman folder](https://github.com/LobanovaEG-LobanovSV/Q-HIU/blob/master/Images/Start_txt2mat.png)
  - the script 'txt2mat.m' will create a subfolder 'Data' inside the 'Raman' folder:
    ![Data folder](https://github.com/LobanovaEG-LobanovSV/Q-HIU/blob/master/Images/Data_folder.png)
  - the 'Data' subfolder contains six MATLAB data files with intensity matrix `I` and Raman shift `Nu`:
    ![Raman data](https://github.com/LobanovaEG-LobanovSV/Q-HIU/blob/master/Images/Raman_data.png)
    
- Run 'Q_HIU.m' script
  - Choose the following initial parameters
    ![Initial parameters](https://github.com/LobanovaEG-LobanovSV/Q-HIU/blob/master/Images/Initial_parameters.png)
  - Choose the folder with Raman data ('\Raman\Data\'):
    ![Folder with Raman Data](https://github.com/LobanovaEG-LobanovSV/Q-HIU/blob/master/Images/Folder_with_Raman_Data.png)


# License

<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License</a>.
