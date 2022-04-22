%% y
f1=fopen('408_ECG_5Y.txt');
y=fscanf(f1,'%f');
mat=ones(size(y));
mat=mat.*8;
y=y-mat;

int3y=y(288000:289250);      %1250 = 5sec
int3y=smooth(int3y);

rate=1/250;

[pks,locs] = findpeaks(int3y);       %find all the peaks 

high=find(pks>=2);
for j= 1:size(high)
    peakR(j)=locs(high(j));
end

peakR=peakR*rate;       %convert to seconds
beats=max(size(peakR));

for k=1:(beats-1)
    NNint(k)=abs(peakR(k)-peakR(k+1));
end

%figure()
plot(NNint);
% hold on
% plot(NNint,'ro')
title("int3y")
axis tight

avg=mean(NNint);
minval=min(NNint);
maxval=max(NNint);


%% 
% %% o
% f2=fopen('408_ECG_5O.txt');
% o=fscanf(f2,'%f');
% mat=ones(size(o));
% mat=mat.*8;
% o=o-mat;
% 
% int3o=y(288000:288250);      %250 = 1sec
% int3o=smooth(int3o);
% 
% rate=1/250;
% 
% [pks,locs] = findpeaks(int3y);       %find all the peaks 
% 
% high=find(pks>=2);
% for j= 1:size(high)
%     peakR(j)=locs(high(j));
% end
% 
% peakR=peakR*rate;       %convert to seconds
% beats=max(size(peakR));
% 
% for k=1:(beats-1)
%     NNint(k)=abs(peakR(k)-peakR(k+1));
% end
% 
% %figure()
% plot(NNint);
% % hold on
% % plot(NNint,'ro')
% title("int3o")
% axis tight
% 
% avg=mean(NNint);
% minval=min(NNint);
% maxval=max(NNint);



