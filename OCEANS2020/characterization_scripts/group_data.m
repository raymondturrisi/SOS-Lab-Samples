%%Creates two multidimensional arrays from all the data points for trials 1 and
%%trial 2 displaying Fx(Thrust),RPM, Current Motor, Current System

%{  
DC\Vel  0ms     10ms    20ms    30ms    40ms  
0.0      c       c       c       c       c
0.2      c       c       c       c       c 
0.4      c       c       c       c       c
0.6      c       c       c       c       c
0.8      c       c       c       c       c
1.0      c       c       c       c       c
i = DC
j = m/s
k = c
c = Fx RPM Amot Asys
%}

close all;clear;clc

bigCellT1 = zeros(6,6,4)
bigCellT2 = zeros(6,6,4)

%Labels Planes
for p = 1:4
for i = 1:5
    
    %duty cycles
    bigCellT1(i+2,1,p) = i*0.2
    bigCellT2(i+2,1,p) = i*0.2
    %meters per second
    bigCellT1(1,i+1,p) = (i-1)/10
    bigCellT2(1,i+1,p) = (i-1)/10
    
end
end

c = 1
%000ms
i = 3;j = 2;col = 1;
[trial1,trial2]= isolateDataStat('DThrust_09142019_000ms_020DC_','.lvm','mbed_Dataset09142019_000ms_020DC_','.txt',10,30,10,30)
bigCellT1(i,j,col:4) = trial1
bigCellT2(i,j,col:4) = trial2

i = i+1;j = 2;col = 1;
[trial1,trial2]= isolateDataStat('DThrust_09142019_000ms_040DC_','.lvm','mbed_Dataset09142019_000ms_040DC_','.txt',10,30,10,30)
bigCellT1(i,j,col:4) = trial1
bigCellT2(i,j,col:4) = trial2

i = i+1;j = 2;col = 1;
[trial1,trial2]= isolateDataStat('DThrust_09142019_000ms_060DC_','.lvm','mbed_Dataset09142019_000ms_060DC_','.txt',10,30,10,30)
bigCellT1(i,j,col:4) = trial1
bigCellT2(i,j,col:4) = trial2

i = i+1;j = 2;col = 1;
[trial1,trial2]= isolateDataStat('DThrust_09142019_000ms_080DC_','.lvm','mbed_Dataset09142019_000ms_080DC_','.txt',10,30,10,30)
bigCellT1(i,j,col:4) = trial1
bigCellT2(i,j,col:4) = trial2

i = i+1;j = 2;col = 1;
[trial1,trial2]= isolateDataStat('DThrust_09142019_000ms_100DC_','.lvm','mbed_Dataset09142019_000ms_100DC_','.txt',10,30,10,30)
bigCellT1(i,j,col:4) = trial1
bigCellT2(i,j,col:4) = trial2

%010ms
i = 3;j = 3;col = 1;
[trial1,trial2]= isolateData('DThrust_09212019_010ms_020DC_','.lvm','mbed_Dataset09212019_010ms_020DC_','.txt',17,40,17,40,1)
bigCellT1(i,j,col:4) = trial1
bigCellT2(i,j,col:4) = trial2

i = i+1
[trial1,trial2]= isolateData('DThrust_09212019_010ms_040DC_','.lvm','mbed_Dataset09212019_010ms_040DC_','.txt',17,41,19,42,1)
bigCellT1(i,j,col:4) = trial1
bigCellT2(i,j,col:4) = trial2

i = i+1
[trial1,trial2]= isolateData('DThrust_09212019_010ms_060DC_','.lvm','mbed_Dataset09212019_010ms_060DC_','.txt',22,46,18,41,1)
bigCellT1(i,j,col:4) = trial1
bigCellT2(i,j,col:4) = trial2

i = i+1
[trial1,trial2]= isolateData('DThrust_09212019_010ms_080DC_','.lvm','mbed_Dataset09212019_010ms_080DC_','.txt',17,40,17,40,1)
bigCellT1(i,j,col:4) = trial1
bigCellT2(i,j,col:4) = trial2

