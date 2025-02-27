function [a, b, c, d, baseline] = fit_exp2 ( x, y, m )

n = length(x);

baseline = mean (y(n-m+1:n));
y = y- baseline;
y(y<0) = 0;

fitobject = fit(x,y, 'exp2');
fit_coefficients_tau = coeffvalues (fitobject);

a  = fit_coefficients_tau (1)
b = fit_coefficients_tau (2)
c = fit_coefficients_tau (3)
d = fit_coefficients_tau (4)


end

