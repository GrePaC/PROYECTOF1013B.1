%REALIZADO POR>
%Alberto Navarrete A01442954
%Jemuel Flores A01367182
%Grecia Pacheco A01366730
%Oscar Reyes A01369421

clear clc;
[x,y]=meshgrid(2:.5:10,-10:.5:10);
ke = 8.9875517873681764e9;
u=(ke*x)/16;
v=(x);
%Dibujar campo electrico
quiver(x,y,u,v);
hold on;
%Dibujar placas
fill([4,4,2,2,4],[-10,10,10,-10,-10],'red');
fill([12,12,10,10,12],[-10,10,10,-10,-10],'blue');
hold on;
%Dibujar cargas
plot([2.5,3.5],[7.5,7.5], 'black');
hold on;
plot([3,3],[6,9], 'black');
hold on;
plot([2.5,3.5],[2.5,2.5], 'black');
hold on;
plot([3,3],[1,4], 'black');
hold on;
plot([2.5,3.5],[-7.5,-7.5], 'black');
hold on;
plot([3,3],[-6,-9], 'black');
hold on;
plot([2.5,3.5],[-2.5,-2.5], 'black');
hold on;
plot([3,3],[-1,-4], 'black');
hold on;
plot([10.5,11.5],[7.5,7.5], 'black');
hold on;
plot([10.5,11.5],[2.5,2.5], 'black');
hold on;
plot([10.5,11.5],[-7.5,-7.5], 'black');
hold on;
plot([10.5,11.5],[-2.5,-2.5], 'black');
hold on;



