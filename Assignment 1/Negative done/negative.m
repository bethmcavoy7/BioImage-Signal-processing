% negative done 
map= imread('x-ray_angiogram','jpg');
pro=255-map;

figure(1)
subplot(1,2,1)
image(map)
title('Original Image');
axis image;
axis off;

subplot(1,2,2)
image(pro)
title('Negative Image');
axis image;
axis off;

figure(2)
subplot(1,2,1)
imhist(map)
title('Original Image');

subplot(1,2,2)
imhist(pro)
title('Negative Image');
