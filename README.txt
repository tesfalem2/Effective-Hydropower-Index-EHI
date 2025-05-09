Effective Hydropower Index (EHI)

This README file contains the description of Effective Hydropower Index, EHI metrics utilized in the current study of Abraham et al. (2025, Theoretical and applied climatology). Description of EHI analysis is shown below, and more extended description can be found in Abraham et al. (2025).
•	The Effective Hydropower Index (EHI) was calculated using the total water inflow (q_in) to the reservoir and the water release through turbines (q_turb) during a period of time.
•	The inflow was simulated by using HBV and turbine flow was obtained from the hydropower simulation function.
•	The EHI index tell us the proportion of useable amount of water (flow through the turbine) for power generation.

We analyzed the EHI index on seasonal and annual scales to see how this will be impacted due to climate change.

The function calculates the following outputs:
    
•	EHI_mon = is the Effective Hydropower Index calculated for each month
•	EHI_dry = is the EHI calculated for dry season in the past and future periods
•	EHI_wet = is the EHI calculated for wet season in the past and future periods 
•	EHI_longterm = the EHI calculated for the long-term values in the past and future periods
•	EHI_yearly = is the EHI calculated for each year flow in the past and future periods

language: Matlab

Included files:

1)	EHI_analysis_gh.m 
2)	EHI_Group1_Mon_81_2005_gh.m 
3)	EHI_Group1_Mon_2025_2100_gh.m

-	Input: inflow to the reservoir (q_in), and turbine outflow (q_turb) for both historical and future periods simulated by 5 GCM. 
-	Out puts: all outputs defined in the above function

4)	Vturbine_Vinflow_Plt_gh.m
Is a function plots the daily and annual dynamics of Volume of inflow, volume of turbine flow, EHI, and Energy production for historical and future period.

Reference
•	Abraham, T., Liu, Y., 2025. Climate Change Impact on Effective Water Use for Hydropower Generation of the Grand Ethiopian Renaissance Dam. Theoretical and applied climatology. 
