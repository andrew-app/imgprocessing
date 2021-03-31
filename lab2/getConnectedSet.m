function [x,y] = getConnectedSet(x0,y0,img,T)
% Get the connected set for pixel p at (x0,y0) and threshold T.
%
% Inputs:
%
%   x0 - x-coordinate of the pixel p
%   y0 - y-coordinate of the pixel p
%   img - the grayscale image
%   T - the gray level threshold
%
% Outputs:
%
%   x - x-coordinates of all pixels in the connected set
%   y - y-coordinates of all pixels in the connected set

% PLACE YOUR CODE HERE (SUBMIT THIS FILE WITH YOUR REPORT)

x0 = 190;

y0 = 180;

img = imread('images/iceberg.png');

T = 2;

S = [];

imgOut = ones(267,283,1);


for i = 2:size(img,1)-1
    for j = 2:size(img,2)-1
        if img(i,j)-img(x0,y0) <= T
            
                
            C = {[i,j]};
            S = [S, C];
            imgOut(i,j) = 0;
            
        
        end
        
            
    end
end


for k = 1:length(S)

    p = cell2mat(S(k));
    
    N = {[p(1)+1,p(2)],[p(1)-1,p(2)],[p(1),p(2)+1],[p(1),p(2)-1],[p(1)-1,p(2)+1],[p(1)-1,p(2)-1],[p(1)+1,p(2)+1],[p(1)+1,p(2)-1]};
    
    D = [];
    for l = 1:length(N)
        chk = cell2mat(N(l));
        diff = abs(int32(imgOut(p(1),p(2)))-int32(imgOut(chk(1),chk(2))));
                
        if diff == 0
            D = [D,1];
            
        end
        
                
    end
    
    if isempty(D)
        imgOut(p(1),p(2)) = 1;
    end
    
end
    


figure(1)
imshow(imgOut)

figure(2)
imshow(img)

imwrite(imgOut,'setT2.png')

end