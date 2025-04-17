# SRC
This is the code file package of the article "A stretchable epidermal dual-mode electrode for strain-reconstructed calibration of electrophysiological signals", which contains the sample code and demonstration data of the algorithm in the paper.

*File List and Description*
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
No	Name								Type			Description
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1	Main_SRC_Performance.m					main			Run to view the running process and performance of SRC
2	Main_Comparision.m						main			Run to view the running process and results of filtering ecg by different algorithm
3	Main_Rpeak Comparision.m				main			Run to view the running process and results of identifying R peaks form different filtered ECG using the P&T algorithm
4	Main_Strain_Reconstructed.m				main			Run to view the running process of strain reconstructed method proposed by the paper
5	LMS_filter.m 							function		Function to implement LMS filter
6	strain_reconstruction.m					function		Function to predicting drift in physiological electrical signals based on strain data
7	rpeak.m								function		Function to detection of ECG R-peaks by parabolic fitting (Qinghua Zhang, 2007: An algorithm for QRS onset and offset detection in single lead electrocardiogram records)
8	pantompkins_qrs.m						function		Function to detection of ECG R-peaks with Pan-Tompkins algorithm (P&T algorithm)
9	opening.m							function		Function for ppening operation on a 1-D signal (for P&T algorithm)
10	Moving_correction.m						function		Function for median_filtering
11	MMF_filter.m							function		Function for modified morphological filtering
12	line_correction.m						function		Function for piecewise linear correction
13	IIR_filter.m							function		Function to design and apply an IIR filter
14	filtbyfft.m								function		Function to filter data by FFT
15 	erosion.m								function		Function for erosion operation on a 1-D signal
16	dilatation.m							function		Function for dilatation operation on a 1-D signal
17	closing.m								function		Function for closing operation on a 1-D signal 
18	createFit.m							function		Function to create a fit curve based on the measurement data
19	Data_example (SR, ECG).txt				data			Data file with drift data (column 1) reconstructed from strain and corresponding ecg data (column 2)
20	Data_example (ECG, SR, Strain).txt			data			Data file with ecg data (column 1), drift data (column 2) reconstructed from strain, and strain data (column 3)
21	Data_example (ECG with Press Interference).txt	data			Data file for ecg data interfered by press
22	Data_example_strain_data.CSV				data			Data file for press-leading strain sensor data
23	Fitting data for press.xlsx					data			Data file with measurement data for fitting curve generation
