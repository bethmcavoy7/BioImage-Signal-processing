function score= Kcluster(img,gt)


L = imsegkmeans(img,3);
B = labeloverlay(img,L);


pro1=rgb2gray(B);
[r,c]=size(pro1);
pro2=rgb2gray(B);
pro3=rgb2gray(B);

for i=1:r
    for j=1:c
        if L(i,j)== 1
            pro1(i,j)=255;
        else
            pro1(i,j)=0;
        end
        if L(i,j)== 2
            pro2(i,j)=255;
        else
            pro2(i,j)=0;
        end
        if L(i,j)== 3
            pro3(i,j)=255;
        else
            pro3(i,j)=0;
        end
    end
end



pro1=imbinarize(pro1);
pro2=imbinarize(pro2);
pro3=imbinarize(pro3);

pro1=bwareafilt(pro1,1);
pro2=bwareafilt(pro2,1);
pro3=bwareafilt(pro3,1);

scores(1)=jaccard(pro1,gt);
scores(2)=jaccard(pro2,gt);
scores(3)=jaccard(pro3,gt);

[score, ind]=max(scores);
if ind==1
    figure
    imshow(pro1);
elseif ind==2
    figure
    imshow(pro2);
elseif ind==3
    figure
    imshow(pro3);
end





