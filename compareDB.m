function [rEDM rClass answer] = compareDB(fname,dbname)
%compareDB: Determines if song is EDM or Classic
%
%   Compares a 10s clip of the input audio to the 3EDM and 3Classic songs
%   found in the database.mat
%   Compares the frequency magnitudes after being passed through a HP filter
%   Answer is determined by which database song has greatest correlation.
%
%   Inputs:
%     fname is the String of the audiofile name (in current directory)
%   Outputs:
%     rEDM is matrix with correlation coefficients of song vs EDM database
%     rClass is a matrix with correlation coefficients of fname vs Classic database
%     answer String saying which genre the input audio belongs to

%% Download database high pass frequency magnitudes
load(dbname);

%% Use spectrogram function to take stft and get pitch intensity/power
[y1,FS1] = audioread(fname);
song1 = y1(1:10*FS1);
win = 128;
nf = 256;
figure(1)
spectrogram(song1,win,[],nf,FS1,'yaxis');
title('Input Spectrogram');
[s1 f1 t1 p1] = spectrogram(song1,win,[],nf,FS1*2,'yaxis');

%% Take the FFT of the pitch power to get frequency (changes in pitch)
NFFT = 2^nextpow2(length(s1(1,:)));
s1ft = fftshift(fft(abs(s1(1,:)),NFFT));
len1 = length(s1ft);
ind1 = (-(len1-1)/2:1:(len1-1)/2)*FS1/2;
abs1 = abs(s1ft)/max(abs(s1ft));
figure(2)
plot(ind1,abs1);
title('DTFT');

%% Pass thorugh high-pass filter (H(jw) = rect)
wc = 300*FS1/2; % cut-off frequency
mask = ind1<-wc | ind1>wc;
hp = abs1.*mask;
figure(3)
plot(ind1,hp);
axis([-1e8 1e8 0 1]);
title('High Pass');

%% Get Correlation coefficients
rEDM = abs([corr2(hp,hpe1) corr2(hp,hpe2) corr2(hp,hpe3)]);
rClass = abs([corr2(hp,hpc1) corr2(hp,hpc2) corr2(hp,hpc3)]);

mEDM = max(rEDM);
mClass = max(rClass);

%% Find best match from database to determine if EDM or Classic
if mEDM > mClass
    answer = 'This song is EDM';
else
    answer = 'This song is Classical';
end

end

