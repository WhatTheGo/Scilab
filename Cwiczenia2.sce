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
lsup = 200

function y=f(x)
    y = sin(x)
endfunction

yw = f(xw)

function y=fp(x)
    y = sin(x)
endfunction


function y=omega(x, n, X)
    y=x-X(1)
    for i=1:n
        y=y*(x-X(i+1))
    end
endfunction


function y=phi(j,x,xw,n)
    for i=0:(j-1)
        lw(i+1)=x-xw(i+1) //licznik
    end
    lw(j+1)=1
    for i=(j+1):(n)
        lw(i+1)=x-xw(i+1) 
    end
    
    for i=0:(j-1)
        mw(i+1)=xw(j+1)-xw(i+1) //mianownik
    end
    mw(j+1)=1
    for i=(j+1):n
        mw(i+1)=xw(j+1)-xw(i+1)
    end
    
    y=prod(lw)/prod(mw)
    
endfunction

T=linspace(a,b,lsup)
for i=1:lsup
    MW(i)=abs(fp(T(i)))
end
M=max(MW)

err=M*abs(omega(_x,n,xw))/factorial(n+1)

for i=0:n
    Wn(i+1) = yw(i+1)*phi(i, _x, xw, n)
end

disp("err = ", err)
disp("Wn = ", sum(Wn))

X = linspace(a,b,lsup)
for i=1:lsup
    F(i)=f(X(i))
    W(i)=omega(X(i),n,xw)
end

plot(X,F)
plot(X,W,"r")
plot(xw,yw,".k")





















