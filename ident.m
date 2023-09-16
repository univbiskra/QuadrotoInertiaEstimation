%%%%%%%%%%%%            Ix (axe about roll)        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load Ix_test Ix_test2
 %Ix=Ix_test2
figure()
time=(Ix(:,1)-ones(2715,1)*1159)*0.001;
roll=Ix(:,2);
plot(time ,Ix(:,2))
figure()
plot(time,roll);grid on ; zoom on;hold on

%%% focuse only in zone 1 ////////

t=(Ix(:,1)>=260000 & Ix(:,1)< 305000)
timeFoc=time(t);
rollFoc=roll(t);
plot(timeFoc,rollFoc);grid on ; zoom on;
[~,locs] = findpeaks(rollFoc)
T1=mean(diff(locs))*0.160     %0.16 is delta T
% ans = 4.5333 seconde is T periode

%%% focuse only in zone 2 //////// I thike this is the best one 

t=(Ix(:,1)>=365000 & Ix(:,1)< 420000)
timeFoc=time(t);
rollFoc=roll(t);
plot(timeFoc,rollFoc);grid on ; zoom on;
[~,locs] = findpeaks(rollFoc)
T2=mean(diff(locs))*0.160     %0.16 is delta T
% ans =     4.4655 seconde


%%% focuse only in zone 3 //////// some translation montion present 

t=(Ix(:,1)>=139000 & Ix(:,1)< 170000)
timeFoc=time(t);
rollFoc=roll(t);
plot(timeFoc,rollFoc);grid on ; zoom on;
[~,locs] = findpeaks(rollFoc)
T3=mean(diff(locs))*0.160     %0.16 is delta T
% ans =     4.2667 seconde

%%% focuse only in zone 4 extracted from zone 2 high gain >0°5 and <6° ////////

t=(Ix(:,1)>=366000 & Ix(:,1)< 390000)
timeFoc=time(t);
rollFoc=roll(t);
plot(timeFoc,rollFoc);grid on ; zoom on;
[~,locs] = findpeaks(rollFoc)
T4=mean(diff(locs))*0.160     %0.16 is delta T
% ans =         4.6000 seconde


%%% focuse only in zone 5 extracted from zone 2 low gain >5° and <6° ////////

t=(Ix(:,1)>=395000 & Ix(:,1)< 416000)
timeFoc=time(t);
rollFoc=roll(t);
plot(timeFoc,rollFoc);grid on ; zoom on;
[~,locs] = findpeaks(rollFoc)
T5=mean(diff(locs))*0.160     %0.16 is delta T
% ans =         4.5333 seconde

%%% focuse only in zone 5 extracted from zone 2 low gain >5° and <6° ////////

t=(Ix(:,1)>=405000 & Ix(:,1)< 413000)
timeFoc=time(t);
rollFoc=roll(t);
plot(timeFoc,rollFoc);grid on ; zoom on;
[~,locs] = findpeaks(rollFoc)
T6=mean(diff(locs))*0.160     %0.16 is delta T
% ans =         4.6400 seconde
%%%%%%%%%%%%%%%%%%%%%%%%%%%

load Ix_test2 
Ix2=Ix_test2
time2=(Ix2(:,1)-ones(2200,1)*192)*0.001;
roll2=Ix2(:,2);
plot(time2 ,Ix2(:,2))
figure()
plot(time2,roll2);grid on ; zoom on;hold on

%%% focuse only in zone 1 ////////

t2=(Ix2(:,1)>=0 & Ix2(:,1)< 112000)
timeFoc2=time2(t2);
rollFoc2=roll2(t2);
plot(timeFoc2,rollFoc2);grid on ; zoom on;
[~,locs2] = findpeaks(rollFoc2)
T7=mean(diff(locs2))*0.160     %0.16 is delta T

t2=(Ix2(:,1)>=120000 & Ix2(:,1)< 260000)
timeFoc2=time2(t2);
rollFoc2=roll2(t2);
plot(timeFoc2,rollFoc2);grid on ; zoom on;
[~,locs2] = findpeaks(rollFoc2)
T8=mean(diff(locs2))*0.160     %0.16 is delta T



t2=(Ix2(:,1)>=280000 & Ix2(:,1)< 350000)
timeFoc2=time2(t2);
rollFoc2=roll2(t2);
plot(timeFoc2,rollFoc2);grid on ; zoom on;
[~,locs2] = findpeaks(rollFoc2)
T9=mean(diff(locs2))*0.160     %0.16 is delta T

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ùù


m=1.288;
g=9.81;
D=0.107
d=D/2;
L=1.705;

