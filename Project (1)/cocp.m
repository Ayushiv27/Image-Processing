clear all
x=rgb2gray(imread('flower.jpg'));
[r,c]=size(x);
y=imresize(rgb2gray(imread('flower1.jpg')),[r,c]);
size_y=size(y);
cc=corr2(x,y)
imshow(x),figure,imshow(y)