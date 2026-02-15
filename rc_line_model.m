function rc_out = rc_line_model(t, signal)

R = 50;
C = 2e-12;
tau = R*C;

sys = tf(1, [tau 1]);
rc_out = lsim(sys, signal, t);

end