% T=4.6400;%max   gives Ixx=0.0109
% T=4.5333;
% T=4.600; 
% T=4.4655;
% T=4.2667;%min   gives Ixx=0.0092;
% Ixx=( m * g * d*d * T*T)/(4*pi*pi*L) % Ixx=[0.009         0.011]
%T=[7.1333    7.1655    7.3667    7.1000    7.3333    7.4400    7.4840    7.4026    7.3657]
T=[T1 T2 T3 T4 T5 T6 T7 T8 T9]
Ixx=(( m * g * d*d)/(4*pi*pi*L))*T.*T
run=[1 2 3 4 5 6 7 8 9]
figure(1)
plot(run,Ixx,'k--o',...
    'LineWidth',2,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor',[0.5,0.5,0.5])
grid on
ylim([-0.02,0.038])
title('Ixx Moment of Inertia Identification','FontSize',15)
xlabel('Run Number','FontSize',13)
ylabel('Ixx(Kg.m^2)','FontSize',13)
legend('Ixx inertia','Location','northeast','FontSize',15)
legend('boxoff')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Iy (axe about pitch )%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
load Iy_test

Iy=Iy_test;
time=(Iy(:,1)-ones(max(size(Iy)),1)*(Iy(1,1)))*0.001;
roll=Iy(:,3);
plot(time ,Iy(:,2))
figure()
plot(time,roll);grid on ; zoom on;hold on

%%% focuse only in zone 1 ////////

t=(Iy(:,1)>=230000 & Iy(:,1)< 310000)
timeFoc=time(t);
rollFoc=roll(t);
plot(timeFoc,rollFoc);grid on ; zoom on;
[~,locs] = findpeaks(rollFoc)

deff=time(2:end)-time(1:end-1);

T11=mean(diff(locs))* mean(deff)   %0.16 is delta T 
% ans = 3.2624 seconde
 % Iy=0.0116;

 
 %%% focuse only in zone 2 //////// I thike this is the best one 

t=(Iy(:,1)>=70000 & Iy(:,1)< 100000)
timeFoc=time(t);
rollFoc=roll(t);
plot(timeFoc,rollFoc);grid on ; zoom on;
[~,locs] = findpeaks(rollFoc)
T22=mean(diff(locs))*0.160     %0.16 is delta T     
% ans T =      3.2800 seconde
%   Iy= 0.0117


%%% focuse only in zone 2 //////// I thike this is the best one 
t=(Iy(:,1)>=160000 & Iy(:,1)< 190000)   
timeFoc=time(t);
rollFoc=roll(t);
plot(timeFoc,rollFoc);grid on ; zoom on;
[~,locs] = findpeaks(rollFoc)
T33=mean(diff(locs))*0.160     %0.16 is delta T
% ans =        3.2600 seconde
% Iy=0.0116


%%% focuse only in zone 2 //////// I thike this is the best one  

t=(Iy(:,1)>=135000 & Iy(:,1)< 160000) %t=(Iy(:,1)>=135000 & Iy(:,1)< 180000)
timeFoc=time(t);
rollFoc=roll(t);
plot(timeFoc,rollFoc);grid on ; zoom on;
[~,locs] = findpeaks(rollFoc)
T44=mean(diff(locs))*0.160 


%%% focuse only in zone 2 //////// I thike this is the best one 
t=(Iy(:,1)>=200000 & Iy(:,1)< 230000)  % t=(Iy(:,1)>=200000 & Iy(:,1)< 270000)  
timeFoc=time(t);
rollFoc=roll(t);
plot(timeFoc,rollFoc);grid on ; zoom on;
[~,locs] = findpeaks(rollFoc)
T55=mean(diff(locs))*0.160 

%%% focuse only in zone 2 //////// I thike this is the best one 
t=(Iy(:,1)>=50000 & Iy(:,1)< 80000)  %t=(Iy(:,1)>=50000 & Iy(:,1)< 95000)
timeFoc=time(t);
rollFoc=roll(t);
plot(timeFoc,rollFoc);grid on ; zoom on;
[~,locs] = findpeaks(rollFoc)
T66=mean(diff(locs))*0.160 


%%% focuse only in zone 2 //////// I thike this is the best one 
t=(Iy(:,1)>=8000 & Iy(:,1)< 24000)
timeFoc=time(t);
rollFoc=roll(t);
plot(timeFoc,rollFoc);grid on ; zoom on;
[~,locs] = findpeaks(rollFoc)
T77=mean(diff(locs))*0.160 

%%% focuse only in zone 2 //////// I thike this is the best one 
t=(Iy(:,1)>=32000 & Iy(:,1)< 50000)  %t=(Iy(:,1)>=32000 & Iy(:,1)< 75000)
timeFoc=time(t);
rollFoc=roll(t);
plot(timeFoc,rollFoc);grid on ; zoom on;
[~,locs] = findpeaks(rollFoc)
T88=mean(diff(locs))*0.160 

%%% focuse only in zone 2 //////// I thike this is the best one 
t=(Iy(:,1)>=120000 & Iy(:,1)< 140000)  %t=(Iy(:,1)>=120000 & Iy(:,1)< 150000)
timeFoc=time(t);
rollFoc=roll(t);
plot(timeFoc,rollFoc);grid on ; zoom on;
[~,locs] = findpeaks(rollFoc)
T99=mean(diff(locs))*0.160 

%230-310  70-100  160-190  135-160   200-230   50-80   8-24  23-50  

T=[T11 T22 T33 T44 T55 T66 T77 T88 T99]
L=1.695
D=0.152
d=D/2
m=1.288;
g=9.81;

%T=3.2
Iyy=(( m * g * d*d )/(4*pi*pi*L))*T.*T
run=[1 2 3 4 5 6 7 8 9];
%plot(run,Iyy)

figure(2)
plot(run,Iyy,'k--o',...
    'LineWidth',2,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor',[0.5,0.5,0.5])
grid on
ylim([0.0,0.02])
title('Iyy Moment of Inertia Identification','FontSize',15)
xlabel('Run Number','FontSize',13)
ylabel('Iyy (Kg.m^2)','FontSize',13)
legend('Iyy inertia','Location','northeast','FontSize',15)
legend('boxoff')

hold on

%                                         Iy = [Iy=0.0116  Iy=0.0117 ]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Iz   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

T=[7.1333    7.1655    7.3667    7.1000    7.3333    7.4400    7.2840    7.4026    7.3657]
 Izz=(( m * g * d*d)/(4*pi*pi*L))*T.*T
run=[1 2 3 4 5 6 7 8 9]
figure(1)
plot(run,Izz,'k--o',...
    'LineWidth',2,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor',[0.5,0.5,0.5])
grid on
ylim([0.01,0.048])
title('Izz Moment of Inertia Identification','FontSize',15)
xlabel('Run Number','FontSize',13)
ylabel('Izz(Kg.m^2)','FontSize',13)
legend('Izz inertia','Location','northeast','FontSize',15)
legend('boxoff')
Ix=( 0.0273  +  0.0276  +  0.0292  +  0.0271  +  0.0289  +  0.0297 +   0.0285  +  0.0294  +  0.0291)/9






































%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   test 2 of Ix %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



load Ix_test2

Ix=Ix_test2;

time=(Ix(:,1)-ones(max(size(Ix)),1)*(Ix(1,1)))*0.001;

roll=Ix(:,2);
plot(time ,Ix(:,2))
figure()
plot(time,roll);grid on ; zoom on;hold on

%%% focuse only in zone 1 ////////

t=(time>=310 & time< 351)
timeFoc=time(t);
rollFoc=roll(t);
plot(timeFoc,rollFoc);grid on ; zoom on;
[~,locs] = findpeaks(rollFoc)
mean(diff(locs))*0.160     %0.16 is delta T
% ans =   4.3733    seconde

%%% focuse only in zone 2 /////////////////////////////////////////

t=(time>=200 & time< 270)
timeFoc=time(t);
rollFoc=roll(t);
plot(timeFoc,rollFoc);grid on ; zoom on;
[~,locs] = findpeaks(rollFoc)
mean(diff(locs))*0.160     %0.16 is delta T
% ans =  4.3657    seconde

%%% focuse only in zone 3 /////////////////////////////////////////

t=(time>=39 & time< 105)
timeFoc=time(t);
rollFoc=roll(t);
plot(timeFoc,rollFoc);grid on ; zoom on;
[~,locs] = findpeaks(rollFoc)
mean(diff(locs))*0.160     %0.16 is delta T
% ans = 4.3771     seconde  10° until 4°

%%% focuse only in zone 4 /////////////////////////////////////////

t=(time>=0.1 & time< 14)
timeFoc=time(t);
rollFoc=roll(t);
plot(timeFoc,rollFoc);grid on ; zoom on;
[~,locs] = findpeaks(rollFoc)
mean(diff(locs))*0.160     %0.16 is delta T
% ans =     4.3733        4.3657     4.3771          MEAN ==  4.3720
% ans =     4.40    and   4.48   and 4.480   ??? not seem good( in +- 7° until +- 5°)   seconde
% ans =     4.3840  and   4.3911 and 4.3800     ( in +- 20° until +-15°)   seconde
% ans =     4.4800  and   4.400  and 4.480       ( in +- 40° until +-20°)   seconde


L=1.555
D=0.103
d=D/2
m=1.288;
g=9.81;

T= 4.3840;

Ixx=( m * g * d*d * T*T)/(4*pi*pi*L) %    Ixx =  0.0104

%  RESULTAT ============================================>   Ixx =  0.0104    %%%%%%        Iy=Iy=0.01165;


