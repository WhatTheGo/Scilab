clear;
clc;

A = [2.5410 2.1120
     1.8720 1.5560];
     
B = [1.0000 2.0000
     1.0000 1.0000];
     
E = [0.0010 0.0010
    -0.0010 -0.0020];
    
b = [4.6530
     3.4280];

M = B

function y = wz2(C)
    y = C(1,1) * C(2,2) - C(2,1) * C(1,2)
endfunction

function y = msum(M1, M2)
    y = [M1(1,1) + M2(1,1), M1(1,2) + M2(1, 2)
         M1(2,1) + M2(2,1), M1(2,2) + M2(2,2)];
endfunction

function Y = Cmk(M, Mb, k) 
    Y=M;
    Y(:,k) = Mb;
endfunction

ME = msum(M, E);
detME = wz2(ME);

if detME<>0 then
    x(1) = wz2(Cmk(ME,b,1))/detME;
    x(2) = wz2(Cmk(ME,b,2))/detME;
    disp(x,"x=");
else
    disp("Wyznacznik głowny zerowy - brak rozwiązań układu");
end


