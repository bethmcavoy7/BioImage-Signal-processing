function [avg,minval,maxval]=tacho(segment,name)

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

% figure()
% plot(NNint);
% % hold on
% % plot(NNint,'ro')
% title(name)
% xlabel("beat number")
% ylabel("NN intervals")
% axis tight

avg=mean(NNint);
minval=min(NNint);
maxval=max(NNint);

%% part 3
%NNint_DCRemoved = NNint - avg; %remove DC from ecg
% p = periodogram(NNint);
% figure()
% plot(p(20:max(size(p))))
% title("power spectra "+name)
% xlabel("frequency")
% ylabel("power")
% axis tight



% %Poincare plot
xp=NNint;
xp(end)=[];
xm=NNint;
xm(1)=[];
%SD1
SD1 = std(xp-xm);
%set(handle.sd1, 'string', num2str(SD1*1000));
%SD2
SD2 = std(xp+xm);
%set(handle.sd2, 'string', num2str(SD2*1000));
%SDRR
%SDRR=sqrt(SD1^2+SD2^2);
%set(handle.sdrr, 'string', num2str(SDRR*1000));

plot(xm,xp,'*')
hold on
plot(xm)
title("poincare plot Y")
xlabel("NNint(N+1)")
ylabel("NNint(N)")

Ts=table(SD1',SD2',SD1/SD2);
Ts.Properties.VariableNames{1} = 'SD1';
Ts.Properties.VariableNames{2} = 'SD2';
Ts.Properties.VariableNames{3} = 'ratio';
disp(Ts);


