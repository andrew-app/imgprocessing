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

<<<<<<< HEAD
nLvls = 8;
imgIn = imread('7292_linear.png');
ht = zeros(256,4,1);
=======
imgIn = imread('gsimg.png');
ht = zeros(256,2,1);
>>>>>>> 0ec94a03cdf17ededccd4c67236d1132ff52c465
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
    ht(a+1,2) = count;
    ht(a+1,3) = count/(356*length(imgIn));
    
end


%transform function

for b = 1:255
    d = 0;
    for c = b:-1:1
        d = d + ht(c,3);
    end
    ht(b,4) = round((nLvls-1) * d);
end

heq = histeq(imgIn,8);

figure(1)
histogram(imgIn)

figure(2)
<<<<<<< HEAD
imshow(imgIn)


for m = 1:356
    for n = 1:length(imgIn)
        for l = 0:255
            if imgIn(m,n) == l
                imgIn(m,n) = round(ht(l+1,4)*(255/nLvls));
                break
            end
        end
    end
end

imgout = im2uint8(imgIn);
imwrite(imgout, '7292_eq.png');

figure(3)
imshow(imgIn)



figure(4)
histogram(imgIn)

=======
plot(ht(:,1),ht(:,3))
figure(3);
histogram(ht)
imgOut = ht(imgIn+1);
%imshow(imgOut)
>>>>>>> 0ec94a03cdf17ededccd4c67236d1132ff52c465
end


