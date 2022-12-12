close all
clear
clc

% / ()

t = 0:1/16:2;
signal = sin(2*pi*t);
vz_vektor = 0:1/100:2;

nearest = interp1(t, signal, vz_vektor, 'nearest');
linear = interp1(t, signal, vz_vektor, 'linear');
spline = interp1(t, signal, vz_vektor, 'spline');

subplot(3, 1, 1)
plot(vz_vektor, nearest, '.-')
subplot(3, 1, 2)
plot(vz_vektor, linear, '.-')
subplot(3, 1, 3)
plot(vz_vektor, spline, '.-')