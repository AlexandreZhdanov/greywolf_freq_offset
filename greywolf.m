close all
clear all
clear global
A = randi([0,1],1,1000);
B = randi([0,1],1,1000);
C=complex(2*A-1,2*B-1);
lb=0;
ub=0.01;
t=[1:max(size(C))];
global Cdata;
w0=(lb+(ub-lb)/2)
snr=20;
p=10^(-snr/20)
Cdata=C.*exp(j*w0.*t)+p*randn(1,1000);
Num=24;
F2=zeros(1,Num);
w1=zeros(1,Num);
for i=1:Num 
    w1(i)=lb+(ub-lb)*(i-1)/Num; 
    F2(i)=costF(w1(i)); 
end
plot(w1,-F2);
title('Cost function');
fobj=@costF;
Max_iter=10;
SearchAgents_no=5;
dim=1;
[Best_score,Best_pos,GWO_cg_curve]=GWO(SearchAgents_no,Max_iter,lb,ub,dim,fobj)
Estimation_Error=w0-Best_pos
figure(2)
hold on
title('Freq offset compensation');
plot(Cdata,'*b');
plot(Cdata.*exp(-j*Best_pos.*t),'*r');
legend('before','after');
hold off