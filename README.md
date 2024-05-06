  # AEM3103Final
  # Paper Airplane Numerical Study
  Final Project: AEM 3103 Spring 2024

  - By: Tiffany Shen

  ## Summary of Findings
  <Show the variations studied in a table>

| Flight Path Angle  | Velocity |
| ------------- | ------------- |
| -0.179 (nominal)  | 3.549 (nominal)  |
| -0.5  | 2  |
| 0.4  | 7.5  |

  Summarized what was accomplished in this study.  Describe 2-4 observations from simulating the flight path.
  Reference the figures below as needed.

  In this study we are interested in investigating the flight properties of a glider. This was done by calculating and observing different relationships between flight properties such as range, height, time, velocities, and flight path angles. 
  Some observations:
  - It can be seen in figure 1 that the height vs. range for varying gammas has less variation than height vs. range for varying velocities. It can be seen that higher velocity has a smaller slope and has a peak at around range 3.5m whereas the lower velocity has a higher slope and a trough at around range 3.5m. This is also supported by the first graph in figure 2 where 100 iterations are showing th esame variation pattern.
  - It can also noted that height and range share an inverse relationship with each other always, this is seen in figure 1 and 2.
  - While all the figures change slightly with each time the script is run, it is seen that figure 3 involving, time derivatives, changes dramatically each time the script is run.

  *If the analysis falls short of the goal, this is your chance to explain what was done or what were the barriers.*
 
  # Code Listing

[`close all`](https://github.com/tifferly/AEM3103Final/blob/main/PaperPlane.m): Closes all figures present.

[`clear all`](https://github.com/tifferly/AEM3103Final/blob/main/PaperPlane.m): Clears and removes all variables currently listed in the workspace.

[`global`](https://github.com/tifferly/AEM3103Final/blob/main/PaperPlane.m): Declares variables as global with which all functions in the script are able to access the global variables.

[`[tb,xb]=ode23('EqMotion',tspan,x1)`](https://github.com/tifferly/AEM3103Final/blob/main/PaperPlane.m): Integrates the system of differential equations y′=f(t,y). With span 'tspan' and initial conditions x1. Each row in the solution array xb corresponds to a value returned in column vector tb.

[`tspan=[to tf]`](https://github.com/tifferly/AEM3103Final/blob/main/PaperPlane.m): Sets the span for above function to integrate from 'to' to 'tf'.

[`timerange=linspace(0.1, 6, 100)`](https://github.com/tifferly/AEM3103Final/blob/main/PaperPlane.m): Creates a row vector of 100 evenly spaced numbers between 0.1 and 6.

[`for`](https://github.com/tifferly/AEM3103Final/blob/main/PaperPlane.m): The for loop is used to execute a code for a specific number of iterations.

[`polyfit(x, y, n),`](https://github.com/tifferly/AEM3103Final/blob/main/PaperPlane.m): Gives the coefficients of a polynomial of degree n that is a best fit for the data in y.

[`polyval(c2, trand)`](https://github.com/tifferly/AEM3103Final/blob/main/PaperPlane.m): Evaluates the polynomial c2 for each point of trand.

[`diff(f1)`](https://github.com/tifferly/AEM3103Final/blob/main/PaperPlane.m): Calculates the differences between elements netx to each other in f1.

[`figure`](https://github.com/tifferly/AEM3103Final/blob/main/PaperPlane.m): Creates a figure.

[`hold on`](https://github.com/tifferly/AEM3103Final/blob/main/PaperPlane.m): Keeps the code working on the figure previously made.

[`subplot(2, 1, 2)`](https://github.com/tifferly/AEM3103Final/blob/main/PaperPlane.m): Creates multiple plots in one figure. In this case with a 2 by 1 grid working on plot number 2.

[`plot(tavg, f2, 'g')`](https://github.com/tifferly/AEM3103Final/blob/main/PaperPlane.m): Makes a 2 dimentional line plot with tavg on the x-axis and f2 on the y axis and the 'g' represents the color which, in this case, is green.

[`title("Time Derivative of Height")`](https://github.com/tifferly/AEM3103Final/blob/main/PaperPlane.m): Creates the title of the graph "Time Derivative of Height".

[`xlabel("Time (s)")`](https://github.com/tifferly/AEM3103Final/blob/main/PaperPlane.m): Labels the x axis on the graph "Time (s)".

[`ylabel("Range (m)")`](https://github.com/tifferly/AEM3103Final/blob/main/PaperPlane.m): Labels the y axis on the graph "Range (m)".

[`grid`](https://github.com/tifferly/AEM3103Final/blob/main/PaperPlane.m): Creates a grid on the graph.

  # Figures

  ## Fig. 1: Single Parameter Variation
  <img width="485" alt="Screenshot 2024-05-06 at 2 04 13 PM" src="https://github.com/tifferly/AEM3103Final/assets/167820456/a6d5d4af-ee69-420a-ba67-d894eb2fb697">

  Shows two plots in which both measure height for varying flight path angle(gamma) and velocity values. The top graph shows three different gamma values with their corresponding heights. The bottom graph shows three different velocities and their corresponding heights. Nominal trajectory for velocity is 3.55m/s while the nominal trajectory for initial flight path angle is -0.18rad

  ## Fig. 2: Monte Carlo Simulation
  <img width="506" alt="Screenshot 2024-05-06 at 2 04 40 PM" src="https://github.com/tifferly/AEM3103Final/assets/167820456/89d11d36-fbab-4006-84ac-a29c3ee8c33a">
<img width="495" alt="Screenshot 2024-05-06 at 2 05 06 PM" src="https://github.com/tifferly/AEM3103Final/assets/167820456/6d66d290-cd26-4dce-a36e-fe03a7bbe30e">

  Figure 2 shows two graphs in which 100 random iterations within an expected range were considered. The first graph on the left shows those 100 iterations graphed by height vs. range. The second graph to the right shows two curve fit plots of time vs. range and time vs. height.

 ## Fig. 3: Time Derivatives
<img width="510" alt="Screenshot 2024-05-06 at 6 03 12 PM" src="https://github.com/tifferly/AEM3103Final/assets/167820456/0f746047-18f6-4dff-bd29-a5b5ccde5751">

  Figure 3 shows the first time derivative of the previously shown average trajectory. The top subplot shows the time derivative of range while the bottom subplot show sthe time derivative for height.

