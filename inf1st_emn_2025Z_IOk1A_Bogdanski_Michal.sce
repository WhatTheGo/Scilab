// Bogdański Michał informatyka ogólna Kolokwium nr 1 - wersja A

clc
clear

n=4
a=-1
b=1
xbar = 0.121
xw = [-1; -0.6; -0.2; 0.2; 0.6]
lsup = 100

disp("n = ", n)
disp("a = ", a)
disp("b = ", b)
disp("xbar = ", xbar)
disp("xw = ", xw)
disp("lsup = ", lsup)

function y=f(x)
    y = exp(x)
endfunction

yw = f(xw)
disp("yw = ", yw)

function y=fn(x) // funckja pochodnej f
    y = exp(x)
endfunction

function y=omega(n)
    y=1
    for i=1:n+1
        y = y * (xbar - xw(i))
    end
endfunction

function y=sup_est(lsup)
    lsup_w = linspace(a, b, lsup)
    pochodna_w = fn(lsup_w)
    y = max(pochodna_w)
endfunction

M = sup_est(lsup)
err = (M * abs(omega(n))) / factorial(n+1)
disp("err = ", err)


// tablica ilorazow roznicowych

tab(:,1) = yw

for k = 1:n
    for i = 1:n+1-k
        roznica_f = tab(i+1, k) - tab(i, k)
        roznica_xw = xw(i+k) - xw(i)
        tab(i, k+1) = roznica_f / roznica_xw
    end
end

disp("tab = ", tab)






















