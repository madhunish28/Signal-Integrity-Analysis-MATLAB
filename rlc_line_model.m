function rlc_out = rlc_line_model(t, signal)

R = 50;
L = 5e-9;
C = 2e-12;

sys = tf(1, [L*C R*C 1]);
rlc_out = lsim(sys, signal, t);

end