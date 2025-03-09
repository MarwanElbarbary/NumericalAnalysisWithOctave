dt = 0.1; % Time step
T = 10;  % Final time
t = 0:dt:T; % Time vector
N = length(t);

% Initial condition
y0 = 1;

% Call different numerical methods
y_FE = forward_euler(y0, t, dt);
y_ME = modified_euler(y0, t, dt);
y_BE = backward_euler(y0, t, dt);
y_RK2 = runge_kutta2(y0, t, dt);
y_RK4 = runge_kutta4(y0, t, dt);
y_AB2 = adams_bashforth2(y0, t, dt);
y_AM2 = adams_moulton2(y0, t, dt);

% Exact solution
y_exact = exp(-0.5*t) + 0.5*(sin(t) - cos(t));

figure;
plot(t, y_FE, 'r--', 'LineWidth', 1.5); hold on;
plot(t, y_ME, 'b--', 'LineWidth', 1.5);
plot(t, y_BE, 'g--', 'LineWidth', 1.5);
plot(t, y_RK2, 'm--', 'LineWidth', 1.5);
plot(t, y_RK4, 'c--', 'LineWidth', 1.5);
plot(t, y_AB2, 'y--', 'LineWidth', 1.5);
plot(t, y_AM2, 'Color', [1 0.5 0], 'LineStyle', '--', 'LineWidth', 1.5);
plot(t, y_exact, 'k--', 'LineWidth', 1.5);

legend({'Forward Euler', 'Modified Euler', 'Backward Euler', 'RK2', 'RK4', 'Adams-Bashforth', 'Adams-Moulton', 'Exact Solution'});
xlabel('Time t');
ylabel('Solution y');
title('Comparison of Numerical Methods for ODE Solving');
grid on;

