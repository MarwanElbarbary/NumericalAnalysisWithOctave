function numerical_methods_gui
    % GUI for selecting numerical methods to plot

    % Define parameters
    dt = 0.1;  % Time step
    T = 10;    % Final time
    t = 0:dt:T; % Time vector

    % Initial condition
    y0 = 1;

    % Compute numerical methods
    y_FE  = forward_euler(y0, t, dt);
    y_ME  = modified_euler(y0, t, dt);
    y_BE  = backward_euler(y0, t, dt);
    y_RK2 = runge_kutta2(y0, t, dt);
    y_RK4 = runge_kutta4(y0, t, dt);
    y_AB2 = adams_bashforth2(y0, t, dt);
    y_AM2 = adams_moulton2(y0, t, dt);

    % Exact solution
    y_exact = exp(-0.5*t) + 0.5*(sin(t) - cos(t));

    % Create GUI figure
    fig = figure('Name', 'Numerical Methods GUI', 'NumberTitle', 'off', 'Position', [100, 100, 800, 600]);
    ax = axes('Parent', fig, 'Position', [0.1, 0.3, 0.8, 0.6]);
    hold on;
    grid on;
    xlabel('Time (t)', 'FontSize', 14, 'FontWeight', 'bold');
    ylabel('Solution y', 'FontSize', 14, 'FontWeight', 'bold');
    title('Comparison of Numerical Methods for ODE Solving', 'FontSize', 16, 'FontWeight', 'bold');
    set(gca, 'Color', [0.95 0.95 0.95]);

    % Add buttons for each method
    uicontrol('Style', 'pushbutton', 'String', 'Forward Euler', 'Position', [50, 50, 120, 30], 'Callback', @(~,~) plot_method(t, y_FE, y_exact, 'Forward Euler', 'r-'));
    uicontrol('Style', 'pushbutton', 'String', 'Modified Euler', 'Position', [180, 50, 120, 30], 'Callback', @(~,~) plot_method(t, y_ME, y_exact, 'Modified Euler', 'b--'));
    uicontrol('Style', 'pushbutton', 'String', 'Backward Euler', 'Position', [310, 50, 120, 30], 'Callback', @(~,~) plot_method(t, y_BE, y_exact, 'Backward Euler', 'g-.'));
    uicontrol('Style', 'pushbutton', 'String', 'RK2', 'Position', [440, 50, 80, 30], 'Callback', @(~,~) plot_method(t, y_RK2, y_exact, 'RK2', 'm:'));
    uicontrol('Style', 'pushbutton', 'String', 'RK4', 'Position', [530, 50, 80, 30], 'Callback', @(~,~) plot_method(t, y_RK4, y_exact, 'RK4', 'c-'));
    uicontrol('Style', 'pushbutton', 'String', 'Adams-Bashforth', 'Position', [620, 50, 150, 30], 'Callback', @(~,~) plot_method(t, y_AB2, y_exact, 'Adams-Bashforth', 'y--'));
    uicontrol('Style', 'pushbutton', 'String', 'Adams-Moulton', 'Position', [50, 10, 150, 30], 'Callback', @(~,~) plot_method(t, y_AM2, y_exact, 'Adams-Moulton', [1 0.5 0]))

    % Button to show all methods
    uicontrol('Style', 'pushbutton', 'String', 'Show All', 'Position', [250, 10, 100, 30], 'Callback', @(~,~) plot_all_methods(t, y_FE, y_ME, y_BE, y_RK2, y_RK4, y_AB2, y_AM2, y_exact));

    hold off;
end

function plot_method(t, y, y_exact, method_name, color)
    % Plot selected method with exact solution
    cla;
    hold on;
    plot(t, y, color, 'LineWidth', 2);
    plot(t, y_exact, 'k--', 'LineWidth', 3);
    legend({method_name, 'Exact Solution'}, 'FontSize', 12, 'Location', 'best');
    title(['Solution using ', method_name]);
    hold off;
end

function plot_all_methods(t, y_FE, y_ME, y_BE, y_RK2, y_RK4, y_AB2, y_AM2, y_exact)
    % Plot all numerical methods with exact solution
    cla;
    hold on;
    plot(t, y_FE, 'r-', 'LineWidth', 2);
    plot(t, y_ME, 'b--', 'LineWidth', 2);
    plot(t, y_BE, 'g-.', 'LineWidth', 2);
    plot(t, y_RK2, 'm:', 'LineWidth', 2);
    plot(t, y_RK4, 'c-', 'LineWidth', 2);
    plot(t, y_AB2, 'y--', 'LineWidth', 2);
    plot(t, y_AM2, 'Color', [1 0.5 0], 'LineStyle', '-.', 'LineWidth', 2);
    plot(t, y_exact, 'k--', 'LineWidth', 3);
    legend({'Forward Euler', 'Modified Euler', 'Backward Euler', 'RK2', 'RK4', 'Adams-Bashforth', 'Adams-Moulton', 'Exact Solution'}, 'FontSize', 12, 'Location', 'northeastoutside');
    title('Comparison of All Methods');
    hold off;
end

