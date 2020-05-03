%REALIZADO POR>
%Alberto Navarrete A01442954
%Jemuel Flores A01367182
%Grecia Pacheco A01366730
%Oscar Reyes A01369421



clc;
clear all;


dist1=input("Tamaño de la placa 1:");
dist2=input("Tamaño de la placa 2:");
cc=dist1;
dP=1;
dN=dist2/dist1;
mp=input("Magnitud de la carga de las placas");
n=mp/cc;



d=input("Distancia entre placas: ");


cargas=[];
xCargas=[];
for i=1:2*cc
    if i<=cc
        cargas=[cargas n];
        xCargas=[xCargas 0];
    else
        cargas=[cargas -n];
        xCargas=[xCargas d]; 
    end
end

if mod(cc,2)==0
    yop=(cc/2)*(-dP)+(.5*dP);
    yon=(cc/2)*(-dN)+(.5*dN);
else
    yop=((cc-1)/2)*(-dP);
    yon=((cc-1)/2)*(-dN);
end
yCargas=1:2*cc;
yCargas(1)=yop;
yCargas(cc+1)=yon;

for i=2:cc*2
    if i<=cc
        yCargas(i)=yCargas(i-1)+dP;
    elseif i>cc+1
        yCargas(i)=yCargas(i-1)+dN;
    end
end

Npuntos=80; %n�mero de puntos en la malla

Eps=8.854e-12; %Escribir el valor de epsilon
k=1/(4*pi*Eps);

dV=max(dN,dP);

%Dimensiones de la gr�fica
maxX=2*d+2;
maxY=(cc)*dV+2;
minX=-1.5*d;
minY=-(cc)*dV+2;

%Crear dos matrices vac�as para campo el�ctrico en x y y
CampoElectricoX=zeros(Npuntos);
CampoElectricoY=zeros(Npuntos);

%Creamos 2 vectores
X=linspace(minX,maxX,Npuntos);
Y=linspace(minY,maxY,Npuntos);

%Crear la malla de puntos
[XpuntosMalla,YpuntosMalla]=meshgrid(X,Y);


%Creamos un for que recorra las cargas para poder obtener el c�lculo de campo el�ctrico

for i=1:2*cc
	DistanciaX = XpuntosMalla - xCargas(i);
	DistanciaY = YpuntosMalla - yCargas(i);
	R = sqrt( DistanciaX .^2 + DistanciaY .^2);
	R3 = R.^3;
	CampoElectricoX = CampoElectricoX + k*cargas(i) .* DistanciaX ./ R3;
	CampoElectricoY = CampoElectricoY + k*cargas(i) .* DistanciaY ./ R3;
end

CampoE_Total = sqrt(CampoElectricoX .^2 + CampoElectricoY .^2);
%disp(CampoE_Total)


%Graficar
quiver(XpuntosMalla,YpuntosMalla,CampoElectricoX ./ CampoE_Total,CampoElectricoY ./ CampoE_Total)
hold on

for i=1:2*cc
   pos=[xCargas(i)-.5 yCargas(i)-.5 1 1];
   if i<=cc
        rectangle('Position',pos,'Curvature',[1 1],'FaceColor','r','EdgeColor','r')
   else 
        rectangle('Position',pos,'Curvature',[1 1],'FaceColor','b','EdgeColor','b')
   end
end

axis([minX maxX minY maxY])
xlabel('x[m]')
ylabel('y[m]')
axis equal
hold off
puntox=input("¿En que punto 'x' desea consultar los componentes?...");
puntoy=input("¿En que punto 'y' desea consultar los componentes?...");
puntoxF=ceil((puntox+abs(minX)+1)*Npuntos/(maxX-minX));
puntoyF=ceil((puntoy+abs(minY)+1)*Npuntos/(maxY-minY));

textox=string(abs(CampoElectricoX(puntoxF)));
textoy=string(abs(CampoElectricoY(puntoyF)));
textog="Los componentes (x,y) en el punto ("+puntox+","+puntoy+") son: ("+textox+" N/C,"+textoy+" N/C)";
disp(textog);

