function y_AM2 = adams_moulton2(y0, t, dt)
    N = length(t);
    y_AM2 = zeros(1, N);
    y_AM2(1) = y0;
    y_AM2(2) = forward_euler(y0, t(1:2), dt)(2); % Initialize using Forward Euler

    for i = 2:N-1
        y_AM2(i+1) = (y_AM2(i) + (dt/12) * (5*sin(t(i+1)) + 8*sin(t(i)) - sin(t(i-1)))) / (1 + 5*dt/12);
    end
end

