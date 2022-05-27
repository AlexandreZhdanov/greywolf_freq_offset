function [M, D1] = costF(w, C, hs, mod)
%COSTF Summary of this function goes here
%   Detailed explanation goes here
if nargin<2
    global Cdata
    C=Cdata;
end
if nargin<3
    hs=32;
end
if nargin<4
    mod=4;
end
t=[1:max(size(C))];
C1=exp(-j*w*t).*C;
D1=hist(angle(C1),hs);
E1=sort(D1);
M=-(sum(E1(hs-mod:hs))-sum(E1(1:mod)));
end

