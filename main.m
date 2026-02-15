clc;
clear;
close all;

if ~exist('results','dir')
    mkdir('results');
end

%% Step 1: Generate Ideal Signal
[t, signal] = ideal_signal();

%% Step 2: RC Model
rc_output = rc_line_model(t, signal);

figure;
plot(t, signal);
hold on;
plot(t, rc_output);
title('RC Degradation');
legend('Ideal','RC Output');
grid on;
drawnow;
exportgraphics(gcf,'results/rc_degradation.png');

%% Step 3: RLC Model
rlc_output = rlc_line_model(t, signal);

figure;
plot(t, signal);
hold on;
plot(t, rlc_output);
title('RLC Ringing');
legend('Ideal','RLC Output');
grid on;
drawnow;
exportgraphics(gcf,'results/rlc_ringing.png');

%% Step 4: Crosstalk
crosstalk_noise = crosstalk_model(t);

figure;
plot(t, signal);
hold on;
plot(t, signal + crosstalk_noise);
title('Crosstalk Effect');
legend('Original','With Crosstalk');
grid on;
drawnow;
exportgraphics(gcf,'results/crosstalk_effect.png');

disp('Simulation Completed Successfully');
