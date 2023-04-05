clear all

original_image = imread('original_image.jpg');
original_image_grayScale = rgb2gray(original_image); % convert image to greyscale

%whos
figure(1);
imshow(original_image);
title('Original Image');

% Perform a single-level wavelet decomposition.
% cA = coefficients matrix
% cH = horizontal coefficients matrix
% cV = vertical coefficients matrix
% cD = diagonal coefficients matrix

[cA,cH,cV,cD] = dwt2(original_image,'db1');

% map contains the loaded colormap of the input image
nbcol = size(original_image,1);

% Construct the one-level approximations and display details from the coefficients
%img_X = wcodemat(original_image_grayScale,nbcol); 

img_cA = wcodemat(cA,nbcol); 
img_cH = wcodemat(cH,nbcol); 
img_cV = wcodemat(cV,nbcol); 
img_cD = wcodemat(cD,nbcol); 

% display
figure(2);
%title('1-level Discrete Wevelet Transform Original Image');
subplot(2,2,1); image(img_cA);
title('Image Coefficient');
subplot(2,2,2); image(img_cH);
title('Horizontal Details');
subplot(2,2,3); image(img_cV);
title('Vertical Details'); 
subplot(2,2,4); image(img_cD);
title('Diagonal Details');