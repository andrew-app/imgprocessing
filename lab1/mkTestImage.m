function imgOut = mkTestImage(x)
% Generate a test image for estimating monitor gamma.
%
% Inputs:
%
%   gLvl - the gray level to test [0,255]
%
% Output:
%
%   imgOut - the grayscale test image (256x256x1) (uint8)

% PLACE YOUR CODE HERE (SUBMIT THIS FILE WITH YOUR REPORT)

gLvl = x;


imgOut = zeros(256,256,1);

for a = 1:2:256
    for b = 1:2:256
    imgOut(a,b) = 1;
    end
end

for c = 2:2:256
    for d = 2:2:256
        imgOut(c,d) = 1;
    end
end

for e = 16:32:256
    for f = 1:16
    
    imgOut(e+f,:) = gLvl/255;
    
    end
    
end

imwrite(imgOut, 'test.png')

figure(1), imshow(imgOut)

index = 0;
gamma = 1.8984;
for ngl = 0:1:256
    index = index+1;
    if index < 256
    
        I(index) = (ngl/255).^(gamma);
        Iy(index) = (ngl/255).^(1/gamma);
        Is(index) = (ngl/255).^(2.2);
    end
end

x = linspace(0,255,255);

figure(2)

plot(x,I)
xlabel('normalized gray level')
ylabel('intensity')
hold on
plot(x,Iy)


plot(x,Is)
hold off
legend('tested','inverse','std')
end

