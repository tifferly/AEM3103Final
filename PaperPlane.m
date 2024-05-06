%	Example 1.3-1 Paper Airplane Flight Path
%	Copyright 2005 by Robert Stengel
%	August 23, 2005

close all
clear all

	global CL CD S m g rho	
	S		=	0.017;			% Reference Area, m^2
	AR		=	0.86;			% Wing Aspect Ratio
	e		=	0.9;			% Oswald Efficiency Factor;
	m		=	0.003;			% Mass, kg
	g		=	9.8;			% Gravitational acceleration, m/s^2
	rho		=	1.225;			% Air density at Sea Level, kg/m^3	
	CLa		=	3.141592 * AR/(1 + sqrt(1 + (AR / 2)^2));
							% Lift-Coefficient Slope, per rad
	CDo		=	0.02;			% Zero-Lift Drag Coefficient
	epsilon	=	1 / (3.141592 * e * AR);% Induced Drag Factor	
	CL		=	sqrt(CDo / epsilon);	% CL for Maximum Lift/Drag Ratio
	CD		=	CDo + epsilon * CL^2;	% Corresponding CD
	LDmax	=	CL / CD;			% Maximum Lift/Drag Ratio
	Gam		=	-atan(1 / LDmax);	% Corresponding Flight Path Angle, rad
	V		=	sqrt(2 * m * g /(rho * S * (CL * cos(Gam) - CD * sin(Gam))));
							% Corresponding Velocity, m/s
	Alpha	=	CL / CLa;			% Corresponding Angle of Attack, rad
	
%	a) Equilibrium Glide at Maximum Lift/Drag Ratio
	H		=	2;			% Initial Height, m
	R		=	0;			% Initial Range, m
	to		=	0;			% Initial Time, sec
	tf		=	6;			% Final Time, sec
    v2 = 2;                 % Minimum Velocity
    v3 = 7.5;               % Maximum Velocity
    gam2 = -0.5;            % Min Gamma
    gam3 = 0.4;             % Max Gamma
	tspan	=	[to tf];

	xo		=	[V;Gam;H;R];
	[ta,xa]	=	ode23('EqMotion',tspan,xo);

    x1 = [V;gam2;H;R];
    [tb,xb]	=	ode23('EqMotion',tspan,x1);

    x2 = [V;gam3;H;R];
    [tc,xc]	=	ode23('EqMotion',tspan,x2);

    y1 = [v2;Gam;H;R];
    [ta2,xa2]	=	ode23('EqMotion',tspan,y1);

    y2 = [v3;Gam;H;R];
    [tb2,xb2]	=	ode23('EqMotion',tspan,y2);

    %Plotting

    figure
    subplot(2, 1, 1)
    hold on
    plot(xa(:,4), xa(:, 3), 'k', xb(:,4), xb(:,3), 'r', xc(:,4), xc(:,3), 'g')
    title('Height vs. Range for Different Gammas')
    legend(sprintf("Gamma1=%g", Gam), sprintf("Gamma2=%g", gam2), ...
        sprintf("Gamma3=%g", gam3) )
    xlabel("Range (m)")
    ylabel("Height (m)")

    subplot(2, 1, 2)
    hold on
    plot(xa(:,4), xa(:, 3), 'k', xa2(:,4), xa2(:,3), 'r', xb2(:,4), xb2(:,3), 'g')
    title('Height vs. Range for Different Velocities')
    legend(sprintf("Vel1=%g", V), sprintf("Vel2=%g", v2), sprintf("Vel3=%g", v3))
    xlabel("Range (m)")
    ylabel("Height (m)")
    
%% 3: Monte Carlo
figure
hold on
timerange = linspace(0.1, 6, 100);
tavg = 0;
xavg = 0;

for i = 1: 100
    randV = v2 + (v3-v2)*rand(1);
    randG = gam2 + (gam3-gam2)*rand(1);

    xo		=	[randV;randG;H;R];
	[trand,xrand]	=	ode23('EqMotion',timerange,xo);
    
    tavg = tavg + trand;
    xavg = xavg + xrand;
    plot(xrand(:, 4), xrand(:, 3))
    grid
    title("Height vs. Range (100 Random Iterations)")
    xlabel("Range (m)")
    ylabel("Height (m)")
end

tavg = tavg/100;
xavg = xavg/100;

%% 4: Apply curve fit

c1 = polyfit(trand, xrand(:,4), 6);
f1 = polyval(c1, trand);
c2 = polyfit(trand, xrand(:,3), 6);
f2 = polyval(c2, trand);

% Plot
figure
hold on
subplot(2, 1, 1)
plot(tavg, f1, 'r')
title("Time vs. Range (Curve Fit)")
xlabel("Time (s)")
ylabel("Range (m)")
grid
subplot(2, 1, 2)
plot(tavg, f2, 'g')
title("Time vs. Height (Curve Fit)")
xlabel("Time (s)")
ylabel("Height (m)")
grid

%% 5: Time Derivative

dh = diff(f1)./diff(tavg);
dr = diff(f2)./diff(tavg);

% Plot

figure
hold on
subplot(2, 1, 1)
plot(tavg(2:end), dr, 'b')
title("Time Derivative of Range")
xlabel("Time (s)")
ylabel("Range (m)")
grid
subplot(2, 1, 2)
plot(tavg(2:end), dh, 'm')
title("Time Derivative of Height")
xlabel("Time (s)")
ylabel("Height (m)")
grid

