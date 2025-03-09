function y_RK2 = runge_kutta2(y0, t, dt)
    N = length(t);
    y_RK2 = zeros(1, N);
    y_RK2(1) = y0;
    for i = 1:N-1
        k1 = -0.5*y_RK2(i) + sin(t(i));
        k2 = -0.5*(y_RK2(i) + dt*k1/2) + sin(t(i) + dt/2);
        y_RK2(i+1) = y_RK2(i) + dt * k2;
    end
end

