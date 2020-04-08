clear all
close all
clc

im = imread('pout.tif');
imshow(im);
im1=im;
im2=im;
im3=im;
iminv=im;
[x,y]=size(im);
menor=im(1,1);
maior=im(1,1);
indx_menor=1;
indy_menor=1;
indx_maior=1;
indy_maior=1;

for i=2:x
    for j=2:y
        if im(i,j) > maior
            maior = im(i,j);
            indx_maior=i;
            indy_maior=j;
        end
        if im(i,j) < menor
            menor = im(i,j);
            indx_menor=i;
            indy_menor=j;
        end
    end
end

v=reshape(im,1,x*y);
figure
hist(double(v),30)

corte1=50;
corte2=120;
corte3=200;

for i=1:x
    for j=1:y
        if im1(i,j) < corte1
            im1(i,j)=0;
        else
            im1(i,j)=255;
        end
        if im2(i,j) < corte2
            im2(i,j)=0;
        else
            im2(i,j)=255;
        end
        if im3(i,j) < corte3
            im3(i,j)=0;
        else
            im3(i,j)=255;
        end
    end
end

figure
imshow(im1);
figure
imshow(im2);
figure
imshow(im3);
iminv(1,1)=im(x,y);
iminv(x,y)=im(1,1);
for i=1:x
    for j=1:y
        iminv(i,j)=im((x+1)-i,(y+1)-j);
    end
end

figure
imshow(iminv)