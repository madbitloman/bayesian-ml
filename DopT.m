function [Dopt] = DopT(xi,ti,c1,c2,h)
%Function to find optimal value of coefficient of volume and surface diffusion

z=0;
l=0;
e=0;

for i=1:length(ti)

    z=z+xi(i).^2*ti(i).^2;
    l=l+ti(i)^2;
    e=e+ti(i);

end

b=(c1/c2-1)*c2/(c1*h); 
Dopt=1e-6*(z/(l*e*b));

end

