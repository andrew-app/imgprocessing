function imgOut = sRGBToGray(imgIn)
% Convert a linear sRGB image to a linear grayscale image.
%
% Input:
%
%   imgIn - linear sRGB input (NxMx3)
%
% Output:
%
%   imgOut - linear grayscale output (NxMx1)

% PLACE YOUR CODE HERE (SUBMIT THIS FILE WITH YOUR REPORT)

imgIn = imread('images/7292.png');

imgOut = rgb2gray(imgIn);

imgOut = im2single(imgOut);

M = [0.4124564 0.3575761 0.1804375; 0.2126729  0.7151522  0.0721750; 0.0193339  0.1191920  0.9503041];

outim = zeros(356,536,1);
gammaim = zeros(356,536,1);
for j = 1:356
    for k = 1:length(imgIn)
        
       
        R = double(imgIn(j,k,1));
        G = double(imgIn(j,k,2));  
        B = double(imgIn(j,k,3)); 
        
        
        
        R = R/255;
        G = G/255;
        B = B/255;
        
        RGB = [R; G; B];
        
        XYZ = M*RGB;
        
<<<<<<< HEAD
        outim(j,k) = XYZ(2).^(1/1.8984); %only care about luminance and then gamma correction 
        imgOut(j,k) = imgOut(j,k).^(1/1.8984);
=======
        gammaim(j,k) = (XYZ(2)).^(1/1.8984); %only care about luminance and then gamma correction 
        
        outim = XYZ(2);
>>>>>>> 0ec94a03cdf17ededccd4c67236d1132ff52c465
        
    end
    
    
end

<<<<<<< HEAD

%imwrite(outim, '7292_corrected.png');
%imwrite(outim, '7292_linear.png');

=======
>>>>>>> 0ec94a03cdf17ededccd4c67236d1132ff52c465


outim = im2uint8(outim);

imwrite(gammaim, 'gsimg.png');




figure(3)
imshow(gammaim)

figure(4)
imshow(imgOut)

figure(5)
histogram(gammaim)
xlabel('Intensity')
ylabel('Count')
end