i = i+1
[trial1,trial2]= isolateData('DThrust_09212019_010ms_100DC_','.lvm','mbed_Dataset09212019_010ms_100DC_','.txt',23,46,18,41,1)
bigCellT1(i,j,col:4) = trial1
bigCellT2(i,j,col:4) = trial2

%020ms
i = 3;j = 4;col = 1;
[trial1,trial2]= isolateData('DThrust_09212019_020ms_020DC_','.lvm','mbed_Dataset09212019_020ms_020DC_','.txt',20,32,17,24,2)
bigCellT1(i,j,col:4) = trial1
bigCellT2(i,j,col:4) = trial2

i = i+1
[trial1,trial2]= isolateData('DThrust_09212019_020ms_040DC_','.lvm','mbed_Dataset09212019_020ms_040DC_','.txt',17,28,21,32,2)
bigCellT1(i,j,col:4) = trial1
bigCellT2(i,j,col:4) = trial2

i = i+1
[trial1,trial2]= isolateData('DThrust_09212019_020ms_060DC_','.lvm','mbed_Dataset09212019_020ms_060DC_','.txt',17,28,21,33,2)
bigCellT1(i,j,col:4) = trial1
bigCellT2(i,j,col:4) = trial2

i = i+1
[trial1,trial2]= isolateData('DThrust_09212019_020ms_080DC_','.lvm','mbed_Dataset09212019_020ms_080DC_','.txt',20,30,18,30,2)
bigCellT1(i,j,col:4) = trial1
bigCellT2(i,j,col:4) = trial2

i = i+1
[trial1,trial2]= isolateData('DThrust_09212019_020ms_100DC_','.lvm','mbed_Dataset09212019_020ms_100DC_','.txt',24,35,20,31,2)
bigCellT1(i,j,col:4) = trial1
bigCellT2(i,j,col:4) = trial2

%030ms
i = 3;j = 5;col = 1;
[trial1,trial2]= isolateData('DThrust_09142019_030ms_020DC_','.lvm','mbed_Dataset09142019_030ms_020DC_','.txt',24,31,16,23,3)
bigCellT1(i,j,col:4) = trial1
bigCellT2(i,j,col:4) = trial2

i = i+1
[trial1,trial2]= isolateData('DThrust_09142019_030ms_040DC_','.lvm','mbed_Dataset09142019_030ms_040DC_','.txt',16,24,17,25,3)
bigCellT1(i,j,col:4) = trial1
bigCellT2(i,j,col:4) = trial2

i = i+1
[trial1,trial2]= isolateData('DThrust_09142019_030ms_060DC_','.lvm','mbed_Dataset09142019_030ms_060DC_','.txt',19,26,17,24,3)
bigCellT1(i,j,col:4) = trial1
bigCellT2(i,j,col:4) = trial2

i = i+1
[trial1,trial2]= isolateData('DThrust_09142019_030ms_080DC_','.lvm','mbed_Dataset09142019_030ms_080DC_','.txt',17,24,37,43,3)
bigCellT1(i,j,col:4) = trial1
bigCellT2(i,j,col:4) = trial2

i = i+1
[trial1,trial2]= isolateData('DThrust_09142019_030ms_100DC_','.lvm','mbed_Dataset09142019_030ms_100DC_','.txt',16,24,21,27,3)
bigCellT1(i,j,col:4) = trial1
bigCellT2(i,j,col:4) = trial2

%040ms
i = 3;j = 6;col = 1;
[trial1,trial2]= isolateData('DThrust_09212019_040ms_020DC_','.lvm','mbed_Dataset09212019_040ms_020DC_','.txt',24,30,21,27,4)
bigCellT1(i,j,col:4) = trial1
bigCellT2(i,j,col:4) = trial2

i = i+1
[trial1,trial2]= isolateData('DThrust_09212019_040ms_040DC_','.lvm','mbed_Dataset09212019_040ms_040DC_','.txt',17,22,17,23,4)
bigCellT1(i,j,col:4) = trial1
bigCellT2(i,j,col:4) = trial2

i = i+1
[trial1,trial2]= isolateData('DThrust_09212019_040ms_060DC_','.lvm','mbed_Dataset09212019_040ms_060DC_','.txt',16,22,18,24,4)
bigCellT1(i,j,col:4) = trial1
bigCellT2(i,j,col:4) = trial2

