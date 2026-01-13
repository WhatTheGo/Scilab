clc
clear

N = 9
s = 4
F = [
    -1.12;
    -1.57;
    -0.73;
    -0.21;
     0.11;
     0.31;
     0.51;
    -1.73;
    -1.24
]
lsup = 50
s_max = floor((N - 1) / 2)

if s > s_max then
    disp("Niepoprawne s")
    return
end

for i=1:N
    X(i) = 2*%pi*(i-1)/N
    disp(i)
end

for j=0:s
    for i=1:N
        m = F(i)*cos(j)*X(i)
    end
    A(j+1) = 2/N * m
end

for j=1:s
    for i=1:N
        m = F(i)*sin(j)*X(i)
    end
    B(j+1) = 2/N * m
end


function y=Fs(x)
    s = A(1)/2
    
    for j=1:s
        s = s + A(j+1)*cos(j)*x + B(j+1)
    end
    
    y = s
endfunction

punkty = linspace(-20, 20, lsup)
for i=1:lsup
    FS(i) = Fs(punkty(i))
end




