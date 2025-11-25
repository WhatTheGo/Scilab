clc
clear

a = 0.5
b = 2
r = 4
n = 50
h = 0.001

function y=f(x)
    y = (x^2 - 3) * sin(x)
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
    end
    y = 0
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
    end
    y = 0
endfunction


kodWyjscia = -1
wi = 1


while wi <= n
    if warunekPolowienia(a, b) then // sprawdz warunek metody połowienia
        if warunekFalsi(a, b, h) then // sprawdz warunek metody falsi
            //metoda falsi
            while wi <= n 
                if err < czyPrzyblizenie then
                    kodWyjscia = 2
                    brak
                end
                
            end
            
        else // metoda połowienia 
            xbar = (a + b) / 2
            if warunekPolowienia(a, xbar) then
                b = xbar
            else a = xbar
            end
            // TUTAJ!

        end
        
    else 
        kodWyjscia = 3 // żaden warunek nie spełniony
        break
    end
    wi = wi + 1 // czy to nie powinno być wyżej tam gdzie "TUTAJ!" i dodać pętle wtedy???
end


if wi == n then
    kodWyjscia = 1
end

if kodWyjscia == 1 then
    disp("kod wyjścia 1 -> przekroczono liczbe iteracji")
    
elseif kodWyjscia == 2 then
    disp("kod wyjscia 2 -> udało się przybliżyć funkcje liniową")
    
elseif kodWyjscia == 3 then
    disp("kod wyjscia 3 -> nie spełniono żadnego warunku")
    
else disp("kod wyjscia -1")
end
