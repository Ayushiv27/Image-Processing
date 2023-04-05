clear all
 
original_image = imread('original_image.jpg');
original_image_grayScale = rgb2gray(original_image); % convert image to greyscale
 
mean_original_image = mean(original_image_grayScale(:));
 
reference_image = imread('test_image.jpg');
reference_image_grayScale = rgb2gray(reference_image); % convert image to greyscale
 
mean_reference_image = mean(reference_image_grayScale(:));
 
% -- set frame size variables -----
frame_size_original_image = size(original_image_grayScale); 
width = frame_size_original_image(2);   % 259
height = frame_size_original_image(1);  % 194
 
frame_size_reference_image = size(reference_image_grayScale);
crop_width = frame_size_reference_image(2);   % 259
crop_height = frame_size_reference_image(1);  % 194
 
 
%%%%%%%%%%%%%%%%%
for i = 1:crop_height
   for j = 1:crop_width     
          refDiffUpper(i,j) = reference_image_grayScale(i,j) - mean_reference_image;
          refDiffLower(i,j) = (reference_image_grayScale(i,j) - mean_reference_image)^2;
   end
end
 
refDiffUpper1 = sum(refDiffUpper(:));
refDiffLower1 = sum(refDiffLower(:));
refDiffLower2 = sqrt(refDiffLower1(:));
 
for i = 1:height
   for j = 1:width     
          orgDiffUpper(i,j) = original_image_grayScale(i,j) - mean_original_image;
          orgDiffLower(i,j) = (original_image_grayScale(i,j) - mean_original_image)^2;
          if orgDiffLower(i,j) <= 0 
             orgDiffLower(i,j) = 1;
          end
   end
end
 
orgDiffUpper1 = sum(orgDiffUpper(:));
orgDiffLower1 = sum(orgDiffLower(:));
orgDiffLower2 = sqrt(orgDiffLower1(:));
 
 
%    refDiffUpper1;
%    refDiffLower1;
%    refDiffLower2;
%    orgDiffUpper1;
%    orgDiffLower1;
%    orgDiffLower2;          
 
correlation = (orgDiffUpper1 * refDiffUpper1) / (orgDiffLower2 * refDiffLower2);        
 
correlation
 
imshow(original_image),figure,imshow(reference_image)         
     
