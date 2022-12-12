clc; clear; close all;
%% Nacteni a zobrazeni dat

dataCV1 = load('dataCV1.mat');

years = dataCV1.data(1,:);
raw_data = dataCV1.data(2,:);

font = 'Times';

%% Aplikace MA filtru

MA = zeros(1, length(raw_data) - 2);
years_filt = years(2:end - 1);

% window_size = 3;

for j = 2:(length(raw_data)- 1)
    
    MA(j - 1) = mean(raw_data(j-1:j+1));
    
end

figure
plot(years, raw_data)
hold on
plot(years_filt, MA)
grid on
xlabel('year', 'FontName', font)
ylabel('number of deaths', 'FontName', font)
legend('raw data', 'filtered data', 'FontName', font)

%% Savitzky Golay FIR
load('realmeeg.mat')
real_mEEG=realmEEG(:,1:2000);
font = 'Times';
order = 3;
% frame_len = 15;

% filt_mEEG = sgolayfilt(real_mEEG, order, frame_len);

for j = 5:2:101
    frame_len = j;
    filt_mEEG = sgolayfilt(real_mEEG, order, frame_len);
    plot(real_mEEG)
    hold on
    plot(filt_mEEG)
    grid on
    legend('raw data', 'filtered data', 'FontName', font)
    xlabel('time (s)', 'FontName', font)
    ylabel('mEEG ({\mu}V)', 'FontName', font)
    waitforbuttonpress                          % počká na tlačítko
    
end
figure
plot(real_mEEG)
hold on
plot(filt_mEEG)
grid on
legend('raw data', 'filtered data', 'FontName', font)
xlabel('time (s)', 'FontName', font)
ylabel('mEEG ({\mu}V)', 'FontName', font)