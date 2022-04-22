%graySlice done 
map= imread('x-ray_angiogram','jpg');
a=23;
b=57;
pro1=rgb2gray(map);
pro2=rgb2gray(map);
[r,c]=size(pro1);


for i=1:r
    for j=1:c
        if pro1(i,j)>=a && pro1(i,j) <=b
            pro1(i,j)=0;
            pro2(i,j)=0;
        else
            pro2(i,j)=200;
        end
    end
end

x=0:255;
y1=0:255;
y2=0:255;

for i=0:255
        if x(i+1)>=a && x(i+1)<=b
            y1(i+1)=0;
            y2(i+1)=0;
        else
            y2(i+1)=200;
        end
end

figure(1)
subplot(1,3,1)
imshow(map)
title('Original Image');
axis image;
axis off;

subplot(1,3,3)
imshow(pro1)
title('Increase a-b');
axis image;
axis off;

subplot(1,3,2)
imshow(pro2)
title('Increase a-b decrease the rest');
axis image;
axis off;

figure(2)
subplot(1,2,1)
plot(x,y1);
title('Decrease a-b');
subplot(1,2,2)
plot(x,y2);
title('Decrease a-b increase the rest');
axis auto;






