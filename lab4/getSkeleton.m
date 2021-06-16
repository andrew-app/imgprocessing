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

inimg = imbinarize(imgIn);



for i = 1:size(inimg,1)
    for j = 1:size(inimg,2)
        if inimg(i,j) == 1
            inimg(i,j) = 0;
        else
            inimg(i,j) = 1;
        end
    end
end

tst = bwmorph(inimg,'skel');


A = inimg;

B = strel('disk', 1,0);

k = 0;
skel = zeros(size(inimg,1),size(inimg,2));

skel = imbinarize(skel);

while 1
    inimg = imerode(A,B);
    temp = imdilate(inimg,B);
    
    
    for i = 1:size(inimg,1)
        for j = 1:size(inimg,2)
            temp(i,j) = A(i,j) - temp(i,j);
            skel(i,j) = bitor(skel(i,j),temp(i,j));
        end
    end    
    
    A = inimg; %eroded image becomes new binary image A 
    

    
    if nnz(A) == 0 %check for null set
        break
    
    else
        k = k+1; %K is max iterations to achieve null set in A
    end
    
end



figure(1)
imshow(skel)

disp(k)

figure(2)
imshow(tst)
