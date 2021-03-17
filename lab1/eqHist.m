function imgOut = eqHist(imgIn,nLvls)
% Global image histogram equalization.
%
% Input:
%
%   imgIn - grayscale image input (NxMx1)
%   nLvls - the desired number of levels in the grayscale output image
%
% Output:
%
%   imgOut - grayscale output image (NxMx1)

% PLACE YOUR CODE HERE (SUBMIT THIS FILE WITH YOUR REPORT)
imgIn = imread('gsimg.png');
ht = zeros(256,3,1);
for a = 0:255
    count = 0;
    for i = 1:356
        for j = 1:length(imgIn)
            if imgIn(i,j) == a
               count = count + 1; 
                
            end
        end
    end
    ht(a+1,1) = a;
    ht(a+1,2) = count/(356*length(imgIn));
    
end


figure(1)
imhist(imgIn)

%transform function

for b = 1:255
    d = 0;
    for c = b:-1:1
        d = d + ht(c,2);
    end
    ht(b,3) = 255 * d;
end


figure(2)
plot(ht(:,1),ht(:,3))

disp(ht)
end


