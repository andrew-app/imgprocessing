%% morphical image processing

imgin = imread('images/pills1.png');

img = imbinarize(imgin);

img(150,487) = 1;
img(151,487) = 1;


figure(1)
imshow(img)

imwrite(img,'pills1_binary.png')

se = strel('disk', 16,0);

se2 = strel('disk', 8,0);

imgero = imerode(img,se);
figure(2)
imshow(imgero)

imwrite(imgero, 'pills1_eroded.png')

imgdil = imdilate(imgero,se2);

figure(3)
imshow(imgdil)

imwrite(imgdil, 'pills1_dilated.png')


