function [ pogrv] = pogrV( x1i,t1i,Dvol,g,s)
% Function to calculate volume diffusion 
%   

d=0;

for i=1:length(t1i);
    
    d=d+2*s^2*((x1i(i)*t1i(i).^2*g)/sqrt(Dvol*g*t1i(i))).^(-1/2);

end

pogrv=d*10e-7;

end

