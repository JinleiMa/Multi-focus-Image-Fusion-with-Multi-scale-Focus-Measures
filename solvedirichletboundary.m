function [x1,x2,x3,y1,y2,y3] = solvedirichletboundary(map1_guided,map2_guided,map3_guided,sigma,I1)

[X,Y,Z]=size(map1_guided);

N=X*Y;

[weight,edges] = weight_w(I1,sigma); 
[y1,y2,y3] = weight_y(map1_guided,map2_guided,map3_guided);

W = sparse([edges(:,1);edges(:,2)],[edges(:,2);edges(:,1)],[weight;weight],N,N);
y = sparse((1:N)',(1:N)',y1+y2+y3,N,N);
D = diag(sum(W)) + y;

L = D - W;

B1 = y1';
B2 = y2';

x1 = L\B1';
x2 = L\B2';

x1 = reshape(x1,[X,Y]);
x2 = reshape(x2,[X,Y]);
% x3 = reshape(x3,[X,Y]);
x3 = 1 - x1 -x2;




