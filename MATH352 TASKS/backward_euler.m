function y_BE = backward_euler(y0, t, dt)
    N = length(t);
    y_BE = zeros(1, N);
    y_BE(1) = y0;
    for i = 1:N-1
        y_BE(i+1) = (y_BE(i) + dt * sin(t(i+1))) / (1 + 0.5*dt);
    end
end

