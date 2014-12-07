% Make a database of 3 EDM clips and 3 Classical Clips
clear all;
close all;
%% Create Spectrogram EDM
% Plots pitch (Figure 1)
[y1,FS1] = audioread('AliveCut.mp3');
song1 = y1(1:10*FS1);
win = 128;
nf = 256;
figure(1)
subplot(1,3,1);
spectrogram(song1,win,[],nf,FS1,'yaxis');
title('EDM 1'); xlabel('Time (s)'); ylabel('Frequency (Hz)');
[s1 f1 t1 p1] = spectrogram(song1,win,[],nf,FS1,'yaxis');


[y2,FS2] = audioread('CrackinCut.mp3');
song2 = y2(1:10*FS2);
win = 128;
nf = 256;
subplot(1,3,2);
spectrogram(song2,win,[],nf,FS2,'yaxis');
title('EDM 2');
[s2 f2 t2 p2] = spectrogram(song2,win,[],nf,FS2,'yaxis');

[y3,FS3] = audioread('PolyCut.mp3');
song3 = y3(1:10*FS3);
win = 128;
nf = 256;
subplot(1,3,3);
spectrogram(song3,win,[],nf,FS3,'yaxis');
title('EDM3');
[s3 f3 t3 p3] = spectrogram(song3,win,[],nf,FS3,'yaxis');

%print('-dtiff','-r300','Pitch_EDM.tif');


%% Plot frequencies EDM (Figure 2)
% frequency = change in pitch intensity/power 
NFFT = 2^nextpow2(length(s1(1,:)));
se1ft = fftshift(fft(abs(s1(1,:)),NFFT));
len1 = length(se1ft);
ind1 = (-(len1-1)/2:1:(len1-1)/2)*FS1/2;
abse1 = abs(se1ft)/max(abs(se1ft));
figure(2)
subplot(1,3,1);
plot(ind1,abse1);
title('EDM 1: FT'); ylabel('Magnitude'); xlabel('Frequency (Hz)');

se2ft = fftshift(fft(abs(s2(1,:)),NFFT));
len2 = length(se2ft);
ind2 = (-(len2-1)/2:1:(len2-1)/2)*FS1/2;
abse2 = abs(se2ft)/max(abs(se2ft));
subplot(1,3,2);
plot(ind2,abse2);
title('EDM 2: FT');


se3ft = fftshift(fft(abs(s3(1,:)),NFFT));
len3 = length(se3ft);
ind3 = (-(len3-1)/2:1:(len3-1)/2)*FS1/2;
abse3 = abs(se3ft)/max(abs(se3ft));
subplot(1,3,3);
plot(ind3,abse3);
title('EDM 3: FT');

%print('-dtiff','-r300','FreqMag_EDM.tif');

%% High-pass filter EDM (Figure 3)
% H(t) = sinc -> H(jw) = rect function
% h(t)*x(t) = H(jw)X(jw);

wc = 300*FS1/2; % cut-off frequency
mask = ind1<-wc | ind1>wc;
hpe1 = abse1.*mask;
hpe2 = abse2.*mask;
hpe3 = abse3.*mask;

figure(3)
subplot(1,3,1);
plot(ind1, hpe1)
title('Avicii: High-pass'); ylabel('Magnitude'); xlabel('Frequency (Hz)');
axis([-1e8 1e8 0 0.12]);

subplot(1,3,2);
plot(ind2, hpe2)
title('EDM 2: High-pass'); axis([-1e8 1e8 0 0.12]);

subplot(1,3,3);
plot(ind3, hpe3)
title('EDM 3: High-pass'); axis([-1e8 1e8 0 0.12]);

%print('-dtiff','-r300','HP_EDM.tif');

%% Plot Spectrograms Classic (Figure 4)
[y1c,FS1c] = audioread('AllegroCut.mp3');
song1c = y1c(1:10*FS1c);
win = 128;
nf = 256;
figure(4)
subplot(1,3,1);
spectrogram(song1c,win,[],nf,FS1c,'yaxis');
title('Allegro, Mozart'); xlabel('Time (s)'); ylabel('Frequency (Hz)');
[s1c f1c t1c p1c] = spectrogram(song1c,win,[],nf,FS1c,'yaxis');

