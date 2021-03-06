% This is a programm to calculate interdiffusion coefficients for thin-film 
% and bulk materials. You can input your values of concentration on a
% borders and width of the phase layer to obtain required coefficients.
% I have tested it on known compound - Ag-Sn.
% 
% Oleksandr Kazakov/ UAlbany Physics Department date created 9/12/2011

% input your data in that file
load('data.mat'); 

% Normalization constants
% for Interdiffusion:
b=(c1/c2-1)*c2/(c1*h); 
% for Volume Diffusion
g=2*(1/(1-c11)+1/c22)*(c22-c11);

% Optimal value of Diffusion Coefficient
[Dopt] = DopT(xi,ti,c1,c2,h); 
[pogr] = pogR(xi,ti,Dopt,b,s);
[Dvol] = DvoL(x1i,t1i,c11,c22,h);
[pogrv] = pogrV(x1i,t1i,Dvol,g,s);

display(['Probable value of interdiffusion D = ' num2str(Dopt) ' +- ' num2str(pogr)]);
display(['Probable value of volume D = ' num2str(Dvol) ' +- ' num2str(pogrv)]);

M=0:1:100;
loggg=zeros(1,length(M));

for u=1:length(M) 
    loggg(u)=logP(xi,ti,M(u),s); 
end
figure;
plot(M,loggg); % Logposterior probability

% Defining minimum of LogP function
c = fminsearch(@(M)logP(xi,ti,M,s),0); 

% Correction 1e-6sm is due to the micron scale 
Dprob=(c/b)*1e-6; 

display(Dprob);

% Volume Diffusion Coefficient
K=0:1:100;loggg=zeros(1,length(K));
for u=1:length(K) 
    loggg(u)=logP(x1i,t1i,K(u),s); 
end
% - in cycle I am adding a values of R; by guesing its range
figure;
plot(K,loggg); % Logposterior probability
prob = fminsearch(@(K)logvP(x1i,t1i,K,s),0);

Dvol=(prob/g)*1e-6;
%Display(Dvol);


figure; 

% Now we plot actual vs fitted results
t = 0:0.5:16;
x = sqrt(b*(Dopt/1e-9)*t);
x1 = sqrt(b*((Dopt+pogr)/1e-9)*t);
plot(t,x);
x2 = sqrt(b*((Dopt-pogr)/1e-9)*t);
plot(t,x,t,x1,'r',t,x2,'r');
xlabel('t, hours')
ylabel('x^2, 10^(-9),m')
title('Plot of the phase grows kinetics. Front layer width over the time. Surface','FontSize',12)

figure; 
%volume
t0 = 0:0.5:16;
x0 = sqrt(g*(Dvol/1e-7)*t0);
x11 = sqrt(g*((Dvol+pogrv)/1e-7)*t0);
plot(t0,x);
x22 = sqrt(g*((Dvol-pogrv)/1e-7)*t);
plot(t0,x0,t0,x11,'r',t0,x22,'r');
xlabel('t, hours')
ylabel('x^2, 10^(-7),m')
title('Plot of the phase grows kinetics. Front layer width over the time. Volume','FontSize',12)





