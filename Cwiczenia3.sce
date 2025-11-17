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
tablica(:,1) = yw // 6.c


// 7.
function y=fun(k, i, xw) // podać i o 1 większe
    if k == 1 then
        y = (f(xw(i+1)) - f(xw(i))) / (xw(i+1) - xw(i))
    else
        y = (fun(k-1, i+1, xw) - fun(k-1, i, xw)) / (xw(i+k) - xw(i))  
    end
endfunction

tablica(1:n,2) = fun(1, n, xw)
disp(tablica)

for k=1:n+1
    for i=1:n+1-k
        tablica(i,k+1) = fun(k, i, xw)
    end
end

disp(tablica)










