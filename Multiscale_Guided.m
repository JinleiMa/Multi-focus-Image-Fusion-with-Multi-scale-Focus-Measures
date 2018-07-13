% function [map1_guided,map2_guided,map3_guided,map4_guided] = ...
%     Multiscale_Guided(I1, map1, map2, map3, r1, eps1, r2, eps2,r3, eps3, map4, r4, eps4)

function [map1_guided,map2_guided,map3_guided] = Multiscale_Guided(I1, map1, map2, map3, r1, eps1, r2, eps2,r3, eps3)

if ~exist('s1','var')
    r1 = 5;
end

if ~exist('s2','var')
    eps1 = 10^(-2);
end

if ~exist('s3','var')
    r2 = 14;
end

if ~exist('T1','var')
    eps2 = 10^(-3);
end

if ~exist('T2','var')
    r3 = 21;
end

if ~exist('T3','var')
    eps3 = 10^(-4);
end

map1_guided = guidedfilter(I1, map1, r1, eps1);

map2_guided = guidedfilter(I1, map2, r2, eps2);

map3_guided = guidedfilter(I1, map3, r3, eps3);



% if exist('r4','var')
%     map4_guided = guidedfilter(I1, map4, r4, eps4);
% end

end