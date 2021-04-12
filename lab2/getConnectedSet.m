function R = getConnectedSet(x0,y0,img,T)
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


img = imread('images/iceberg.png');

T = 2;

x0 = 190;
y0 = 180;
R = [];
L = [];
imgOut = ones(267,283,1);

a = img(1,175);

for i = 1:size(img,1)
    for j = 1:size(img,2)
        if abs(int32(img(i,j))-int32(img(y0,x0))) <= T

            c = {[i,j]};

            R = [R,c];

            d = {[j,i]};
            
            L = [L,d];
            imgOut(i,j) = 0;
        end

    end
end

    


figure(1)

imshow(imgOut)

imwrite(imgOut,'unfiltered.png')

for k = 1:length(R)

    p = cell2mat(R(k));
    
    if p(1) == 1 
        if p(2) == 1
           N = {[p(1)+1,p(2)],[p(1),p(2)+1],[p(1)+1,p(2)+1]}; %top left corner 
        elseif p(2) == size(img,2)
           N = {[p(1)+1,p(2)],[p(1),p(2)-1],[p(1)+1,p(2)-1]}; %bottom left corner
        else
           N = {[p(1)+1,p(2)],[p(1),p(2)+1], [p(1)+1,p(2)-1], [p(1)+1,p(2)+1], [p(1),p(2)-1]}; % left edge
        end    
    elseif p(1) == size(img,1)
        if p(2) == 1
            N = {[p(1)-1,p(2)],[p(1),p(2)+1],[p(1)-1,p(2)+1]}; %top right corner
        elseif p(2) == size(img,2)
            N = {[p(1)-1,p(2)],[p(1)-1,p(2)-1],[p(1),p(2)-1]}; %bottom right corner
        else
            N = {[p(1)-1,p(2)],[p(1),p(2)+1],[p(1),p(2)-1],[p(1)-1,p(2)-1],[p(1)-1,p(2)+1]}; % right edge
        end
    elseif p(2) == 1
        N = {[p(1)+1,p(2)],[p(1)-1,p(2)],[p(1),p(2)+1],[p(1)-1,p(2)+1],[p(1)+1,p(2)+1]}; % top edge
    elseif p(2) == size(img,2)
        N = {[p(1)+1,p(2)],[p(1)-1,p(2)],[p(1),p(2)-1],[p(1)-1,p(2)-1],[p(1)+1,p(2)-1]}; %bottom edge
    else
        N = {[p(1)+1,p(2)],[p(1)-1,p(2)],[p(1),p(2)+1],[p(1),p(2)-1],[p(1)-1,p(2)+1],[p(1)-1,p(2)-1],[p(1)+1,p(2)+1],[p(1)+1,p(2)-1]}; % everywhere else
    end
        
    
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
    


figure(2)
imshow(imgOut)

figure(3)
imshow(img)

imwrite(imgOut,'setT2.png')

end