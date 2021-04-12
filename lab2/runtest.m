
img = imread('images/iceberg.png');

img = imresize(img,0.25);

% Tx = [];
% 
% n = [];
% for T = 2:10
%     Tx = [Tx,T];
%     R = segmentImage(img,T);
%     n = [n,length(R)];
% 
% 
% 
% figure(1)
% plot(Tx,n)
% 
% xlabel('T(gLvl Threshold)')
% ylabel('n(number of regions)')

T = 10;

k = segmentImage(img,T);


imgOut = zeros(size(img,1),size(img,2),1);

major = [];

for i = 1:length(k)
    a = k{1,i};
    
    if length(a) >= 250
        major = [major,{a}];
    end
    
end


glvl = (255/4)/255;
for j = 1:length(major)-1
    b = major{1,j};
    
    for l = 1:length(b)
        c = b{1,l};
        
        imgOut(c(2),c(1)) = glvl*j;
    end
end

imgOut = imresize(imgOut,4.0);

imwrite(imgOut,'segmented.png')
figure(1)
imshow(imgOut)
