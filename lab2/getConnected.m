function [x,y] = getConnected(x0,y0,img,T)
% Get connected 4-neighbours of pixel p at (x0,y0) for threshold T.
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
%   x - x-coordinates of all connected 4-neighbours of p
%   y - y-coordinates of all connected 4-neighbours of p

% PLACE YOUR CODE HERE (SUBMIT THIS FILE WITH YOUR REPORT)
x0 = 50;

y0 = 283;

img = imread('images/iceberg.png');

img = transpose(img);

T = 1;

xc = mod(x0,1);
yc = mod(y0,1);


if x0 > size(img,2) || x0 < 1 || xc ~= 0
    disp('Error. Outside Range of Pixel X-values or not an integer.')
    return
end

if y0 > size(img,1) || y0 < 1 || yc ~= 0
    disp('Error. Outside Range of Pixel Y-values or not an integer.')
    return
end

if x0 == 1
    if y0 == 1
        
        N = {[x0+1,y0],[x0,y0+1]};
        
    elseif y0 == size(img,1)
        N = {[x0-1,y0],[x0,y0+1]};
    else
        N = {[x0+1,y0],[x0,y0+1],[x0,y0-1]};
    end
    

    
elseif x0 == size(img,2)
    if y0 == 1
        N = {[x0-1,y0],[x0,y0+1]};
    elseif y0 == size(img,1)
        N = {[x0-1,y0],[x0,y0-1]};
    else
        N = {[x0-1,y0],[x0,y0+1],[x0,y0-1]};
    end
elseif y0 == 1
    
    
    N = {[x0-1,y0],[x0,y0+1],[x0+1,y0]};
elseif y0 == size(img,1)
    
    N = {[x0-1,y0],[x0,y0-1],[x0+1,y0]};
else
    N = {[x0+1,y0],[x0-1,y0],[x0,y0+1],[x0,y0-1]};
end
C = [];
for i = 1:length(N)
    q = N(i);
    
    q = cell2mat(q);

    Vq = img(q(2),q(1));

    Vp = img(y0,x0);

    diff =  abs(int32(Vq) - int32(Vp));
    
    if diff <= T
      
        C = [C,N(i)];
    end
end

if isempty(C)
    disp("No Connected Pixels")
else
    disp("Connected neighbours at: ")
    disp(C)
end

end