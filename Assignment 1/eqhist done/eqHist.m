%equalHist() done 
map= imread('chest_x-ray1','jpg');
[r,c]=size(map);
[num, intense]=imhist(map);

pdf= num/(r*c); 
cdf=255*(cumsum(pdf));

cdfrnd=round(cdf);

pro=zeros(size(map));

for i=1:256
   pro(map==i-1)=cdfrnd(i);
end
pro=mat2gray(pro);

figure(1)
subplot(1,2,1)
imshow(map)
title('Original Image');
axis image;
axis off;

subplot(1,2,2)
imshow(pro)
title('Histogram Equalized');
axis image;
axis off;

figure(2)
subplot(1,2,1)
imhist(map)
title('Original Image');

subplot(1,2,2)
imhist(pro)
title('Histogram Equalized');


