%% Is a function used to plot the daily and annual dynamics of Volume of inflow, 
% volume of turbine flow, EHI, Energy production for historical and future period.

% Reference: Abraham, T., Liu, Y., 2025. Climate Change Impact on Effective Water Use for Hydropower Generation of the Grand Ethiopian Renaissance Dam. Theoretical and applied climatology. 

cd('E:\PhD vacancies\Vturbine_Vinflow plot')
%% Data preparation for fig S2
load('EHI_database4Fig_S2.mat','EHI_database4Fig_S2')
clearvars -except S_3cat Q_hist_fut EHI_database EHI_database4Fig_S2

%% extract the data
Vin = [EHI_database4Fig_S2{2, 1}{19, 3} ;EHI_database4Fig_S2{2, 1}{19,10}  ];
Vturb = [EHI_database4Fig_S2{2, 1}{20, 3} ;EHI_database4Fig_S2{2, 1}{20,10}  ];
EHI_yearly = [EHI_database4Fig_S2{2, 1}{21, 3} ;EHI_database4Fig_S2{2, 1}{21,10}  ];
Vpcp = [EHI_database4Fig_S2{2, 1}{22, 3} ;EHI_database4Fig_S2{2, 1}{22,10}  ];
Enery_yr = [EHI_database4Fig_S2{2, 1}{23, 3} ;EHI_database4Fig_S2{2, 1}{23,10}  ];
%% daily inputs
Qturb = [EHI_database4Fig_S2{2, 1}{2,3} ;EHI_database4Fig_S2{2, 1}{2,10}];
Qin = [EHI_database4Fig_S2{2, 1}{3,3} ;EHI_database4Fig_S2{2, 1}{3,10}];
Pdaily = [EHI_database4Fig_S2{2, 1}{24,3} ;EHI_database4Fig_S2{2, 1}{24,10}];
Energ_daily = [S_3cat{2,1}{6,3};S_3cat{2, 1}{6,10}];
%% Create figure
% figure;
set(gcf, 'Position', [100 100 1000 600]); % Wider figure for 3 axes

% Main axes for streamflow and precipitation
subplot(4,1,1)
n=length(Vin);
ax1 = gca;
hold(ax1, 'on');

% Plot Vinflow and Vturbine (left y-axis - normal direction)
yyaxis left;
plot(Vin, 'b-', 'LineWidth', 2, 'DisplayName', 'inflow'); hold on
plot(Vturb, 'g-', 'LineWidth', 2, 'DisplayName', 'turbine');
set(gca,'xlim',[0,n+1],'xtick',[1:25:n+2],'xticklabel',{'1981','2005','2050','2075','2100'})

set(gca,'xticklabelrotation',90,'FontSize', 12)
ylabel('Annual Water volume (bcm)', 'FontSize', 12);
ylim([0 150]);

% Plot EHI (right y-axis - normal direction)
yyaxis right;
plot(EHI_yearly, 'r-', 'LineWidth', 2, 'DisplayName', 'EHI'); hold on
plot(ones(n,1),'--k')
ylabel('Annual EHI (-)', 'FontSize', 12);
ylim([-2 6]);

% Create second right y-axis for Precipitation (reversed direction)
ax2 = axes('Position', ax1.Position, ...
    'YAxisLocation', 'right', ...
    'Color', 'none', ...
    'YDir', 'reverse', ...  % This reverses the axis direction
    'YColor', [0.5 0.5 0.5]);
hold(ax2, 'on');
% Plot Precipitation on second right axis (reversed)
p = bar(Vpcp, 'FaceColor', [0.5 0.5 0.5], 'EdgeColor', [0.5 0.5 0.5], ...
    'BarWidth', 0.1,'DisplayName', 'precipitation');
ylabel('Total Precipitation (mm)', 'FontSize', 12);
ylim([0 4500]);  % Reversed limits for reversed axis

% Link x-axes and make main axis visible
linkaxes([ax1 ax2], 'x');
ax1.Box = 'off';
ax2.XAxis.Visible = 'off'; % Hide duplicate x-axis
% Formatting
legend('V_{inflow}','V_{turbine}','EHI','Precipitation','FontSize', 12)
grid on;
%

subplot(4,1,2)
ax1 = gca;
hold(ax1, 'on');
n = length(Qturb);  
% Plot Vinflow and Vturbine (left y-axis - normal direction)
yyaxis left;
plot(Qin, 'b-', 'LineWidth', 1, 'DisplayName', 'inflow'); hold on
plot(Qturb, 'g-', 'LineWidth', 1, 'DisplayName', 'turbine');
set(gca,'xlim',[0,n+1],'xtick',[1:25*365:n+2],'xticklabel',{'1981','2005','2050','2075','2100'})
%         set(gca,'xlim',[0,n+1],'xtick',[1:1:n],'xticklabel',{'1981','1982','1983','1984','1985','1986','1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005'})
set(gca,'xticklabelrotation',90,'FontSize', 12)
ylabel('Q_{inflow} & Q_{turbine} (bcm)', 'FontSize', 12);
ylim([0 5]);

