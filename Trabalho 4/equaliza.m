original = imread('einstein.bmp');
equalizada=histeq(original,10);
subplot(2,2,1)
imshow(original)
title('Imagem Original')
subplot(2,2,2)
imshow(equalizada)
title('Imagem Equalizada')
subplot(2,2,3)
imhist(original)
subplot(2,2,4)
imhist(equalizada) 
