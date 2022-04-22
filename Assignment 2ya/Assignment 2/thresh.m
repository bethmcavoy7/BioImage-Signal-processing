function score = thresh(img, gt) 


Id = im2double(img);
Id(Id == 0 ) = NaN;
Imax = max(Id(:));
Imin = min(Id(:));
T = 0.5*(Imin + Imax);
[r,c]=size(Id);
countL =0;
countR =0;
left=0;
right=0;
diff=1;

while(diff>.1)
    for i=1:r
        for j=1:c
            if ~isnan(Id(i,j))
                if Id(i,j) < T
                    countL = countL + 1;
                    left = left + Id(i,j);
                else
                    countR = countR + 1;
                    right = right + Id(i,j);
                end
            end
        end
    end
   Tnew=(0.5*(left/countL +right/countR));
   diff=T-Tnew;
   T=Tnew;
end

binIm = Id >= T;

out=bwareafilt(binIm,1);
   
score=jaccard(out,gt);
% figure
% imshow(out);


