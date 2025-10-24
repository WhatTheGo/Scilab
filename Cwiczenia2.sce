clear
clc

n = 3
a = -0.5
b = 2*%pi
xw(1)= 0  //xi = xw(i+1)
xw(2) = %pi/4
xw(3) = %pi/2
xw(4) = 3*%pi/2
_x = 9*%pi/10
r = 2

function y = fp(x)
    y = sin(x)
endfunction

for i=1:n+1
    yw(i) = fp(xw(i))
end

function y = f_n_plus_1()
endfunction
