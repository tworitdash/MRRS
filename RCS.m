[BScans,SweepTime,CentreFreq,Bandwidth,T] = ReadSiversBIN;

sphere_power = BScans.^2;

%BScans_fft = fftshift(fft(BScans));



%Time_data = BScans(:, 1);
%t = linspace(0, SweepTime, 512);

[BScans_cm,SweepTime_cm,CentreFreq_cm,Bandwidth_cm,T_cm] = ReadSiversBIN;


BScans_cm_mean = mean(BScans_cm.');
cm_power = BScans_cm_mean.^2;

%BScans_cm_fft = fftshift(fft(BScans_cm_mean));

[BScans_t,SweepTime_t,CentreFreq_t,Bandwidth_t,T_t] = ReadSiversBIN;
t_power = BScans_t.^2;


freq = linspace(-10e3, 10e3, 512);

p = 10*log10(sphere_power) - 10*log10(cm_power.');

p_t_db = 10*log10(t_power) - 10*log10(cm_power.') - (mean(p.')).';

p_t = fftshift(fft(p_t_db));

plot(freq, 10*log10(abs(p_t(:, 1))), 'LineWidth',2);

grid on;

