function score = seg(img, gt)


[height, width] = size(img);

PreProcessThreshold = 113;
for rows = 1:height
    for cols = 1:width
        value = img(rows, cols);
        if value < PreProcessThreshold
            img(rows, cols) = 0;
        end
    end
end
 
[~,t] = edge(img, 'prewitt');
errorCorrection = 0.3;
imedge = edge(img, 'prewitt', t*errorCorrection);

struce90 = strel('line', 2, 90);
struce0 = strel('line', 2, 0);
se = [struce90 struce0];

imageDilated = bwareafilt(logical(imdilate(imedge,se)), 1);

B = bwboundaries(imageDilated);
per=[];
for k = 1: 1: size(B,1)
    per = [per size(B{k,:},1)];
end

cell=B(find(per==max(per)),:);
tumor= cell{:};
 
x=tumor(:,2);
y=tumor(:,1);
pro1=zeros(size(imageDilated));
for k = 1 : 1 : numel(x)
    pro1(y(k), x(k)) = 1;
end


pro1 = imfill(pro1, 'holes');
pro1 = logical(pro1);
score = jaccard(pro1, gt);
% figure
% imshow(pro1);
