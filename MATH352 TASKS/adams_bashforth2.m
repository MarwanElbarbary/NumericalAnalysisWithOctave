function y_AB2 = adams_bashforth2(y0, t, dt)
    N = length(t);
    y_AB2 = zeros(1, N);
    y_AB2(1) = y0;
    y_AB2(2) = forward_euler(y0, t(1:2), dt)(2); % Initialize using Forward Euler

    for i = 2:N-1
        y_AB2(i+1) = y_AB2(i) + (dt/2) * (3*(-0.5*y_AB2(i) + sin(t(i))) - (-0.5*y_AB2(i-1) + sin(t(i-1))));
    end
end

