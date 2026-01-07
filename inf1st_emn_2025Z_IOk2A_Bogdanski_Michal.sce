// Bogdański Michał, Informatyka ogólna, kolokwium nr 2 - wersja A
clc
clear

r = 4
a = -1
b = 1
h = 0.001

disp("r = ", r)
disp("a = ", a)
disp("b = ", b)

function y=f(x)
    y = sin(x) + (x+1)^2
endfunction


function y=fp(x, h)
    y = (f(x+h) - f(x)) / h
endfunction


function y=fpp(x, h)
    y = (fp(x+h, h) - fp(x, h)) / h
endfunction


function Y=start(a, b, h)
    if fp(a, h)*fpp(a, h) < 0 then
        X(1) = b
        X(2) = a
    else
        X(1) = a
        X(2) = b
    end
    Y = X
endfunction


function y=zalozenia(a, b, h)
    zal1 = f(a) * f(b) < 0
    zal2 = fp(a, h) * fp(b, h) > 0
    zal3 = fpp(a, h) * fpp(b, h) > 0
    
    if zal1 && zal2 && zal3 then
        y = 1
        disp("Założenia spełnione")
    else
        y = 0
        disp("Założenia nie zostały spełnione, kończę program")
        return
    end
endfunction


function y=new_sol(x_prev, x_now) //x_now x(n-1); x_prev = x(n-2)
    l = f(x_now) * (x_now - x_prev)
    m = f(x_now) - f(x_prev)
    y = x_now - l/m
endfunction


function y=dokladnosc(X, i)
    l = abs( X(i) - X(i-1) ) * abs(f(X(i)))
    m = abs( f(X(i)) - f(X(i-1)) )
    y = l/m
endfunction


zalozenia(a, b, h)

X = start(a, b, h)
i = 2
disp("X = ", X)


while i < 20
    i = i + 1
    X(i) = new_sol(X(i-1), X(i-2))
    if dokladnosc(X, i) < 10^(-r) then
        break
    end
end

disp("Rozwiązano")
l = 2
while l <= i
    disp("numer = ", l - 1)
    disp("x = ", X(l))
    disp("f(x) = ", f(X(l)))
    l = l + 1
end



