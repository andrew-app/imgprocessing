img = imread('images/test512.png');


img = double(img)./255;

%% low pass filter


lpf = fspecial('gaussian', [24,24],4);



fimg_low = imfilter(img,lpf);

lpf_s = lpf.*255;

figure(1)
imshow(fimg_low)

imwrite(lpf_s,'gausslp.png')
imwrite(fimg_low,'testlp.png')

%% high pass filter

fimg_high = zeros(size(img,1),size(img,2),1,'double');

for i = 1:size(img,1)
    for j = 1:size(img,2)
        fimg_high(i,j) = img(i,j) - fimg_low(i,j);
    end
end

imwrite(fimg_high,'testhp.png')

figure(2)
imshow(fimg_high)
%% Image Scaling

img_rz = imresize(img,0.5,'bicubic');

fimg_rz = imfilter(img_rz,lpf);
imwrite(fimg_rz,'scaledlp1.png')
figure()

imshow(fimg_rz)
fimg_rz = imresize(fimg_rz,2,'bicubic');

fimg_rz = uint8(fimg_rz.*255);
figure()

imshow(fimg_rz)




%% Shading correction

simg = imread('images/checkerboard.png');

sclpf = fspecial('gaussian', [64,64],12);



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

sclpf = sclpf.*(255.^2);

sclpf = uint8(sclpf);


figure(5)
imshow(sclpf)


simg_low = uint8(simg_low);
imwrite(sclpf, 'kernel.png')
imwrite(scimg, 'corrected.png')
imwrite(simg_low, 'shading.png')


%% Filtering in frequency domain

dft = fft2(img);



vdft = abs(dft); % visualisation of magnitude from discrete fourier transform ignores complex numbers




dft = dft./255;

vdft = fftshift(vdft);

vdft = uint8(vdft);

figure(6)
imshow(vdft)

imwrite(vdft,'dft.png')

idft = ifft2(dft);

idft = idft.*255;
figure(7)
imshow(idft)



%% image filter using low pass domain filter

imgin = imread('images/testimg.jpg');

tstimg = rgb2gray(imgin);

tstimg = double(tstimg);

dft_tst = fft2(tstimg);


dft_tst = fftshift(dft_tst);

lpf_tst = fspecial('gaussian', [size(tstimg,1),size(tstimg,2)], 5);

lpf_tst = fftshift(lpf_tst);

G = imfilter(dft_tst,lpf_tst);

oimg = ifft2(G);

oimg = abs(oimg);

figure(8)
imshow(oimg)

figure(9)
imshow(imgin)


imwrite(oimg,'ftestlp5.png')