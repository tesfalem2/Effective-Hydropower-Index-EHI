%% The EHI calculated in Abraham et al. (2025, Theoretical and applied climatology)
% The Effective Hydropower Index (EHI) was using the total water inflow (q_in) to the reservoir and the water release through turbines (q_turb) during a period of time.
% The inflow is simulated using HBV and turbine flow was obtained from the hydropower simulation function.

% Set working directory
cd('E:\working directory\EHI_analysis')
%%
load('EHI_database.mat','EHI_database')
clearvars -except S_3cat Q_hist_fut EHI_database     %deletes all variables except X in workspace
%% Calculate the historical periods EHI analysis incuding all the Wet, dry and Long term EHI and yearly_mean_EHI
clearvars -except S_3cat Q_hist_fut EHI_database    %deletes all variables except X in workspace
for m=1:5 % m fo reach 5 GCMs
    q_turb = EHI_database{2,1}{2,m};
    q_in = EHI_database{2,1}{3,m};
    [EHI_mon,EHI_dry,EHI_wet,EHI_longterm,EHI_yearly] = EHI_Group1_Mon_81_2005_gh(q_in,q_turb);
    
    EHI_database{2,1}{5,m} = EHI_mon;
    EHI_database{2,1}{6,m} = EHI_dry;
    EHI_database{2,1}{7,m} = EHI_wet;
    EHI_database{2,1}{8,m} = EHI_longterm;
    EHI_database{2,1}{9,m} = EHI_yearly;
end
%% Calculate the future periods EHI analysis incuding all the Wet, dry and Long term EHI and yearly_mean_EHI
clearvars -except S_3cat Q_hist_fut EHI_database    %deletes all variables except X in workspace
for m=8:12
    q_turb = EHI_database{2,1}{2,m};
    q_in = EHI_database{2,1}{3,m};
    [EHI_mon,EHI_dry,EHI_wet,EHI_longterm,EHI_yearly] = EHI_Group1_Mon_2025_2100_gh(q_in,q_turb);
   
    EHI_database{2,1}{5,m} = EHI_mon;
    EHI_database{2,1}{6,m} = EHI_dry;
    EHI_database{2,1}{7,m} = EHI_wet;
    EHI_database{2,1}{8,m} = EHI_longterm;
    EHI_database{2,1}{9,m} = EHI_yearly;
end
%%
save('EHI_database.mat','EHI_database')
%% See the next code for GCM arrangement and plotting
clearvars -except S_3cat Q_hist_fut EHI_database    %deletes all variables except X in workspace


