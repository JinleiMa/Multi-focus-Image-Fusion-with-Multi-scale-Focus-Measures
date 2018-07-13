function [weight,edges] = weight_w(I1,sigma)

[X,Y,~]=size(I1);

im1 = I1(:);

N=X*Y;

% %4-connected
% edges=[(1:N)',((1:N)+1)'];
% edges=[[edges(:,1);(1:N)'],[edges(:,2);(1:N)'+X]];
% excluded=find((edges(:,1)>N)|(edges(:,1)<1)|(edges(:,2)>N)|(edges(:,2)<1));
% edges([excluded;(X:X:((Y-1)*X))'],:)=[]; 

% 8-connected
edges=[[1:N]',[(1:N)+1]'];
edges=[[edges(:,1);[1:N]'],[edges(:,2);[1:N]'+X]];

border=1:N;
border1=find(mod(border,X)-1)';
border2=find(mod(border,X))';
edges=[edges;[border1,border1+X-1;border2,border2+X+1]];
    
excluded=find((edges(:,1)>N)|(edges(:,1)<1)|(edges(:,2)>N)|(edges(:,2)<1));
edges([excluded;[X:X:((Y-1)*X)]'],:)=[]; 

%weight
vals_i = im1(edges(:,1));
vals_j = im1(edges(:,2));
weight = ((vals_i-vals_j).^2)/sigma;
weight = exp(-weight); 










































