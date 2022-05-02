%%
% Abe Jordan
% Emily Currie
% ECE 414
% Final Project
%% clear workspace and variables
clc;
clear;

%% set up variables
t0 = 0; % simulation start time
t1 = 50; % simulation end time
t_step = 1e-3;

% min / max position for ball
x_min = -25;
x_max = 25;

% min / max angle for track
theta_min = -1 * pi / 2;
theta_max = pi / 2;

t_lims = [t0 t1];
x_lims = [x_min x_max];
theta_lims = [theta_min theta_max];

%% run simulation and get results
model = sim('abe_simulink_model.slx',...
            'StartTime', sprintf('%i', t0),...
            'StopTime', sprintf('%i', t1),...
            'MaxStep', sprintf('%i', t_step));
model_x0 = get(model, 'x0');
model_x0_sl = get(model, 'x0_sl');
model_theta_r = get(model, 'theta_r');

t_x0 = model_x0.Time;
x0 = model_x0.Data;

t_x0_sl = model_x0_sl.Time;
x0_sl = model_x0_sl.Data;

t_theta_r = model_theta_r.Time;
theta_r = model_theta_r.Data;

%% plot results
figure('name', 'ece414 project position');
yyaxis left;
stairs(t_x0, x0);
xlim(t_lims);
ylim(x_lims);
xlabel('Time (s)');
ylabel('Desired Position (cm)');
hold on;

yyaxis right;
plot(t_x0_sl, x0_sl);
ylim(x_lims);
ylabel('Slope-Limited Desired Position (cm)');

grid on;
