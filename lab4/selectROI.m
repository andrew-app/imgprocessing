function imgOut = selectROI(imgIn,sz)
% Select objects in a binary image within a circular ROI.
%
% Inputs:
%
%   imgIn - the binary image
%   sz - the radius (in pixels) of the circular ROI (centered on the image)
%
% Outputs:
%
%   imgOut - the binary image with objects outside the ROI removed

% PLACE YOUR CODE HERE (SUBMIT THIS FILE WITH YOUR REPORT)

imin = imread('images/pills2.png');

imin = imbinarize(imin);

temp = strel('disk',256,0);

maskimg = temp.Neighborhood;
ROI = zeros(size(imin,1),size(imin,2));

ROI = imbinarize(ROI);

if length(imin) > length(maskimg)
    
    x = (size(imin,1)-size(maskimg,1))/2;
    y = (size(imin,1)-size(maskimg,2))/2;
    
    
    x = round(x);
    y = round(y);
    scalemask = padarray(maskimg,[x,y],0);
    
    for i = 1:size(scalemask,1)
        for j = 1:size(scalemask,2)
            if scalemask(i,j) == 1
                ROI(i,j) = imin(i,j);
            end
        end
    
    end
    
else
    
    scalemask = maskimg;
    
    for i = 1:size(imin,1)
        for j = 1:size(imin,2)
            if scalemask(i,j) == 1
                ROI(i,j) = imin(i,j);
            end
        end
    
    end
end




figure(1)
imshow(ROI)
end
