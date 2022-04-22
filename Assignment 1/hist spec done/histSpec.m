map=imread('chest_x-ray2','jpg');
[r,c]=size(map);
[num,intense]=imhist(map);
pro=map;
pdf=num/(r*c);
cdf=255*(cumsum(pdf));
cdfrnd=round(cdf);

for r = 0:255
T(r+1)=cdfrnd(r+1); 
end


spec=imread('chest_x-ray3','jpg');
[sr,sc]=size(spec);
[snum,intense]=imhist(spec);
spdf=snum/(sr*sc);
scdf=255*(cumsum(spdf));
scdfrnd=round(scdf);

for z = 0:255
G(z+1)=scdfrnd(z+1); 
end

M=zeros(256,1,'uint8');
z0=zeros(r,c);
for i=1:256
    [~,s]=min(abs(cdfrnd(i)-scdfrnd));
    M(i)=s-1;
    
end

matched=M((map)+1);


figure(1)
subplot(1,2,1)
imshow(map)
title('Original Image');
axis image;
axis off;

subplot(1,2,2)
imshow(matched)
title('Histogram Matched');
axis image;
axis off;

figure(2)
subplot(1,3,1)
imhist(map)
title('Original Image');

subplot(1,3,2)
imhist(spec)
title('Specified Image');

subplot(1,3,3)
imhist(matched)
title('Histogram Matched');




            
         

