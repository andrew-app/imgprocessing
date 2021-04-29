%% morphical image processing

imgin = imread('images/pills1.png');

img = imbinarize(imgin);



figure(1)
imshow(img)

imwrite(img,'pills1_binary.png')

se = strel([50,50]);


imgero = imerode(img,se);
figure(2)
imshow(imgero)