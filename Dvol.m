function [ Dvol] = DvoL( x1i,t1i,c11,c22,h)
%Function to find optimal value of coefficient of volume and surface diffusion
  
a=length(t1i);
z=0;
l=0;
e=0;
for i=1:a

    z=z+x1i(i).^2*t1i(i).^2;
    
    l=l+t1i(i)^2;
    
    e=e+t1i(i);
    
end
g=2*(1/(1-c11)+1/c22)*(c22-c11); 
Dvol=1e-6*(z/(l*e*g));

%display(Dopt);

end