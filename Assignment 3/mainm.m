f1=fopen('408_ECG_5Y.txt');
y=fscanf(f1,'%f');
mat=ones(size(y));
mat=mat.*8;
y=y-mat;

f2=fopen('408_ECG_5O.txt');
o=fscanf(f2,'%f');
mat=ones(size(o));
mat=mat.*8;
o=o-mat;

tacho(o,"O");
tacho(y,"Y");

rate=1/250;

int1o=o(288000:289250);      %1250 = 5sec
int2o=o(129400:130650);
int1o=smooth(int1o);
int2o=smooth(int2o);

int1y=y(288000:289250);      %1250 = 5sec
int2y=y(129400:130650);
int1y=smooth(int1y);
int2y=smooth(int2y);

%% part 1b identify artifacts 
% figure(1)
% plot(int1o)
% title('First segment O')
% axis tight
% figure(2)
% plot(int2o)
% title('Second segment O')
% axis tight
% figure(3)
% plot(int1y)
% title('First segment Y')
% axis tight
% figure(4)
% plot(int2y)
% title('Second segment Y')
% axis tight

% tacho(int1y,"int1 Y");
% tacho(int1o,"int1 O");

o=smooth(o);
fivemino=zeros(75000,6);       % for exactly 30 min 
x=1;
for c=1:6
    for r=1:75000
        fivemino(r,c)=o(x);
        x=x+1;
    end
end

fivemino1=fivemino(:,1);
fivemino2=fivemino(:,2);
fivemino3=fivemino(:,3);
fivemino4=fivemino(:,4);
fivemino5=fivemino(:,5);
fivemino6=fivemino(:,6);

[avgo(1),minvalo(1),maxvalo(1)]= tacho(fivemino1,"first 5 min O Tachogram"); 
[avgo(2),minvalo(2),maxvalo(2)]= tacho(fivemino2,"5min O 2"); 
[avgo(3),minvalo(3),maxvalo(3)]= tacho(fivemino3,"5min O 3"); 
[avgo(4),minvalo(4),maxvalo(4)]= tacho(fivemino4,"5min O 4"); 
[avgo(5),minvalo(5),maxvalo(5)]= tacho(fivemino5,"5min O 5"); 
[avgo(6),minvalo(6),maxvalo(6)]= tacho(fivemino6,"5min O 6"); 

y=smooth(y);
fiveminy=zeros(75000,6);       % for exactly 30 min each 5 min
x=1;
for c=1:6
    for r=1:75000
        fiveminy(r,c)=y(x);
        x=x+1;
    end
end

fiveminy1=fiveminy(:,1);
fiveminy2=fiveminy(:,2);
fiveminy3=fiveminy(:,3);
fiveminy4=fiveminy(:,4);
fiveminy5=fiveminy(:,5);
fiveminy6=fiveminy(:,6);

[avgy(1),minvaly(1),maxvaly(1)]= tacho(fiveminy1,"first 5 min Y Tachogram"); 
[avgy(2),minvaly(2),maxvaly(2)]= tacho(fiveminy2,"5min Y 2"); 
[avgy(3),minvaly(3),maxvaly(3)]= tacho(fiveminy3,"5min Y 3"); 
[avgy(4),minvaly(4),maxvaly(4)]= tacho(fiveminy4,"5min Y 4"); 
[avgy(5),minvaly(5),maxvaly(5)]= tacho(fiveminy5,"5min Y 5"); 
[avgy(6),minvaly(6),maxvaly(6)]= tacho(fiveminy6,"5min Y 6"); 

num=[1 2 3 4 5 6];
Ty=table(num',avgy',minvaly',maxvaly');
Ty.Properties.VariableNames{1} = 'Section_Y';
Ty.Properties.VariableNames{2} = 'Average';
Ty.Properties.VariableNames{3} = 'Minimum';
Ty.Properties.VariableNames{4} = 'Maximum';
 figure()
 plot(avgy)
 title("Average NNinterval y")
 xlabel("5 min segment number")
 
 figure()
 plot((maxvaly-minvaly))
 title("Range NNinterval y")
 xlabel("5 min segment number")


figure()
To=table(num',avgo',minvalo',maxvalo');
To.Properties.VariableNames{1} = 'Section_O';
To.Properties.VariableNames{2} = 'Average';
To.Properties.VariableNames{3} = 'Minimum';
To.Properties.VariableNames{4} = 'Maximum';

 figure()
 plot(avgo)
 title("Average NNinterval o")
 xlabel("5 min segment number")

 figure()
 plot((maxvalo-minvalo))
 title("Range NNinterval o")
 xlabel("5 min segment number")

 
 %%part 2 
 
 sdnny(1)=std(fiveminy1);
 sdnny(2)=std(fiveminy2);
 sdnny(3)=std(fiveminy3);
 sdnny(4)=std(fiveminy4);
 sdnny(5)=std(fiveminy5);
 sdnny(6)=std(fiveminy6);

 sdnno(1)=std(fivemino1);
 sdnno(2)=std(fivemino2);
 sdnno(3)=std(fivemino3);
 sdnno(4)=std(fivemino4);
 sdnno(5)=std(fivemino5);
 sdnno(6)=std(fivemino6);
 
 figure()
 plot(sdnny)
 title("SDNN y")
 xlabel("5 min segment number")

 figure()
 plot(sdnno)
 title("SDNN o")
 xlabel("5 min segment number")

%% part 3a

% tacho(fivemino1,"O");
% tacho(fiveminy1,"Y");
% 
% %% part 3b
%%%%%%%%%%%%CHANGE THE DATA AND RECORD TABLE 
p=new(int1o);
%%%%%%%%%%%%
lf=0;
hf=0;
[r,c]=size(p);
for i=1:r
    for j=1:c
        if ((0.04<p(i,j))&&(p(i,j)<0.15))
            lf=lf+p(i,j);
        end
        if ((p(i,j)>0.15)&&(p(i,j)<0.4))
             hf=hf+p(i,j);
        end
    end
end

T=table(lf',hf',lf/hf);
T.Properties.VariableNames{1} = 'lf';
T.Properties.VariableNames{2} = 'hf';
T.Properties.VariableNames{3} = 'ratio';


% %%

