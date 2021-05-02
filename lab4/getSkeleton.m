function s = getSkeleton(img)
% Calculate the skeleton of a binary image.
%
% Inputs:
%
%   img - the binary image
%
% Outputs:
%
%   s - a binary image containing the skeleton of img

% PLACE YOUR CODE HERE (SUBMIT THIS FILE WITH YOUR REPORT)

imgIn = imread('images/three.png');


imgO = imbinarize(imgIn);

for i = 1:size(imgO,1)
    for j = 1:size(imgO,2)
        if imgO(i,j) == 1
            imgO(i,j) = 0;
        elseif imgO(i,j) == 0
            imgO(i,j) = 1;
        end
    end
end

se = strel('disk', 2,0);

for i = 1:2
    imgO = imerode(imgO,se);
end

figure(1)
imshow(imgIn)
    
figure(2)
imshow(imgO)

