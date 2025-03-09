function y_ME = modified_euler(y0, t, dt)
    N = length(t);
    y_ME = zeros(1, N);
    y_ME(1) = y0;
    for i = 1:N-1
        y_predictor = y_ME(i) + dt * (-0.5*y_ME(i) + sin(t(i)));
        y_ME(i+1) = y_ME(i) + (dt/2) * ((-0.5*y_ME(i) + sin(t(i))) + (-0.5*y_predictor + sin(t(i+1))));
    end
end

