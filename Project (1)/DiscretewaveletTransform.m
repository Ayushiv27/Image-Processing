clc
clear all
 
i = imread('original_image.jpg');
original_image_grayScale = rgb2gray(i); % convert image to greyscale
 
%whos
figure(1);
imshow(i);
sX=size(i);
[LL,LH,HL,HH]= dwt2(i,'db1');
figure(2)
subplot(2,2,1);imshow(LL);title('LL band of image');
subplot(2,2,2);imshow(LH);title('LH band of image');
subplot(2,2,3);imshow(HL);title('HL band of image');
subplot(2,2,4);imshow(HH);title('HH band of image');
