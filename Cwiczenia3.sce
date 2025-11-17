clear

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
tab = zeros(n+1, n+1)
tab(:,1) = yw // 6.c

if h ~= -1 then
    // tablica ilorazów różnicowych
    for k = 1:n
        for i = 1:n+1-k
            roznica_funkcji = tab(i+1, k) - tab(i, k)
            roznica_x = xw(i+k) - xw(i)
            tab(i,k+1) = roznica_funkcji / roznica_x
        end
    end 
    // wartość Wn
    s = f(xw(1))
    for i=2:n+1
        s = s + (tab(1,i)) * omega(xbar, i-1, xw)
    end
    Wn = s
else
    // tablica różnic progresywnych
    for k = 1:n
        for i = 1:n+1-k
            tab(i,k+1) = tab(i+1, k) - tab(i, k)
        end
    end 
    // wartość Wn
    s = f(xw(1))
    for i=2:n+1
        licznik = tab(1,i) * omega(xbar, i-1, xw)
        mianownik = factorial(i-1) * h^(i-1)
        s = s + licznik / mianownik 
    end
    Wn = s
end
   
disp(tab)
disp("Wn = ", Wn)









