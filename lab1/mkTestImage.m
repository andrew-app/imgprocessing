function imgOut = mkTestImage(x)
% Generate a test image for estimating monitor gamma.
%
% Inputs:
%
%   gLvl - the gray level to test [0,255]
%
% Output:
%
%   imgOut - the grayscale test image (256x256x1) (uint8)

% PLACE YOUR CODE HERE (SUBMIT THIS FILE WITH YOUR REPORT)

gLvl = x;


imgOut = zeros(256,256,1);

for a = 1:2:256
    for b = 1:2:256
    imgOut(a,b) = 1;
    end
end

for c = 2:2:256
    for d = 2:2:256
        imgOut(c,d) = 1;
    end
end

for e = 4:8:256
    for f = 1:4
    
    imgOut(e+f,:) = gLvl/255;
    
    end
    
end

imwrite(imgOut, 'imgOut.png')

figure(1), imshow(imgOut)






end
