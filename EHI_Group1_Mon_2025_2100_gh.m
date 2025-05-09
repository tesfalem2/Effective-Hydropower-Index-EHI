%% EHI calculation for histrorical periods 1981-2005
function [EHI_mon,EHI_dry,EHI_wet,EHI_longterm,EHI_yearly] = EHI_Group1_Mon_2025_2100_gh(q_in,q_turb)
% Inputs
% q_in = daily inflow to the reservior;
% q_turb = daily outflow from the turbine;

% EHI_mon = is the Effective Hydropower Index calculated for each month
% EHI_dry = is the EHI calculated for dry season in the past and future periods
% EHI_wet = is the EHI calculated for wet season in the past and future periods 
% EHI_longterm = the EHI calculated for the long-term values in the past and future periods
% EHI_yearly = is the EHI calculated for each year flow in the past and future periods

startYear = 2025; % always only change this data
endYear = 2099;

inial_YR = startYear-1; % 1980
YearNum = [startYear:endYear]; % simulation paeriods
nYear = endYear-startYear+1;

Yearly_data_Vin = cell(1,nYear); %
Yearly_data_Vturb = cell(1,nYear); % 

StartDate = datenum(startYear,1,1);
EndDate = datenum(endYear,12,31);

V = datevec((StartDate:EndDate)'); % converts the date numbers to date vectors
%%%%% pre-allocation for Vinflow and Vturb yr and monthly
Vin_yr = zeros(nYear,1);
Vturb_yr = zeros(nYear,1);

% Annual Volume and Annual EHI calculation
for j=startYear:endYear  % for year 2025:2100
    Yearly_Indx = V(:,1) == j;
    Vin_yr(j-inial_YR,:) = sum(q_in(Yearly_Indx));
    Vturb_yr(j-inial_YR,:) = sum(q_turb(Yearly_Indx)); 
    % 
    Yearly_data_Vin{1,j-inial_YR} = q_in(Yearly_Indx);
    Yearly_data_Vturb{1,j-inial_YR} = q_turb(Yearly_Indx);
end
EHI_yearly = Vturb_yr./Vin_yr;

% Monthly EHI; Pre-allocation 
Vin_mon = nan(12,nYear);
Vturb_mon = nan(12,nYear);

for j=1:nYear  % for 1:75
    StartDate = datenum(YearNum(:,j),1,1);
    EndDate = datenum(YearNum(:,j),12,31);
    V = datevec((StartDate:EndDate)'); % converts the date numbers to date vectors
    for i=1:12   % for months 1=Jan and 12=Dec
        Monthly_Indx = V(:,2) == i;
        Vin_mon(i,j) = nansum(Yearly_data_Vin{1,j}(Monthly_Indx));
        Vturb_mon(i,j) = nansum(Yearly_data_Vturb{1,j}(Monthly_Indx));
    end
end
EHI_mon_matrix = Vturb_mon./Vin_mon;
EHI_mon = EHI_mon_matrix(:);
% % wet and dry EHI calculation
Vin_dry = nan(nYear,1);
Vin_wet = nan(nYear,1);
Vturb_dry = nan(nYear,1);
Vturb_wet = nan(nYear,1);
for j=1:nYear
    Vin_dry(j,:) = mean(Vin_mon([1:5,10:12],j));
    Vin_wet(j,:) = mean(Vin_mon(6:9,j)); % 6=june, 9=Sep
    
    Vturb_dry(j,:) = mean(Vturb_mon([1:5,10:12],j));
    Vturb_wet(j,:) = mean(Vturb_mon(6:9,j));
end
EHI_wet = Vturb_wet./Vin_wet;
EHI_dry = Vturb_dry./Vin_dry;
% longterm EHI
EHI_longterm = sum(q_turb)/sum(q_in);
end
%%
