close all
clear
clc

img = im2double(imread('mri.tif'));

% 1. 2D konvoluce
gauss_kernel = 1/16 .* [1, 2, 1; 2, 4, 2; 1, 2, 1];
edge_kernel = [0, -1, 0; -1, 5, -1; 0, -1, 0];
laplace_kernel = [0, 1, 0; 1, -4, 1; 0, 1, 0];

img_gauss = conv2(img, gauss_kernel);
img_edge = conv2(img, edge_kernel);
img_laplace = conv2(img, laplace_kernel);

figure('Name', '1')
subplot(2, 2, 1)
imshow(img)
title('original')

subplot(2, 2, 2)
imshow(img_gauss)
title('gaussův filtr')

subplot(2, 2, 3)
imshow(img_edge)
title('zvýraznění hran')

subplot(2, 2, 4)
imshow(img_laplace)
title('Laplaceův operátor')


% 2. 2D konvoluce bez inbuilt funkce conv2()
filtered_1 = convolution_fcn(img, gauss_kernel);
filtered_2 = convolution_fcn(img, edge_kernel);
filtered_3 = convolution_fcn(img, laplace_kernel);

figure('Name', '2')
montage({filtered_1, filtered_2, filtered_3})
title('filtrace pomocí vlastní fuknce pro konvoluci')

% 3. změna velikosti a gaussův filtr
img_70 = imgaussfilt(imresize(img, 0.7));
img_50 = imgaussfilt(imresize(img, 0.5));
img_30 = imgaussfilt(imresize(img, 0.3));
img_10 = imgaussfilt(imresize(img, 0.1));

figure('Name', '3')
subplot(2, 2, 1)
imshow(img_70)
title('70 %')

subplot(2, 2, 2)
imshow(img_50)
title('50 %')

subplot(2, 2, 3)
imshow(img_30)
title('30 %')

subplot(2, 2, 4)
imshow(img_10)
title('10 %')