close all; clear; clc;
%tests bag function

%%Handles and for plot aesthetics at end of the code - takes handles on figure objects, modifies them
%%accordingly to be consistent
color = [77,190,238; 119,172,48; 237,177,32; 217,83,25; 162,20,47]/255;
actualMarker = ["o","^","s","d","v"]; theoreticalMarker = "--";
sMarkerSize = 7; sLineWidth = 3;
xlabs = [];
ylabs = [];
legs = [];
axes = [];
ticks = [];
th_plots = [];
exp_plots = [];
figs = []; k = 1;

%data the function cannot open, or is not relevant goes in 'rejects' as a
%1xn string array
rejects = ["/diagnostics_agg",...
        "/diagnostics_toplevel_state",...
        "/rosout",...
        "/rosout_agg",...
        "/diagnostics",...
        "/diagnostics_toplevel_state"];
    
bag1 = bag2tab("water_test.bag",[]);
wx = cell2mat(bag1(8,:).Data);
wy = cell2mat(bag1(9,:).Data); 
wz = cell2mat(bag1(10,:).Data);
ax = cell2mat(bag1(11,:).Data);
ay = cell2mat(bag1(12,:).Data);
az = cell2mat(bag1(13,:).Data);

%>> plots angular velocities and accelerations
figs = [figs, figure(k)]; k = k+1;
plots = [];
subplot(2,1,1)
plots = [plots, plot(wx, 'Color', color(1,:), 'LineStyle', theoreticalMarker, 'LineWidth', sLineWidth)];
hold on
plots = [plots, plot(wy, 'Color', color(2,:), 'LineStyle', theoreticalMarker, 'LineWidth', sLineWidth)];
plots = [plots, plot(wz, 'Color', color(3,:), 'LineStyle', theoreticalMarker, 'LineWidth', sLineWidth)];

grid on
xticks(linspace(1,size(wx,1),20));
xtickangle(45);
yticks(linspace(min(wx),max(wx),10));
xtickformat('%.2f');
ytickformat('%.2f');
xlabs = [xlabs,xlabel("n")];ylabs = [ylabs,ylabel("rads/s")];
legs = [legs,legend("Wx", "Wy", "Wz")];
axes = [axes,gca];

subplot(2,1,2)
plots = [plots, plot(ax, 'Color', color(1,:), 'LineStyle', theoreticalMarker, 'LineWidth', sLineWidth)];
hold on
plots = [plots, plot(ay, 'Color', color(2,:), 'LineStyle', theoreticalMarker, 'LineWidth', sLineWidth)];
plots = [plots, plot(az, 'Color', color(3,:), 'LineStyle', theoreticalMarker, 'LineWidth', sLineWidth)];

grid on
xticks(linspace(1,size(ax,1),20));
xtickangle(45);
yticks(linspace(min(ax),max(ax),10));
xtickformat('%.2f');
ytickformat('%.2f');
xlabs = [xlabs,xlabel("n")];ylabs = [ylabs,ylabel("m/s^2")];
legs = [legs,legend("ax", "ay", "az")];
axes = [axes,gca];



%%Aesthetics for all plots - takes handles on figure objects, modifies them
%%accordingly to be consistent
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for j = 1:size(figs,2)
    set(figs(j),...
        'Position',[20,20,1800*0.65,1200*0.65],...
        'color','w');
end

for j = 1:size(axes,2)
    set([axes(j)],...
        'FontSize',12, ...
        'FontName', 'Arial');
end

for j = 1:size(legs,2)
    set(legs(j),...
        'FontSize',24, ...
        'FontName', 'Helvetica',...
        'Location','northeast',...
        'NumColumns',1,...
        'Orientation','horizontal',...
        'FontName', 'Arial');
end

labs = [xlabs,ylabs];
for j = size(labs,2)
    set(labs,...
        'FontName', 'Arial',...
        'FontSize',24);
end