function done =crop(img)


dim=size(img);
width= dim(2)-50;
length=dim(1)-100;

done=imcrop(img,[50 50 width length]);
done=rgb2gray(done);
