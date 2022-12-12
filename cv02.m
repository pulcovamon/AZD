close all
clear
clc

data = load('dataCV2.csv');

T = data(:,2);
c_CO2 = data(:,1);

subplot(2,2,1)
plot(T, c_CO2)
xlabel('Year', 'fontName', 'Times')
ylabel('Concentration of CO_{2}', 'fontName', 'Times')
hold on

% find parameters of linear function (metoda nejmenších čtverců)
parameters = polyfit(T, c_CO2, 1);
trend = parameters(1) * T + parameters(2);

new_data = c_CO2 - trend;

subplot(2,2,1)
plot(T, trend)

subplot(2,2,2)
plot(T, new_data)
xlabel('Year', 'fontName', 'Times')
ylabel('Concentration of CO_{2}', 'fontName', 'Times')

fourier_t = abs(fft(new_data));
% normovaná frekvence
freq = linspace(0, 1 , length(fourier_t));

subplot(2,2,3)
% vykreslí body
stem(freq, fourier_t)
xlabel('frequence')
ylabel('FFT')

% diference
filtered_data = new_data(13:end) - new_data(1:end-12);
T_new = T(13:end);
subplot(2,2,4)
plot(T_new, filtered_data)

% chtělo by to vykreslit i fft z původních a filtrovaných dat