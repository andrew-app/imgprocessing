img = imread('test1.png');

M = [0.4124564 0.3575761 0.1804375; 0.2126729  0.7151522  0.0721750; 0.0193339  0.1191920  0.9503041];


lum = zeros(200,300);


for j = 1:200
    for k = 1:length(img)
        
       
        R = double(img(j,k,1));
        G = double(img(j,k,2));  
        B = double(img(j,k,3)); 
        
        
        
        R = R/255;
        G = G/255;
        B = B/255;
        
        RGB = [R; G; B];
        
        XYZ = M*RGB;
        

        lum(j,k) = XYZ(2);

        
    end
end



for j = 2:199
    for k = 2:length(lum)-1
        lumaM = lum(j,k);
        lumaTL = lum(j-1,k-1);
        lumaTR = lum(j-1,k+1);
        lumaBL = lum(j+1,k-1);
        lumaBR = lum(j+1,k+1);
        
        if (lumaTR - lumaBR) ~= 0 
            
            lum(j,k) = 1-0.2127;
        end
        
        
       
    end
end

figure(1)
imshow(lum)
    