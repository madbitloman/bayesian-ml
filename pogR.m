function [ pogr] = pogR( xi,ti,Dopt,b,s)
% Function to Calculate the uncertainity 
%   

p=0;

for i=1:length(ti)
    
    p=p+2*s^2*((xi(i)*ti(i).^2*b)/sqrt(Dopt*b*ti(i))).^(-1/2);

end

pogr=p*10e-7;



end

