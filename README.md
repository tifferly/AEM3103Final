# AEM3103Final
  # Paper Airplane Numerical Study
  Final Project: AEM 3103 Spring 2024

  - By: Tiffany Shen

  ## Summary of Findings
  <Show the variations studied in a table>

  Summarized what was accomplished in this study.  Describe 2-4 observations from simulating the flight path.
  Reference the figures below as needed.

  *If the analysis falls short of the goal, this is your chance to explain what was done or what were the barriers.*
 
  # Code Listing
  A list of each function/script and a single-line description of what it does.  The name of the function/script should link to the file in the repository on GitHub.

close all
clear all

global

tspan	=	[to tf];


x1 = [V;gam2;H;R];
[tb,xb]	=	ode23('EqMotion',tspan,x1);
timerange = linspace(0.1, 6, 100);

for 

polyfit(trand, xrand(:,3), 6);
polyval(c2, trand);
diff(f1)./diff(tavg);
diff(f2)./diff(tavg);
figure
hold on
subplot(2, 1, 2)
plot(tavg(2:end), dh, 'm')
title("Time Derivative of Height")
xlabel("Time (s)")
ylabel("Range (m)")
grid

  # Figures

  ## Fig. 1: Single Parameter Variation
  <img width="485" alt="Screenshot 2024-05-06 at 2 04 13 PM" src="https://github.com/tifferly/AEM3103Final/assets/167820456/a6d5d4af-ee69-420a-ba67-d894eb2fb697">

  Shows two plots in which both measure height for varying flight path angle(gamma) and velocity values. The top graph shows three different gamma values with their corresponding heights. The bottom graph shows three different velocities and their corresponding heights. Nominal trajectory for velocity is 3.55m/s while the nominal trajectory for initial flight path angle is -0.18rad

  ## Fig. 2: Monte Carlo Simulation
  <img width="506" alt="Screenshot 2024-05-06 at 2 04 40 PM" src="https://github.com/tifferly/AEM3103Final/assets/167820456/89d11d36-fbab-4006-84ac-a29c3ee8c33a">
<img width="495" alt="Screenshot 2024-05-06 at 2 05 06 PM" src="https://github.com/tifferly/AEM3103Final/assets/167820456/6d66d290-cd26-4dce-a36e-fe03a7bbe30e">

  Figure 2 shows two graphs in which 100 random iterations within an expected range were considered. The first graph on the left shows those 100 iterations graphed by height vs. range. The second graph to the right shows two curve fit plots of time vs. range and time vs. height.

 ## Fig. 3: Time Derivatives
 <img width="490" alt="Screenshot 2024-05-06 at 2 05 27 PM" src="https://github.com/tifferly/AEM3103Final/assets/167820456/61f5766c-fe25-4cd5-a2e2-ddc7fa9cc2a0">

  Figure 3 shows the first time derivative of the previously shown average trajectory. The top subplot shows the time derivative of range while the bottom subplot show sthe time derivative for height.

