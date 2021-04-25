img = imread('images/test512.png');


img = double(img)./255;

%% low pass filter
lpf = fspecial('gaussian', [12,12],4);

fimg_low = imfilter(img,lpf);

figure(1)
imshow(fimg_low)

%% high pass filter


hpf = fspecial('gaussian', [12,12],1);


for i = 1:length(hpf)
    for j = 1:length(hpf)
        hpf(i,j) = hpf(i,j)-lpf(i,j);
        
    end
end

fimg_high = imfilter(img,hpf);



figure(2)
imshow(fimg_high)
%% Image Scaling


%% Shading correction

simg = imread('images/checkerboard.png');

sclpf = fspecial('gaussian', [9,9],3);



simg_low = imfilter(simg, sclpf);



figure(3)
imshow(simg_low)

figure(4)
imshow(simg)

scimg = zeros(256,256,1);

for i = 1:length(simg)
    for j = 1:length(simg)
        scimg(i,j) = simg(i,j)/simg_low(i,j);
    end
end

scimg = scimg.*255;

scimg = uint8(scimg);

figure(5)
imshow(scimg)



%% Filtering in frequency domain

dft = fft2(img);



vdft = abs(dft); % visualisation of magnitude from discrete fourier transform ignores complex numbers



vdft = vdft./255; 

dft = dft./255;

vdft = fftshift(vdft);



figure(6)
imshow(vdft)

idft = ifft2(dft);

idft = idft.*255;
figure(7)
imshow(idft)



%% image filter using low pass domain filter

tstimg = imread('images/testimg.jpg');

tstimg = rgb2gray(tstimg);

dft_tst = fft2(tstimg);

lpf_tst = fspecial('gaussian', [size(tstimg,1),size(tstimg,2)], 5);


lpf_tst = lpf_tst.*255;


figure(8)
imshow(lpf_tst)


