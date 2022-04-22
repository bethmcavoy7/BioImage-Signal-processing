im1=crop(imread('Img1.png'));
im2=crop(imread('Img2.png'));
im3=crop(imread('Img3.png'));
im4=crop(imread('Img4.png'));
im5=crop(imread('Img5.png'));
im6=crop(imread('Img6.png'));
gt1=crop(imread('Img1_GT.png'));
gt2=crop(imread('Img2_GT.png'));
gt3=crop(imread('Img3_GT.png'));
gt4=crop(imread('Img4_GT.png'));
gt5=crop(imread('Img5_GT.png'));
gt6=crop(imread('Img6_GT.png'));

gt1=imbinarize(gt1); 
gt2=imbinarize(gt2); 
gt3=imbinarize(gt3); 
gt4=imbinarize(gt4); 
gt5=imbinarize(gt5); 
gt6=imbinarize(gt6); 

threshold(1)=thresh(im1, gt1);
threshold(2)=thresh(im2, gt2);
threshold(3)=thresh(im3, gt3);
threshold(4)=thresh(im4, gt4);
threshold(5)=thresh(im5, gt5);
threshold(6)=thresh(im6, gt6);

k(1)=Kcluster(im1, gt1);
k(2)=Kcluster(im2, gt2);
k(3)=Kcluster(im3, gt3);
k(4)=Kcluster(im4, gt4);
k(5)=Kcluster(im5, gt5);
k(6)=Kcluster(im6, gt6);

segm(1)=seg(im1, gt1);
segm(2)=seg(im2, gt2);
segm(3)=seg(im3, gt3);
segm(4)=seg(im4, gt4);
segm(5)=seg(im5, gt5);
segm(6)=seg(im6, gt6);

Img={'img1';'img2';'img3';'img4';'img5';'img6'};
thresholding= threshold';
clustering=k';
segmentation=segm';

T = table(thresholding,clustering,segmentation,...
    'RowNames',Img)
filename = 'out.xlsx';
% 
% writetable(T,filename,'Sheet','MyNewSheet','WriteRowNames',true);


