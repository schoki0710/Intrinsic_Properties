function [a, b, baseline] = fit_exp1 ( x, y, m )

n = length(x);

baseline = mean (y(n-m+1:n));
y = y- baseline;
y(y<0) = 0;

fitobject = fit(x,y, 'exp1');
fit_coefficients_tau = coeffvalues (fitobject);

a  = fit_coefficients_tau (1)
b = fit_coefficients_tau (2)

end

