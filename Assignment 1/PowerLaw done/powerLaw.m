% powerLaw done 
map= imread('x-ray_angiogram','jpg');
map=rgb2gray(map);
proc1=255/(255^0.5);
proc2=255/(255^1.2);



pro1=proc1*double(map).^0.5; 
pro2=proc2*double(map).^1.2;

pro1=uint8(pro1);
pro2=uint8(pro2);


x=0:255;
c1=255/(255^0.5);
c2=255/(255^1.2);

y1=c1*(x).^0.5; 
y2=c2*(x).^1.2; 

figure(1)
title('Tranfer Function');
plot(x,y1);
hold on;
plot(x,y2);
legend('gamma=0.5','gamma=1.2')
axis auto;
hold off;


figure(2)
subplot(1,3,1)
imshow(map)
title('Original Image');
axis image;
axis off;

subplot(1,3,2)
imshow(pro1)
title('0.2 Image');
axis image;
axis off;

subplot(1,3,3)
imshow(pro2)
title('2 Image');
axis image;
axis off;