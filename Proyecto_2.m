%REALIZADO POR:
%Alberto navarrete
%Jemuel Flores
%Grecia Pacheco
%Oscar Reyes
%MAIN
clear;
close all; clc;
N=20;
minX=-2;
maxX=2;
minY=-2;
maxY=2;
x=linspace(minX,maxX,N);
y=linspace(minY,maxY,N);
[xG,yG]=meshgrid(x,y);
%posicion particula negativa
xCn=0.5; yCn=0; a=0.2;l=2;
xCp=-0.5; yCp=0; 
%campo el[ectrico
Qn=-20;
Qp=20;
eps0=8.854e-12;
kC=1/(4*pi*eps0);
Rx=xG-xCn;
Ry=yG-yCn;
R=sqrt(Rx.^2 +Ry.^2).^3;
Ex=kC.*Qn.*Rx./R;
Ey=kC.*Qn.*Ry./R;

Rx=xG-xCp;
Ry=yG-yCp;
R=sqrt(Rx.^2 +Ry.^2).^3;
Ex=Ex + kC .* Qp .* Rx ./ R;
Ey=Ey + kC .* Qp .* Ry ./R;
E= sqrt(Ex.^2 +Ey.^2);

u=Ex./E;
v=Ey./E;

%dibujar
figure();
h=quiver(xG,yG,u,v);
set(h,'color',[0 1 0]);
axis([-1.5 1.5 -1.5 1.5]);
axis equal;
box on;
h=rectangle('Position',[xCn,yCn-(l/2),a,l]);
set(h,'Facecolor',[0 0 1],'Edgecolor',[0,0,1]);
h=rectangle('Position',[xCp,yCp-(l/2),a,l]);
set(h,'Facecolor',[1 0 0],'Edgecolor',[1,0,0]);





