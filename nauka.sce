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
    y=1
    for i=1:n+1
        y=y*(x - X(i))
    end
endfunction


function y=phi(x,xw,j)
    l = x-xw
    m = xw(j+1)-xw
    
    l(j+1)=1
    m(j+1)=1
    
    y=prod(l)/prod(m)
    disp(y)
endfunction

T=linspace(a,b,lsup)
for i=1:lsup
    MW(i)=abs(fp(T(i)))
end
M=max(MW)

err=M*abs(omega(_x,n,xw))/factorial(n+1)

for i=0:n
    Wn(i+1) = yw(i+1)*phi(_x, xw, i)
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





