i = i+1
[trial1,trial2]= isolateData('DThrust_09212019_040ms_080DC_','.lvm','mbed_Dataset09212019_040ms_080DC_','.txt',18,24,17,22,4)
bigCellT1(i,j,col:4) = trial1
bigCellT2(i,j,col:4) = trial2

i = i+1
[trial1,trial2]= isolateData('DThrust_09212019_040ms_100DC_','.lvm','mbed_Dataset09212019_040ms_100DC_','.txt',17,23,20,25,4)
bigCellT1(i,j,col:4) = trial1
bigCellT2(i,j,col:4) = trial2

bigCellAVG = (bigCellT1+bigCellT2)/2

%Plots of Thrust Vs. RPM with two trials overlayed
figure(5)
for i=2:6
   plot(bigCellAVG(3:7,i,2),bigCellAVG(3:7,i,1))
   hold on
end
grid on
xlabel('RPM')
ylabel('Thrust (N)')
legend('0.0 m/s','0.1 m/s','0.2 m/s','0.3 m/s','0.4 m/s')
txt = sprintf('Plot Relating Thrust w/rt RPM');
title(txt)

hold on
for i=2:6
   plot(bigCellAVG(3:7,i,2),bigCellT1(3:7,i,1),'r+','Markersize',6,'LineWidth',1)
   hold on 
end
for i=2:6
   plot(bigCellAVG(3:7,i,2),bigCellT2(3:7,i,1),'bx','MarkerSize',6,'LineWidth',1)
   hold on
end
legend('0.0 m/s','0.1 m/s','0.2 m/s','0.3 m/s','0.4 m/s')
text(50,(max(bigCellAVG(:,2,1))-3),'Trial One','Color','r')
text(50,max(bigCellAVG(:,2,1))-5,'Trial Two','Color','b')

%Plots of Thrust Vs. Current supplied to motor with two trials overlayed
figure(6)
%devthrust = zeros(5,5);
%{
for i=2:6
    dcr = [bigCellT1(i,2:6);bigCellT2(i,2:6)];
    devthrust(i-1,:) = std(dcr,0,1);
end
%}
for i=2:6
   plot(bigCellAVG(3:7,i,3),bigCellAVG(3:7,i,1))
   hold on
end
grid on
xlabel('Current of Motor (A)')
ylabel('Thrust (N)')
legend('0.0 m/s','0.1 m/s','0.2 m/s','0.3 m/s','0.4 m/s')
txt = sprintf('Plot Relating Thrust w/rt Current of Motor');
title(txt)

hold on
for i=2:6
   plot(bigCellAVG(3:7,i,3),bigCellT1(3:7,i,1),'r+','Markersize',6,'LineWidth',1)
end
hold on
for i=2:6
   plot(bigCellAVG(3:7,i,3),bigCellT2(3:7,i,1),'bx','Markersize',6,'LineWidth',1)
   hold on
end
legend('0.0 m/s','0.1 m/s','0.2 m/s','0.3 m/s','0.4 m/s')
text(0,max(bigCellAVG(:,2,1))-3,'Trial One','Color','r')
text(0,max(bigCellAVG(:,2,1))-5,'Trial Two','Color','b')

