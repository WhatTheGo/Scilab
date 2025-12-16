clc
clear

n = 8
xw = [-1.1; -0.83; -0.57; -0.28; -0.02; 0.16; 0.47; 0.95; 1.23]
m = 0

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
    
    for j=1:m+1
        p(j) = p_fun(j-1, n, xw, yw)
    end
end
 

select m
case 0
    a0 = pw(1)/gw(1)
case 1
    l0 = -gw(3)*pw(1) + gw(2)*pw(2)
    l1 = gw(2)*pw(1) - gw(1)pw(2)
    m = gw(2)^2 - gw(1)*gw(3)
    
    a0 = l1/m1
    a1 = l1/m
case 2
    m = gw(3)^3 + gw(1)*gw(4)^2 + gw(2)^2 * gw(5) - gw(3)*(2*gw(2)*gw(4) + gw(1)*gw(5))
    
    //l0 = gw()pw()
else
    disp("Nieprawidłowe m")
end
