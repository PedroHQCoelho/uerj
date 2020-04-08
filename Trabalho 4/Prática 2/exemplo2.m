clear all
close all
clc

im = imread('pout.tif');
imshow(im);
[x,y]=size(im);
imnegativo = im;
ime = im;

for i=1:x
    for j=1:y
        imnegativo(i,j) = -double(im(i,j)) + 255;
    end
end

figure
imshow(imnegativo)
histo = zeros(1,256)

for i=1:x
    for j=1:y
         histo(ime(i,j)+1) = histo(ime(i,j)+1) + 1;
    end
end

P = histo/(x*y);
S = zeros(1,256);

for i=1:256
    if i==1
        S(i) = 255 * P(i);
    else
        S(i) = S(i-1) + 255 * P(i);
    end
end

S = round(S);

for i=1:x
    for j=1:y
        ime(i,j) = S(ime(i,j)+1);
    end
end

figure
plot(S);
v=reshape(im,1,x*y);
figure;
hist(double(v),30);
v=reshape(ime,1,x*y);
figure
hist(double(v),30);
figure
imshow(ime);
