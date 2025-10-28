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
lsup(100)

function y = fp(x)
    y = sin(x)
endfunction


for i=1:n+1
    yw(i) = fp(xw(i))
end


function y = f_n_plus_1()
    y = sin(x)
endfunction


function y=omega(x, n, X)
    y=1
    for i=0:n
        y=y*(x - X(i))
    end
endfunction


function y=phi(j,x,xw,n)
    for i=0:(j-1)
        lw(i+1)=x-xw(i+1)
    end
    
    lw(j+1)=1
    for i=0:(j-1)
        mw(i+1)=xw(j+1)-xw(i+1)
    end
    
    for i=(j+1):n
        mw(i+1)=xw(j+1)-xw(i+1)
    end
    mw(j+1)=1
    y=prod(lw)/prod(mw)
    
endfunction


function y=factorial(n)
    y=1
    for i=1:n
        y=y*i
    end
endfunction


T=linspace(a,b,lsup)'
for i=1:lsup
    MW(i)=abs(fp(T(i)))
end
M=max(MW)

err=M*abs(omega(_x,n,xw))/factorial(n+1)



X = linspace(a,b,lp)'
for i=1:lp
    F(i)=f(X(i))
    W(i)=Wn(X(i),n,xw,yw)
end
plot(X,F)
plot(X,W,"r")
plot(xw,yw,".k")





