[y2c,FS2c] = audioread('CanonCut.mp3');
song2c = y2c(1:10*FS2c);
win = 128;
nf = 256;
subplot(1,3,2);
spectrogram(song2c,win,[],nf,FS2c,'yaxis');
title('Classic 2');
[s2c f2c t2c p2c] = spectrogram(song2c,win,[],nf,FS2c,'yaxis');

[y3c,FS3c] = audioread('No5Cut.mp3');
song3c = y3c(1:10*FS3c);
win = 128;
nf = 256;
subplot(1,3,3);
spectrogram(song3c,win,[],nf,FS3c,'yaxis');
title('Classic 3');
[s3c f3c t3c p3c] = spectrogram(song3c,win,[],nf,FS3c,'yaxis');

print('-dtiff','-r300','Pitch_Classic.tif');


%% Plot frequencies Classic (Figure 5)
% frequency = change in pitch intensity/power
sc1ft = fftshift(fft(abs(s1c(1,:)),NFFT));
len1c = length(sc1ft);
ind1c = (-(len1c-1)/2:1:(len1c-1)/2)*FS1c/2;
absc1 = abs(sc1ft)/max(abs(sc1ft));
figure(5)
subplot(1,3,1)
plot(ind1c,absc1);
title('Classic 1 : FT'); ylabel('Magnitude'); xlabel('Frequency (Hz)');


sc2ft = fftshift(fft(abs(s2c(1,:)),NFFT));
len2c = length(sc2ft);
ind2c = (-(len2c-1)/2:1:(len2c-1)/2)*FS1c/2;
absc2 = abs(sc2ft)/max(abs(sc2ft));
subplot(1,3,2)
plot(ind2c,absc2);
title('Classic 2 : FT');


sc3ft = fftshift(fft(abs(s3c(1,:)),NFFT));
len3c = length(sc3ft);
ind3c = (-(len3c-1)/2:1:(len3c-1)/2)*FS1c/2;
absc3 = abs(sc3ft)/max(abs(sc3ft));
subplot(1,3,3)
plot(ind3c,absc3);
title('Classic 3 : FT');

%print('-dtiff','-r300','FreqMag_Classic.tif');

%% High-pass filter Classic (Figure 6)
% H(t) = sinc -> H(jw) = rect function
% h(t)*x(t) = H(jw)X(jw);

mask = ind1<-wc | ind1>wc;
hpc1 = absc1.*mask;
hpc2 = absc2.*mask;
hpc3 = absc3.*mask;

figure(6)
%subplot(1,3,1);
plot(ind1, hpc1)
title('Mozart: High-pass'); ylabel('Magnitude'); xlabel('Frequency (Hz)');
axis([-1e8 1e8 0 0.12]);

subplot(1,3,2);
plot(ind2, hpc2)
title('Classical 2: High-pass'); axis([-1e8 1e8 0 0.12]);

subplot(1,3,3);
plot(ind3, hpc3)
title('Classical : High-pass'); axis([-1e8 1e8 0 0.12]);

%print('-dtiff','-r300','HP_Classic.tif');

% %% Correlation Coefficients
% re1e2 = corr2(hpe1,hpe2)
% re1e3 = corr2(hpe1,hpe3)
% re2e3 = corr2(hpe2,hpe3)
% 
% rc1c2 = corr2(hpc1,hpc2)
% rc1c3 = corr2(hpc1,hpc3)
% rc2c3 = corr2(hpc2,hpc3)
% 
% re1c1 = corr2(hpe1,hpc1)
% re1c2 = corr2(hpe1,hpc2)
% re1c3 = corr2(hpe1,hpc3)
% 
% re2c1 = corr2(hpe2,hpc1)
% re2c2 = corr2(hpe2,hpc2)
% re2c3 = corr2(hpe2,hpc3)
% 
% re3c1 = corr2(hpe3,hpc1)
% re3c2 = corr2(hpe3,hpc2)
% re3c3 = corr2(hpe3,hpc3)

%% Create database.mat

save('database.mat', 'hpe1', 'hpe2', 'hpe3','hpc1', 'hpc2', 'hpc3');
