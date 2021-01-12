%%DynamicThrust; Open, Mean, Find, output data from t = 0 to t = carriage stops
%%Function that takes two file names and recorded times from experiments, and then finds relevant data, takes the mean from these regions, and then concatenates the data for the entire experiment
%file1(timet,Fx,Fy,Fz,Mx,My,Mz,Position,Trigger)
%file2(timem,dc,rpm,cmotp,cmot,csysp,csys)
%goal data(rpm,Fx,Fy,Fz,Fmag,cmot,csys) ///Fx = Fu = Thrust
%Global Time: mbed data is ~ 3 seconds offset for startup time, 


function [trial1, trial2] = isolateDataStat(ttank,ttankftype,mbed,mbedftype,t11,t12,t21,t22)

%temp development region start***********
mbedOffset = 1.2 %Startup time for mbed
%temp development region ends************
Fd = 3.88 %constant derived from mean of hanging system
%Trial 1
%Data for tank
i = 1
file = sprintf('%s%.0f%s',ttank,i,ttankftype)
name = ttank;
type1 = file;
fileID = fopen(file);
TTdataT1 = cell2mat(textscan(fileID,'%f,%f,%f,%f,%f,%f,%f,%f,%f'));
fclose(fileID);

%data for mbed
file = sprintf('%s%.0f%s',mbed,i,mbedftype)
fileID = fopen(file);
MdataT1 = textscan(fileID,'%f,%f,%f,%f,%f,%f,%f;');
s = size(MdataT1{7}, 1);
MdataT1 = [MdataT1{1}(1:s,1),MdataT1{2}(1:s,1),MdataT1{3}(1:s,1),MdataT1{4}(1:s,1),MdataT1{5}(1:s,1),MdataT1{6}(1:s,1),MdataT1{7}(1:s,1)];
fclose(fileID);

%Trial 2
%Data for tank
i = 2
file = sprintf('%s%.0f%s',ttank,i,ttankftype)
type2 = file
fileID = fopen(file);
TTdataT2 = cell2mat(textscan(fileID,'%f,%f,%f,%f,%f,%f,%f,%f,%f'));
fclose(fileID);

%data for mbed
file = sprintf('%s%.0f%s',mbed,i,mbedftype)
fileID = fopen(file);
MdataT2 = textscan(fileID,'%f,%f,%f,%f,%f,%f,%f;');
s = size(MdataT2{7}, 1);
MdataT2 = [MdataT2{1}(1:s,1),MdataT2{2}(1:s,1),MdataT2{3}(1:s,1),MdataT2{4}(1:s,1),MdataT2{5}(1:s,1),MdataT2{6}(1:s,1),MdataT2{7}(1:s,1)];
fclose(fileID);

%Imported and parsed

%%Tranposition and alignment

%Isolating relevant data, P for Post Processing
PMdataT1 = MdataT1;
PTTdataT1 = TTdataT1;
PMdataT2 = MdataT2;
PTTdataT2 = TTdataT2;
%Flips Encoder Values
PMdataT1(:,3) = MdataT1(:,3)*-1;
PMdataT2(:,3) = MdataT2(:,3)*-1;
%Adjusts mbed time to real time using average startup time offset
PMdataT1(:,1) = PMdataT1(:,1)+mbedOffset+t11;
PMdataT2(:,1) = PMdataT2(:,1)+mbedOffset+t21;
%%Converts force sensor readings to force and moment

%% Calibration of force sensor data from ATI-SI-65-5 sensor, 
%data must be 6 x length of signal
Fx = [0.16993   0.09364   0.47006 -32.15199  -1.18021  33.31933]/4.44326834940099;
Fy = [-0.64267  38.17545   0.39101 -18.49930   0.50312 -19.38630]/4.44326834940099;
Fz = [18.96967  -1.17595  18.99640  -1.24822  19.15753  -1.15282]/1.42033356713538;
Tx = [-0.07412   0.13668 -32.86964   2.02777  32.98708  -1.98078]/85.1075567214177;
Ty = [38.15079  -2.31494 -18.68362   1.25409 -19.23432   1.07116]/85.1075567214177;
Tz = [0.34277 -18.96632   0.21309 -18.53467   0.56354 -19.17391]/81.9176860041974;
C = [Fx; Fy; Fz; Tx; Ty; Tz]; % Calibration Matrix for SI-65-5 force sensor\

PTTdataT1(:,2:7) = PTTdataT1(:,2:7)*C;
PTTdataT2(:,2:7) = PTTdataT2(:,2:7)*C;
%initializes output variables
trial1 = zeros(1,4);
trial2 = zeros(1,4);

t = 1 %seconds before and after recorded times which you would like to zoom in on the relevant data
%meanValTTt1; mean value tow tank trial 1

i = find(PTTdataT1(:,1)>= t11 + t & PTTdataT1(:,1) <= t12 - t);
fmean = mean(PTTdataT1(i,2))-Fd;

%meanValMt1
i = find(PMdataT1(:,1)>= t11 + t & PMdataT1(:,1) <= t12 - t);
rpmmean = mean(PMdataT1(i,3));
amotmean = mean(abs(PMdataT1(i,4)-0.737119)*3.3/0.185)+0.065;
asysmean = mean(abs(PMdataT1(i,6)-0.737119)*3.3/0.185)+0.065;

trial1 = [fmean,rpmmean,amotmean,asysmean]

%meanValTTt2
i = find(PTTdataT2(:,1)>= t21 + t & PTTdataT2(:,1) <= t22 - t);
fmean = mean(PTTdataT2(i,2))-Fd;

%meanValMt2
i = find(PMdataT2(:,1)>= t11 + t & PMdataT2(:,1) <= t12 - t);
rpmmean = mean(PMdataT2(i,3));
amotmean = mean(abs(PMdataT2(i,4)-0.737119)*3.3/0.185)+0.065;
asysmean = mean(abs(PMdataT2(i,6)-0.737119)*3.3/0.185)+0.065;

trial2 = [fmean,rpmmean,amotmean,asysmean]

end