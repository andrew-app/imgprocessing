function imgOut = clearBorder(imgIn)
% Clear objects touching the border of a binary image.
%
% Inputs:
%
%   imgIn - the binary image
%
% Outputs:
%
%   imgOut - the binary image with objects touching the border removed

% PLACE YOUR CODE HERE (SUBMIT THIS FILE WITH YOUR REPORT)
imin = imread('images/pills2.png');

imin = imbinarize(imin);

marker_img = zeros(size(imin,1),size(imin,2));

[r,c] = size(imin);

%% Marker Image

%First get mask image
for i = 1:size(imin,1) 
    for j = 1:size(imin,2)
        if (i == r || j == c || i == 1 || j == 1) %Make pixels around border 1 everything else 0
            marker_img(i,j) = imin(i,j);
        end
    end
end

B = strel('square',3);

marker_img = imbinarize(marker_img);

Rimg = zeros(size(imin,1),size(imin,2));

k = 0;
while 1
    dilimg = imdilate(marker_img,B);
    temp = Rimg;
    for i = 1:size(imin,1) 
        for j = 1:size(imin,2)
            Rimg(i,j) = bitand(dilimg(i,j),imin(i,j));
        end
    end
    
    va = nnz(Rimg); % current iteration
    vb = nnz(temp); % previous iteration
    if va == vb
        break
        
    else
        marker_img = Rimg;
        k = k+1;
    end
    
end


imOut = imin-Rimg;


fprintf('k= %d \n',k)


figure(1)
imshow(imOut)

figure(2)
imshow(imin)