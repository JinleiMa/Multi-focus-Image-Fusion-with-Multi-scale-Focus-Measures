clear all
close all

% I1 = imread('Multi-focus Images\bookA.tif'); I2 = imread('Multi-focus Images\bookB.tif');
% I1 = imread('Multi-focus Images\clockA.tif'); I2 = imread('Multi-focus Images\clockB.tif');
% I1 = imread('Multi-focus Images\deskA.tif'); I2 = imread('Multi-focus Images\deskB.tif');
% I1 = imread('Multi-focus Images\flowerA.tif'); I2 = imread('Multi-focus Images\flowerB.tif');
% I1 = imread('Multi-focus Images\labA.tif'); I2 = imread('Multi-focus Images\labB.tif');
% I1 = imread('Multi-focus Images\pepsiA.tif'); I2 = imread('Multi-focus Images\pepsiB.tif');
% I1 = imread('Multi-focus Images\cameramanA.tif'); I2 = imread('Multi-focus Images\cameramanB.tif');

I1 = imread('Multi-focus Images\lytro-10-A.jpg'); I2 = imread('Multi-focus Images\lytro-10-B.jpg');
% I1 = imread('Multi-focus Images\lytro-02-A.jpg'); I2 = imread('Multi-focus Images\lytro-02-B.jpg');
% I1 = imread('Multi-focus Images\lytro-01-A.jpg'); I2 = imread('Multi-focus Images\lytro-01-B.jpg');

% I1 = imread('Multi-focus Images\book1.bmp'); I2 = imread('Multi-focus Images\book2.bmp');
% I1 = imread('Multi-focus Images\flower1.bmp'); I2 = imread('Multi-focus Images\flower2.bmp');
tic
I1 = im2double(I1);I2 = im2double(I2);
img1 = I1;img2 = I2;

figure;imshow(img1);
figure;imshow(img2);

if size(I1,3) == 3
    I1 = rgb2gray(I1);
    I2 = rgb2gray(I2);
end

s1 = 5;%5
s2 = 11;%11
s3 = 17;%17

[map1,map2,map3] = Multiscale_SML(I1,I2,s1,s2,s3);

% figure;imshow(map1);
% figure;imshow(map2);
% figure;imshow(map3);


r1 = 5;%5
eps1 = 10^(-2);%0.01

r2 = 14;%14
eps2 = 10^(-3);

r3 = 21;%21
eps3 = 10^(-4);

[map1_guided,map2_guided,map3_guided] = Multiscale_Guided(I1, map1, map2, map3, r1, eps1, r2, eps2,r3, eps3);

% figure;imshow(map1_guided);
% figure;imshow(map2_guided);
% figure;imshow(map3_guided);



[X,Y,Z]=size(I1);
sigma = 0.01;

[x1,x2,x3,y1,y2,y3] = solvedirichletboundary(map1_guided,map2_guided,map3_guided,sigma,I1);

% figure;imshow(x1);
% figure;imshow(x2);
% figure;imshow(x3);

% y1 = reshape(y1,[X,Y]);
% y2 = reshape(y2,[X,Y]);
% y3 = reshape(y3,[X,Y]);
% figure;imshow(y1);
% figure;imshow(y2);
% figure;imshow(y3);


map = zeros(size(map1_guided));
map(x1 >= x2 & x1 >= x3) = map1_guided(x1 >= x2 & x1 >= x3);
map(x2 >= x1 & x2 >= x3) = map2_guided(x2 >= x1 & x2 >= x3);
map(x3 >= x1 & x3 >= x2) = map3_guided(x3 >= x1 & x3 >= x2);
% figure;imshow(map);


toc

r = 3;
eps = 0.01;
final_map = guidedfilter(I1, map, r, eps);
figure;imshow(final_map);


map = final_map;
if size(img1,3) == 1
    fused = map.*img1 + (1-map).*img2;
else
    fused(:,:,1) = map.*img1(:,:,1) + (1-map).*img2(:,:,1);
    fused(:,:,2) = map.*img1(:,:,2) + (1-map).*img2(:,:,2);
    fused(:,:,3) = map.*img1(:,:,3) + (1-map).*img2(:,:,3);
end
figure;imshow(fused);title('result');




% imwrite(final_map,'Multiscale_Random_Walk/flower1_map.jpg');
% imwrite(fused,'Multiscale_Random_Walk/flower1_result.jpg');


% imwrite(map,'lytro-15_map.jpg');
% imwrite(map,'lytro-15_map.jpg');
































