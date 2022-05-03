%%
% Abe Jordan
% Emily Currie
% ECE 414
% Final Project
% Misc stuff

%% clear variables and workspace
clear;
clc;

%% set up variables
t0 = 0; % simulation start time
t1 = 50; % simulation end time
t_step = 1e-3;

t_lims = [t0 t1];

%% simple transfer function between x and theta
model = sim('abe_x_theta_simple.slx',...
            'StartTime', sprintf('%i', t0),...
            'StopTime', sprintf('%i', t1),...
            'MaxStep', sprintf('%i', t_step));
model_x_ref = get(model, 'x_ref');
model_x = get(model, 'x');

t_x_ref = model_x_ref.Time;
x_ref = model_x_ref.Data;

t_x = model_x.Time;
x = model_x.Data;

% plot desired ball position vs balls approximate position
figure('name', 'ece 414 project position');
yyaxis left;
stairs(t_x_ref, x_ref);
xlim(t_lims);
ylim([-25 25]);
xlabel('Time (s)');
ylabel('Desired Position (cm)');
hold on;

yyaxis right;
plot(t_x, x);
ylim([-25 25]);
ylabel('Slope-Limited Position (cm)');

grid on;
