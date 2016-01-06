function [ Logp ] = logP(xi,ti,M,s)
%Calc of logP
%   '-' before logP to find the minimum
w=0;
p=length(ti);

for i=1:p;
   w = w+(xi(i)-sqrt(ti(i)*M)).^2;

end
    
Logp=-((log((1/(2*pi*s^2))^(-p/2))-(1/(2*s^2))*w));
            
end

