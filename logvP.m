function [ Logvp ] = logvP(x1i,t1i,K,s)
%Calc of logP
%   '-' before logP to find the minimum
w=0;
p=length(t1i);

    for i=1:p;
    
        w = w+(x1i(i)-sqrt(t1i(i)*K)).^2;

    end
    
        Logvp=-((log((1/(2*pi*s^2))^(-p/2))-(1/(2*s^2))*w));
    
        
end

