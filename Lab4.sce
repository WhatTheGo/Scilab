clc
clear

a = 0.5
b = -2
r = 4
n = 50
h = 0.001
wi = 0

function y=f(x)
    y = (abs(x^2) - 3)*sin(abs(x))
endfunction

function y=fp(x, h)
    licznik = f(x+h) - f(x)
    y = licznik / h
endfunction

function y=fpp(x, h)
    licznik = fp(x+h, h) - fp(x, h)
    y = licznik / h
endfunction

function y=warunekPolowienia(a, b)
    warunek = f(a) * f(b)
    if warunek < 0 then
        y = 1
    else
        y = 0
    end
endfunction

function y=warunekFalsi(a, b, h)
    fp1 = fp(a, h)
    fp2 = fp(b, h)
    fpp1 = fpp(a, h)
    fpp2 = fpp(b, h)
    
    warunek1 = fp1 * fp2
    warunek2 = fpp1 * fpp2
    
    if warunek1 > 0 && warunek2 > 0 then
        y = 1
    else
        y = 0
    end
endfunction


if warunekPolowienia(a, b) then
    while wi < n 
        wi = wi + 1
        if warunekFalsi(a, b, h) then
            //metoda falsi
            if fp(a)*fpp(a) < 0 then
                c = a
                x1 = b
            else
                c = b
                x1 = a
            end
            x_prev = x1
            while wi < n
                mian = f(x_prev) * (c - x_prev) // xw(i-1) = x_prev
                licz = f(c) - mian
                x_new = x_prev - (mian / licz)
                if abs(x_new - x_prev) < 10^(-r) then
                    xbar = x_new
                    disp("kod wyjscia 2 -> udało się przybliżyć funkcje liniową")
                    disp("xbar = ", xbar)
                    return
                end
                wi = wi + 1
                x_prev = x_new
                
            end
            
        else // metoda połowienia 
            xbar = (a + b) / 2
            if warunekPolowienia(a, xbar) then
                b = xbar
            else a = xbar
            end
        end
    end

else 
    disp("kod wyjscia 3 -> nie spełniono żadnego warunku")
end


if wi == n then
    disp("kod wyjścia 1 -> przekroczono liczbe iteracji")
end

