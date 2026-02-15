function noise = crosstalk_model(t)

f_aggressor = 120e6;                 
aggressor = square(2*pi*f_aggressor*t);

k = 0.05;

dt = t(2) - t(1);
dVdt = [0 diff(aggressor)/dt];

noise = k * dVdt;

end
