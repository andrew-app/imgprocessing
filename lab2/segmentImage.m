function R = segmentImage(img,T)
% Segment the supplied image by region-growing.
%
% Inputs:
%
%   img - the gray scale image to segment [0,255]
%   T   - the gray level threshold
%
% Output:
%
%   segmentation - the segmentation image

% PLACE YOUR CODE HERE (SUBMIT THIS FILE WITH YOUR REPORT)





% img = imread('images/iceberg.png');
% % 
% img = imresize(img,0.5);
% 
% T = 2;

x0 = 1;
y0 = 1;


segmentation = zeros(size(img,1),size(img,2),1);

R = {};
L = [];
m = 0;

lw = size(img,1)*size(img,2);

while 1
    C = rgrow(x0,y0,img,T);
    b = [];
    
    
    for k = 1:length(C)
        a = C{1,k};
        px = segmentation(a(2),a(1));
        if px == 0
            segmentation(a(2),a(1)) = 1;
            a = {a};
            b = [b,a];
        end
        
    end
    if ~isempty(b)
        R{end+1} = b;
        
        m = m + length(R{1,length(R)});
    end
    
    
    L = [L,{a}];
    if m == lw
        R{end+1} = L;
        break
    end
    
    if x0 == size(img,2) && y0 <= size(img,1)
        x0 = 1;
        y0 = y0 + 1;
        

        
    else
        x0 = x0+1;
        
    end
    
    
end

% imgOut = ones(size(img,1),size(img,2),1);
% 
% for q = 1:(length(R)-1)
%     w = R{1,q};
%     for n = 1:length(w)
%         z = w{1,n};
%         imgOut(z(2),z(1)) = ((255/length(R)) + q)/255; 
%     end
% end
% 
% 
% imgOut = imresize(imgOut,2.0);
% figure(1)
% imshow(imgOut)
% imwrite(imgOut,'segmented_all.png')
end






