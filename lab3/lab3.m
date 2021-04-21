img = imread('images/test512.png');


img = double(img)./255;

%%low pass filtered image
lpf = fspecial('gaussian', [12,12],4);

fimg_low = imfilter(img,lpf);

figure(1)
imshow(fimg_low)

%%high pass filter


hpf = fspecial('gaussian', [12,12],1);


for i = 1:length(hpf)
    for j = 1:length(hpf)
        hpf(i,j) = hpf(i,j)-lpf(i,j);
        
    end
end

fimg_high = imfilter(img,hpf);



figure(2)
imshow(fimg_high)