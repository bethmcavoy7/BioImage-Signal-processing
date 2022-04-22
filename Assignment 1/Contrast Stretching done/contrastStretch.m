%function contrastStretch done 

map= imread('x-ray_angiogram','jpg');
map= rgb2gray(map);

x1=33;     %halfway
x2=209;     %end of where picture is 
y1=100;     %halfway 
y2=255;     %using full scale

range1=0:x1;        %range in 1
range2=x1+1:x2;     %range in 2
range3=x2+1:255;      %range in 3 

%slopes 
m1=y1/x1;               %in 1
m2=(y2-y1)/(x2-x1);     %in 2
m3=(255-y2)/(255-x1);   %in 3 
%intercepts
b1=0;
b2=y1-(m2*x1);
b3=y2-(m3*x2);
%eqns of lines 
first=m1.*range1;
second=(m2.*range2)+b2;
third=(m3.*range3)+b3;
%Transfer function
T=[first second third];
x=0:255;
% 
figure(1)
plot(T),grid on;
xlim([0 255]);
ylim([0 255]);
axis auto;
xlabel('Input Intensity');
ylabel('Output Intensity');
title('Transfer Function');


[R C]=size(map);
pro=map;

for i=1:256
    for j=1:R
        for k=1:C
            if map(j,k)==x(i)
                pro(j,k)=T(i);
            end
        end
    end
end

figure(2)
subplot(1,2,1)
imshow(map)
title('Original Image');
axis image;
axis off;

subplot(1,2,2)
imshow(pro)
title('Processed Image');
axis image;
axis off;