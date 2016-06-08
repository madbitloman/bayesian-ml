function [pogr] = pogR(xi,ti,Dopt,b,s)
% Function to calculate the uncertainity 

pogr=0;

for i=1:length(ti)
    pogr=pogr+2*s^2*((xi(i)*ti(i).^2*b)/sqrt(Dopt*b*ti(i))).^(-1/2);
end

end

