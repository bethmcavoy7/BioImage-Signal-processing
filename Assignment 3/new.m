function [p]=new(segment)

rate=1/250;

[pks,locs] = findpeaks(segment);       %find all the peaks 

high=find(pks>=2);
for j= 1:size(high)
    peakR(j)=locs(high(j));
end

peakR=peakR*rate;       %convert to seconds
beats=max(size(peakR));

for k=1:(beats-1)
    NNint(k)=abs(peakR(k)-peakR(k+1));
end

avg=mean(NNint);
minval=min(NNint);
maxval=max(NNint);

%% part 3
%NNint_DCRemoved = NNint - avg; %remove DC from ecg
p = periodogram(NNint);

end
