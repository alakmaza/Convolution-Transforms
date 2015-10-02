[sound,fs] = audioread('Flute1.wav'); sound = sound(:,1);
echPatHalf = [1, zeros(1,fs/2), 1/2, zeros(1,fs/2), 1/4, zeros(1,fs/2), 1/8, zeros(1,fs/2)];
csound = (conv(sound, echPatHalf))';
soundsc(csound, fs)

echPatOne = [1, zeros(1,fs), 1/2, zeros(1,fs), 1/4, zeros(1,fs), 1/8, zeros(1,fs)];
csound2 = conv(sound, echPatOne);
soundsc(csound2, fs)

echPatTwo = [1, zeros(1,2*fs), 1/2, zeros(1,2*fs), 1/4, zeros(1,2*fs), 1/8, zeros(1,2*fs)];
csound3 = conv(sound, echPatTwo);
soundsc(csound3, fs)

echPatRand = [1/4, zeros(1,fs), 1/2, zeros(1,fs/2), 1, zeros(1,2*fs), 1/2, zeros(1,fs/2)];
csound4 = conv(sound, echPatRand);
soundsc(csound4, fs);

maxLength = length(csound3);
csfit = horzcat(csound, zeros(1,maxLength - length(csound)));
cs2fit = horzcat(csound3, zeros(1,maxLength - length(csound3)));
%cs4fit = horzcat(csound4, zeros(1, maxLength - length(csound4)));

sum = csfit + cs2fit + csound3; %+ cs4fit;
soundsc(sum, fs);
