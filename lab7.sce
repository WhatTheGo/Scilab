clc
clear

n = 8
xw = [-1.1; -0.83; -0.57; -0.28; -0.02; 0.16; 0.47; 0.95; 1.23]
m = 1
lp = 100
punkty = linspace(xw(1) - 0.1, xw(n+1) + 0.1, lp)

function y=f(x)
    y = exp(sin(x))
endfunction

for i=1:n+1
    yw(i) = f(xw(i))
end

function y=g_fun(j, n, xw)
    s=0
    for i=1:n+1
        s = s + xw(i)^j
    end
    y=s
endfunction


function y=p_fun(j, n, xw, yw)
    s=0
    for i=1:n+1
        s = s + yw(i) * xw(i)^j
    end
    y=s
endfunction

if m>=0 && m<=3 then
    for j=1:2*m+1
        g(j) = g_fun(j-1, n, xw)
    end
    
    for j=0:m
        for i=1:lp
            rt(i) = f(t(i))*(t(i)^j)
        end
        r(j+1) = inttrap(t,rt)
    end
end
 
 
select m
case 0
    a0 = p(1)/g(1)
    F = a0
case 1
    l0 = -g(3)*p(1) + g(2)*p(2)
    l1 = g(2)*p(1) - g(1)*p(2)
    m = g(2)^2 - g(1)*g(3)
    
    a0 = l0/m
    a1 = l1/m
    F = a0 + a1*punkty
case 2
    m = g(3)^3 + g(1)*g(4)^2 + g(2)^2 * g(5) - g(3)*(2*g(2)*g(4) + g(1)*g(5))
    
    l0 = g(4)^2*p(1) - g(3)*g(5)*p(1) + g(2)*g(5)*p(2) + g(3)^2*p(3) - g(4)*(g(3)*p(2) + g(2)*p(3))
    l1 = g(2)*g(5)*p(1) + g(3)^2*p(2) - g(3)*(g(4)*p(1) + g(2)*p(3)) + g(1)*(-g(5)*p(2) + g(4)*p(3))
    l2 = g(3)^2*p(1) - g(2)*g(4)*p(1) + g(1)*g(4)*p(2) + g(2)^2*p(3) - g(3)*(g(2)*p(2) + g(1)*p(3))
    
    a0 = l0/m
    a1 = l1/m
    a2 = l2/m
    F = a0 + a1*punkty +a2*punkty^2
else
    disp("Nieprawidłowe m")
end

plot(punkty, F)
