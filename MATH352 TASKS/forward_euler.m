function y_FE = forward_euler(y0, t, dt)
    N = length(t);
    y_FE = zeros(1, N);
    y_FE(1) = y0;
    for i = 1:N-1
        y_FE(i+1) = y_FE(i) + dt * (-0.5*y_FE(i) + sin(t(i)));
    end
end

