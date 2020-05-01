clear, clc;
%REALIZADO POR>
%Alberto navarrete
%Jemuel Flores
%Grecia Pacheco
%Oscar Reyes
%MAIN
x1=input("Escriba la posicion en x de la placa positiva");
y1=input("Escriba la posicion en y de la placa positiva");
x2=input("Escriba la posicion en x de la placa negativa");
y2=input("Escriba la posicion en y de la placa negativa");
l=input("Escriba el largo de las placas");
%Funciones

%Placas paralelas
if(x1==x2)
    xf=x1+l;
    rectangle('position',[x1 y1 l 0.5],'FaceColor',"r");
    rectangle('position',[x2 y2 l 0.5],'FaceColor',"b");
    hold on
    [x,y]=meshgrid(x1:.5:xf,y1:.5:y2);
    ke = 8.9875517873681764e9;
    u=(ke*y)/16;
    v=(x*0);
    %Dibujar campo electrico
    quiver(x,y,v,u);
    hold on;

end
if(x1~=x2)
   rectangle('position',[x1 y1 0.5 l],'FaceColor',"r");
    rectangle('position',[x2 y2 0.5 l],'FaceColor',"b");
    hold on
    [x,y]=meshgrid(x1:.5:x2,y1:.5:10);
    ke = 8.9875517873681764e9;
    u=(ke*x)/16;
    v=(x);
    %Dibujar campo electrico
    quiver(x,y,u,v);
    hold on;
  
    
end

