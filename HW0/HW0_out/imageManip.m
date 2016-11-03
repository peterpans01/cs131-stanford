%reads in the image, converts it to grayscale, and converts the intensities
%from uint8 integers to doubles. (Brightness must be in 'double' format for
%computations, or else MATLAB will do integer math, which we don't want.)
dark = double(rgb2gray(imread('u2dark.png')));

%%%%%% Your part (a) code here: calculate statistics
m = mean(dark(:))
mi = min(dark(:))
ma = max(dark(:))


%%%%%% Your part (b) code here: apply offset and scaling
sca = (255 - mi)/ma
off = mi 
fixedimg = sca * dark + off;

%displays the image
%imshow(uint8(fixedimg));
%imshow(uint8(dark));

%%%%%% Your part (c) code here: apply the formula to increase contrast,
% and display the image
contrasted = 2 * (fixedimg - 128) + 128;
ind = find(contrasted < 0);
ind2 = find(contrasted > 255);
contrasted(ind) = 0;
contrasted(ind2) = 255;
imshow(uint8(contrasted));