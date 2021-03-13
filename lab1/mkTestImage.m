function imgOut = mkTestImage(x,varargin)
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
x = 127

gLvl = x;


image = zeros(255,256,1);

for a = 1:2:255
    for b = 1:2:256
    image(a,b) = 1;
    end
end

for c = 2:2:255
    for d = 2:2:256
        image(c,d) = 1;
    end
end

for e = 5:9:255
    for f = 1:3
    
    image(e+f,:) = gLvl/255;
    
    end
    
end


figure(1), imshow(image)



end