% Plot EHI (right y-axis - normal direction)
yyaxis right;
plot([]);
set(gca,'yticklabel',{'','','','','','',''})  
% Create second right y-axis for Precipitation (reversed direction)
ax2 = axes('Position', ax1.Position, ...
    'YAxisLocation', 'right', ...
    'Color', 'none', ...
    'YDir', 'reverse', ...  % This reverses the axis direction
    'YColor', [0.5 0.5 0.5]);
hold(ax2, 'on');
% Plot Precipitation on second right axis (reversed)
p = bar(Pdaily, 'FaceColor', [0.5 0.5 0.5], 'EdgeColor', [0.5 0.5 0.5], ...
    'BarWidth', 0.1,'DisplayName', 'precipitation');
ylabel('Precipitation (mm)', 'FontSize', 12);
ylim([0 100]);  % Reversed limits for reversed axis

% Link x-axes and make main axis visible
linkaxes([ax1 ax2], 'x');
ax1.Box = 'off';
ax2.XAxis.Visible = 'off'; % Hide duplicate x-axis
% Formatting
legend('Q_{inflow}','Q_{turbine}','Precipitation','FontSize', 12)
grid on;
%%  Fig 6 in EHI paper
print('')
%% fig S3

subplot(2,1,1)
ax1 = gca;
hold(ax1, 'on');
n = length(Qturb);  
% Plot Vinflow and Vturbine (left y-axis - normal direction)
yyaxis left;
plot(Qin, 'b-', 'LineWidth', 1, 'DisplayName', 'inflow'); hold on
plot(Qturb, 'g-', 'LineWidth', 1, 'DisplayName', 'turbine');
set(gca,'xlim',[0,n+1],'xtick',[1:25*365:n+2],'xticklabel',{'1981','2005','2050','2075','2100'})
set(gca,'xticklabelrotation',90,'FontSize', 12)
ylabel('Q_{inflow} & Q_{turbine} (bcm)', 'FontSize', 12);
ylim([0 7]);

% Plot EHI (right y-axis - normal direction)
yyaxis right;
bar(Pdaily);
ylabel('Precipitation (mm)', 'FontSize', 12);
%     set(gca,'yticklabel',{'','','','','','',''})
ylim([-20 60]);

% Create second right y-axis for Precipitation (reversed direction)
ax2 = axes('Position', ax1.Position, ...
    'YAxisLocation', 'right', ...
    'Color', 'none', ...
    'YDir', 'reverse', ...  % This reverses the axis direction
    'YColor', [0.5 0.5 0.5]);
hold(ax2, 'on');
% Plot Precipitation on second right axis (reversed)
p = bar(Energ_daily, 'FaceColor', [0.5 0.5 0.5], 'EdgeColor', [0.5 0.5 0.5], ...
    'BarWidth', 0.1,'DisplayName', 'precipitation');
ylabel('Energy (GWh/day)', 'FontSize', 12);
ylim([0 100]);  % Reversed limits for reversed axis

% Link x-axes and make main axis visible
linkaxes([ax1 ax2], 'x');
ax1.Box = 'off';
ax2.XAxis.Visible = 'off'; % Hide duplicate x-axis
% Formatting
legend('Q_{inflow}','Q_{turbine}','Energy_{daily}','Precipitation','FontSize', 12)
grid on;

subplot(2,1,2)
n=100;
ax1 = gca;
hold(ax1, 'on');

% Plot Vinflow and Vturbine (left y-axis - normal direction)
yyaxis left;
plot(Enery_yr, 'b-', 'LineWidth', 2, 'DisplayName', 'inflow'); hold on
set(gca,'xlim',[0,n+1],'xtick',[1:25:n+2],'xticklabel',{'1981','2005','2050','2075','2100'})
set(gca,'xticklabelrotation',90,'FontSize', 12)
ylabel('Annual Energy (GWh)', 'FontSize', 12);
ylim([0 12000]);

% Plot EHI (right y-axis - normal direction)
yyaxis right;
plot(EHI_yearly, 'r-', 'LineWidth', 2, 'DisplayName', 'EHI'); hold on
plot(ones(n,1),'--k')
ylabel('Annual EHI (-)', 'FontSize', 12);
ylim([-1 3]);
legend('Annual Energy (GWh)','Annual EHI (-)','FontSize', 12)
grid on;

%%
print('E:\PhD vacancies\HydroPower_project\2nd GERD paper\final submitted\Theoretical and applied climatology\Vturbine_Vinflow plot\Fig S3 Energy_EHI','-djpeg','-r900')

    