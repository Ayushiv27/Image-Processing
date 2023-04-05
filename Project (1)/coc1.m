x=rgb2gray(imread('original_image.jpg'));
[r,c]=size(x);
y=imresize(rgb2gray(imread('test_image.jpg')),[r,c]);
size_y=size(y);
cc=corr2(x,y)