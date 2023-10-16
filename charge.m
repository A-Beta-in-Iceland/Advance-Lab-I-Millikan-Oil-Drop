function [a, q, sig] = charge(rise, fall, T, p, V)
%%set up variables
    rise = abs(rise(:, 2)) .* 10^-3;
    fall = abs(fall(:, 2)) .* 10^-3;
    vr = mean(rise)
    sig_r = std(rise);
    vf = mean(fall)
    sig_f = std(fall);
    %density of oil
    den = 886;
    g = 9.8;
    %viscosity of air
    eta = 0.0048 * T + 1.728;
    b = 8.2 * 10^-3;
    d = 0.3025 / 39.37;
    E = V/d;
    %%calculate radius a
    a = (-b + sqrt(b^2 - 9*p* (vf - vr)) / (den * g)) / (2 * p) ;
    sig_a = (a / 2 * (vf - vr)) * sqrt(sig_f^2 + sig_r^2);
    eta = eta / (1 + (b/ (p *a)));
    B = 6 * pi * eta;
    A = 4 * pi * den * g /3;
    F = vr * B * sqrt(B * (vf - vr) / (2 * A)) + A * (B * (vf - vr) / (2 * A))^(3/2);
    q = F / E;
    sig_v = sqrt(sig_r^2 + sig_f^2);
    sig_v = ((vf + vr)/ (vf - vr)) * sqrt((sig_v^2 /(vf + vr))^2 + (sig_v^2 /(vf - vr))^2);
    sig_a3 = 3* a^2 * sig_a * A;
    sig = (q) * sqrt((sig_v * (vf - vr)/(vf + vr))^2 + (sig_a3 / (A * a^3))^2);
end
