function y_RK4 = runge_kutta4(y0, t, dt)
    N = length(t);
    y_RK4 = zeros(1, N);
    y_RK4(1) = y0;
    for i = 1:N-1
        k1 = -0.5*y_RK4(i) + sin(t(i));
        k2 = -0.5*(y_RK4(i) + dt*k1/2) + sin(t(i) + dt/2);
        k3 = -0.5*(y_RK4(i) + dt*k2/2) + sin(t(i) + dt/2);
        k4 = -0.5*(y_RK4(i) + dt*k3) + sin(t(i) + dt);
        y_RK4(i+1) = y_RK4(i) + (dt/6) * (k1 + 2*k2 + 2*k3 + k4);
    end
end

