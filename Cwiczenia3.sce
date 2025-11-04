clear
clc

n = 7
xbar = %pi/2
xw = [1
      2
      3
      4
      5
      6
      7
      8]

function y=f(x)
    y = sin(x)
endfunction

yw = f(xw)

// 4.
function y=oblicz_h(n, X)
    h = abs(X(1) - X(2))
    y = h
    for i=1:n
        if(abs(X(i) - X(i+1)) ~= h) then
            y = -1
            break
        end
    end
endfunction

h = oblicz_h(n, xw)
// 5.
function y=omega(x, n, X)
    y=1
    for i=1:n+1
        y=y*(x - X(i))
    end
endfunction

// 6.
tablica = zeros(n+1, n+1)
tablica(:,1) = yw //6.c
disp(tablica)
