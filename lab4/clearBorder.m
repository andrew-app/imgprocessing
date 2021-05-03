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

tst = imclearborder(imin);

B = strel('disk', 1,0);

imin = imdilate(imin,B);
%% top frame

for i = 1:size(imin,1)
    if imin(1,i) == 1
        j = 1;
        while 1
            if imin(j,i) == 1 || imin(j+1,i) == 1
                imin(j,i) = 0;
                j = j + 1;
     
            else
                break
            end
        end
    
    end
    
end

%% left frame

for  i = 1:size(imin,2)
     if imin(i,1) == 1
        
        j = 1;
        while 1
            if imin(i,j) == 1 || imin(i,j+1) == 1 || imin(i-1,j+1) == 1 || imin(i-1,j) == 1
                imin(i,j) = 0;
                j = j + 1;
     
            else
                break
            end
        end
    
    end
end



figure(1)
imshow(tst)

figure(2)
imshow(imin)