function [t, signal] = ideal_signal()

t = 0:1e-10:50e-9;
f = 100e6;
signal = square(2*pi*f*t);

end