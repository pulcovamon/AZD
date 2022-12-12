close all
clear
clc
warning off

% 1. dopředná neuronová síť
% vytvoření sin(x)
x = 0:pi/50:6*pi;
y = sin(x);

% vykreslení trénovacích dat
subplot(2, 1, 1)
plot(x, y)
hold on
title('dopředná neuronová síť')
xlabel('x')
ylabel('sin(x)')

% zkusila jsem dát více neuronů v 1. skryté vrstvě, protože se dvěma to
% vůbec nefungovalo
net = newff(minmax(x), [10, 1], {'tansig', 'purelin'}, 'traingdm');
net.trainParam.showWindow = 0;
net.trainParam.goal = 1e-5;
net = train(net, x, y);

% testovací data
x_test = 0:pi/100:6*pi;
y_test = net(x_test);

% vykreslení outputu ze sítě
plot(x_test, y_test)
legend('training data', 'net output')
hold off

% 2. perceptron
% nenašla jsem data, která máme použít, tak jsem si je vytvořila
x = rand(2, 100);
y = zeros(1, 100);
% zařazení dat, kde je x > 0.5 do skupiny 1, zbytek do skupiny 0
y(x(1,:) > 0.5) = 1;

% vytvoření a trénování sítě
net = perceptron;
net.trainParam.showWindow = 0;
net.trainParam.goal = 1e-5;
net = train(net, x, y);

% testovací data
x_test = rand(2, 100);
y_test = net(x_test);

% vykreslední outputu s přímkou, která rozděluje skupiny
subplot(2, 1, 2)
plotpv(x, y)
hold on
xlabel('x')
ylabel('y')
plotpv(x_test,y_test);
plotpc(net.iw{1,1},net.b{1})
title('perceptron')
hold off;