%{
%Computes Theoretical Thrust using hand derived constants
%Calculate Prop Constants
%Calculate a value for static thrust
ap = (bigCellAVG(3:7,2,1))./(bigCellAVG(3:7,2,2).^2)
a = mean(ap)
bp = (bigCellAVG(3:7,3:6,1)-a*(bigCellAVG(3:7,3:6,2).^2))./(bigCellAVG(3:7,3:6,2).*bigCellAVG(1,3:6,1))
b = mean(mean(bp))


Tt = zeros(7,6); Tt(1,:) = bigCellAVG(1,:,1); Tt(:,1)=bigCellAVG(:,1,1);
a = 0.0002758;
b = 0.06757;
for i=1:5
rpm=bigCellAVG(3:7,i+1,2)
Va = bigCellAVG(1,i+1,2)
Tt(3:7,i+1) = a*rpm.^2-b*Va*rpm
end


%Plots the theoretical vs actual values with respect to RPM
figure(7)
i = 1
subplot(2,2,i)
Tt1TA1 = plot(bigCellAVG(3:7,i+1,2),Tt(3:7,i+1),'x-')
hold on
At1TA1 = plot(bigCellAVG(3:7,i+1,2),bigCellAVG(3:7,i+1,1),'+-')
grid on
xLabTA1 = xlabel('RPM')
yLabTA1 = ylabel('Thrust (N)')
legTA1 = legend({'Theoretical N', 'Actual N'},'Location','southeast');
titleTA1 = title('Plot of Experimental Thrust w/rt RPM at 0.1 m/s')
hold on

i = i+1
subplot(2,2,i)
Tt1TA2 = plot(bigCellAVG(3:7,i+1,2),Tt(3:7,i+1),'x-')
hold on
At1TA2 = plot(bigCellAVG(3:7,i+1,2),bigCellAVG(3:7,i+1,1),'+-')
grid on
xLabTA2 = xlabel('RPM')
yLabTA2 = ('Thrust (N)')
legend({'Theoretical N', 'Actual N'},'Location','southeast');
title('Plot of Experimental Thrust w/rt RPM at 0.2 m/s')
hold on


i = i+1
subplot(2,2,i)
Tt1TA3 = plot(bigCellAVG(3:7,i+1,2),Tt(3:7,i+1),'x-')
hold on
At1TA3 = plot(bigCellAVG(3:7,i+1,2),bigCellAVG(3:7,i+1,1),'+-')
grid on
xLabTA3 = xlabel('RPM')
yLabTA3 = ylabel('Thrust (N)')
legend({'Theoretical N', 'Actual N'},'Location','southeast');
title('Plot of Experimental Thrust w/rt RPM at 0.3 m/s')
hold on


i = i+1
subplot(2,2,i)
Tt1TA4 = plot(bigCellAVG(3:7,i+1,2),Tt(3:7,i+1),'x-')
hold on
At1TA4 = plot(bigCellAVG(3:7,i+1,2),bigCellAVG(3:7,i+1,1),'+-')
grid on
xLabTA4 = xlabel('RPM')
yLabTA4 = ylabel('Thrust (N)')
legend({'Theoretical N', 'Actual N'},'Location','southeast');
title('Plot of Experimental Thrust w/rt RPM at 0.4 m/s')
%}

%dynamic and static thrust equations
dThrustEq = @(rpm,Va)((2.50141*10^-4).*rpm.^2-0.0982*rpm.*Va);
sThrustEq = @(rpm)((2.01*10^-4).*rpm.^2);
values = zeros(7,6,2);values(:,:,2) = bigCellAVG(:,:,1);

for i = 3:1:7
    values(i,2:6,1) = dThrustEq(bigCellAVG(i,2:6,2),bigCellAVG(1,2:6,1));
end

values(3:7,2,1) = sThrustEq(bigCellAVG(3:7,2,2));


rpm = [0:1:1000];
vel = [0:0.1:2];
values = zeros(length(rpm),length(vel));values(:,1)=rpm';values(1,:)=vel;

for i = 2:1:length(rpm)
    values(i,2:end) = dThrustEq(values(i,1),values(1,2:end));
end


%find the minimum rpm to overcome predicted drag (newtons) with requiredthrust([vel
%rpm],vel)
% rthrust = zeros(2,length(vel));rthrust = values(1,:);
% drag = 8;%net vehicle
% drag = drag/2;%per thruster
% for i = 2:1:length(vel)
%     %finds the first index which the force of thrust is greater than or equal to the force of
%     %drag
%     ind = find(values(:,i)>=drag);ind = ind(1);
%     rthrust(2,i) = values(ind,1);
% end
% 
% 
% rms = zeros(5,5);
% 
% rms(:,1) = sqrt(((bigCellAVG(3:7,2,1)-values(3:7,2,1)).^2)/5);
% 
% for i = 1:1:4
%     rms(:,i+1) = sqrt(((bigCellAVG(3:7,i+2,1)-values(3:7,i+2,1)).^2)/5);
% end
% rms
% statavgrms = mean(rms(:,1))
% dynavgrms = mean(mean(rms(:,2:5)))