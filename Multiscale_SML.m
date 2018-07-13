% function [map1,map2,map3,map4] = Multiscale_SML(I1,I2,s1,s2,s3,T1,T2,T3,s4,T4)
function [map1,map2,map3] = Multiscale_SML(I1,I2,s1,s2,s3,T1,T2,T3)

if ~exist('s1','var')
    s1 = 5;
end

if ~exist('s2','var')
    s2 = 11;
end

if ~exist('s3','var')
    s3 = 17;
end

if ~exist('T1','var')
    T1 = 0;
end

if ~exist('T2','var')
    T2 = 0;
end

if ~exist('T3','var')
    T3 = 0;
end

SML1 = SML(I1);
SML2 = SML(I2);

SML1_s1 = SML1;
SML1_s1(SML1 < T1) = 0;
measure1_s1 = imfilter(SML1_s1, ones(2 * s1 + 1), 'replicate');
SML2_s1 = SML2;
SML2_s1(SML2 < T1) = 0;
measure2_s1 = imfilter(SML2_s1, ones(2 * s1 + 1), 'replicate');
map1 = double(measure1_s1 > measure2_s1);

SML1_s2 = SML1;
SML1_s2(SML1 < T2) = 0;
measure1_s2 = imfilter(SML1_s2, ones(2 * s2 + 1), 'replicate');
SML2_s2 = SML2;
SML2_s2(SML2 < T2) = 0;
measure2_s2 = imfilter(SML2_s2, ones(2 * s2 + 1), 'replicate');
map2 = double(measure1_s2 > measure2_s2);


SML1_s3 = SML1;
SML1_s3(SML1 < T3) = 0;
measure1_s3 = imfilter(SML1_s3, ones(2 * s3 + 1), 'replicate');
SML2_s3 = SML2;
SML2_s3(SML2 < T3) = 0;
measure2_s3 = imfilter(SML2_s3, ones(2 * s3 + 1), 'replicate');
map3 = double(measure1_s3 > measure2_s3);


end