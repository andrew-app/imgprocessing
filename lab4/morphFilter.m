function imgOut = morphFilter(imgIn)
% Perform morphological filtering on a binary image.
%
% Inputs:
%
%   imgIn - the binary image
%
% Outputs:
%
%   imgOut - the filtered binary image

% PLACE YOUR CODE HERE (SUBMIT THIS FILE WITH YOUR REPORT)

imgIn = imread('images/thumbprint.png');


se = strel('disk', 2,0);

se2 = strel('disk', 1,0);

imgOut = imerode(imgIn,se2);

imgOut = imdilate(imgOut,se);




figure(1)
imshow(imgOut)

figure(2)
imshow(imgIn)