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

imgInput = imread('images/thumbprint.png');


se = strel('disk', 2,0);

se2 = strel('disk', 1,0);

imgO = imerode(imgInput,se2);

imgO = imdilate(imgO,se);




figure(1)
imshow(imgO)

figure(2)
imshow(imgInput)

imwrite(imgO, 'thumbprint_filtered.png')


