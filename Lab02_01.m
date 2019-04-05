[BScans,SweepTime,CentreFreq,Bandwidth,T] = ReadSiversBIN;

BScans_dtrend  = detrend(BScans);

%delR = 3e8/bandwidth;

BScan_freq = fftshift(fft(BScans_dtrend));

Samp_freq = size(BScans, 1) / SweepTime;


freq = linspace(-10e3, 10e3, 512);

plot(freq, abs(BScan_freq(:, 1)), 'LineWidth',2);
grid on;




