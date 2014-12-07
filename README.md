ecliu110.github.io
==================
BME271 Final Project Code

3 Scripts:
makeDB.m 
compareDB.m (function)
Classify.m

makeDB.m:
Create of database of 3 EDM and 3 Classical Songs to use for future comparison.
Produces plots of: spectrogram (pitch), FT of pitch power/intensity (frequency), and FT after high pass filter (images attached)
The post-high pass FT data of all 6 songs were saved into database.mat to use for future comparison

compareDB.m:
function that when called determines whether a song clip is EDM or Classical by comparing the post-high pass FT of the input song to the 6 different database matrices. 
The genre is determined by which database song has a highest correlation
correlation calculated using MATLAB’s corr2

Classify.m:
main script 
user calls compareDB with input audio filenames, can also specify database

