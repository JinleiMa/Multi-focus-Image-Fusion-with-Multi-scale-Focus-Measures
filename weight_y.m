function [y1,y2,y3] = weight_y(map1_guided,map2_guided,map3_guided) % I1,I2范围0到1

%% 直接设阈值求解
map1_guided(map1_guided<0) = 0;
y1 = zeros(size(map1_guided));
y1(map1_guided>=0.2 & map1_guided<=0.8) = 0;
y1(map1_guided<0.2) = 1 - map1_guided(map1_guided<0.2);
y1(map1_guided>0.8) = map1_guided(map1_guided>0.8);
y1 = y1(:) * 1;

map2_guided(map2_guided<0) = 0;
y2 = zeros(size(map2_guided));
y2(map2_guided>=0.2 & map2_guided<=0.8) = 0;
y2(map2_guided<0.2) = 1 - map2_guided(map2_guided<0.2);
y2(map2_guided>0.8) = map2_guided(map2_guided>0.8);
y2 = y2(:) * 1;

map3_guided(map3_guided<0) = 0;
y3 = zeros(size(map3_guided));
y3(map3_guided>=0.2 & map3_guided<=0.8) = 0;
y3(map3_guided<0.2) = 1 - map3_guided(map3_guided<0.2);
y3(map3_guided>0.8) = map3_guided(map3_guided>0.8);
y3 = y3(:) * 1;


% %% 自定义范围求解
% percent1 = 0.8;
% percent2 = 0.8;
% percent3 = 0.8;
% 
% %% map1_guided概率
% number1 = imhist(map1_guided);
% 
% [~,bb] = sort(number1);
% number1(bb(end-1:end)) = 0;
% side_number = sum(number1) * (1-percent1) / 2;
% cc = cumsum(number1) - side_number;
% cc(cc<0) = max(cc);
% low_bound1 = find(cc == min(cc));
% low_bound1 = low_bound1/256;
% 
% dd = number1(length(number1):-1:1);
% ee = cumsum(dd) - side_number;
% ee(ee<0) = max(ee);
% up_bound1 = 257 - find(ee == min(ee));
% up_bound1 = up_bound1/256;
% 
% map1_guided(map1_guided<0) = 0;
% y1 = zeros(size(map1_guided));
% y1(map1_guided >= low_bound1 & map1_guided <= up_bound1) = 0;
% y1(map1_guided < low_bound1) = 1 - map1_guided(map1_guided < low_bound1);
% y1(map1_guided > up_bound1) = map1_guided(map1_guided > up_bound1);
% y1 = y1(:) * 1;
% 
% %% map2_guided概率
% number2 = imhist(map2_guided);
% 
% [~,bb] = sort(number2);
% number2(bb(end-1:end)) = 0;
% side_number = sum(number2) * (1-percent2) / 2;
% cc = cumsum(number2) - side_number;
% cc(cc<0) = max(cc);
% low_bound2 = find(cc == min(cc));
% low_bound2 = low_bound2/256;
% 
% dd = number2(length(number2):-1:1);
% ee = cumsum(dd) - side_number;
% ee(ee<0) = max(ee);
% up_bound2 = 257 - find(ee == min(ee));
% up_bound2 = up_bound2/256;
% 
% map2_guided(map2_guided<0) = 0;
% y2 = zeros(size(map2_guided));
% y2(map2_guided >= low_bound2 & map2_guided <= up_bound2) = 0;
% y2(map2_guided < low_bound2) = 1 - map2_guided(map2_guided < low_bound2);
% y2(map2_guided > up_bound2) = map2_guided(map2_guided > up_bound2);
% y2 = y2(:) * 1;
% 
% %% map3_guided概率
% number3 = imhist(map3_guided);
% 
% [~,bb] = sort(number3);
% number3(bb(end-1:end)) = 0;
% side_number = sum(number3) * (1-percent3) / 2;
% cc = cumsum(number3) - side_number;
% cc(cc<0) = max(cc);
% low_bound3 = find(cc == min(cc));
% low_bound3 = low_bound3/256;
% 
% dd = number3(length(number3):-1:1);
% ee = cumsum(dd) - side_number;
% ee(ee<0) = max(ee);
% up_bound3 = 257 - find(ee == min(ee));
% up_bound3 = up_bound3/256;
% 
% map3_guided(map3_guided<0) = 0;
% y3 = zeros(size(map3_guided));
% y3(map3_guided >= low_bound3 & map3_guided <= up_bound3) = 0;
% y3(map3_guided < low_bound3) = 1 - map3_guided(map3_guided < low_bound3);
% y3(map3_guided > up_bound3) = map3_guided(map3_guided > up_bound3);
% y3 = y3(:) * 1;




% % %% map4_guided概率
% % if exist('map4_guided','var')
% % %     percent = 0.6;%0.05
% %     number4 = imhist(map4_guided);
% % 
% %     [~,bb] = sort(number4);
% %     number4(bb(end-1:end)) = 0;
% %     side_number = sum(number4) * (1-percent) / 2;
% %     cc = cumsum(number4) - side_number;
% %     cc(cc<0) = max(cc);
% %     low_bound4 = find(cc == min(cc));
% %     low_bound4 = low_bound4/256;
% % 
% %     dd = number4(length(number4):-1:1);
% %     ee = cumsum(dd) - side_number;
% %     ee(ee<0) = max(ee);
% %     up_bound4 = 257 - find(ee == min(ee));
% %     up_bound4 = up_bound4/256;
% % 
% %     map4_guided(map4_guided<0) = 0;
% %     y4 = zeros(size(map4_guided));
% %     y4(map4_guided >= low_bound4 & map4_guided <= up_bound4) = 0;
% %     y4(map4_guided < low_bound4) = 1 - map3_guided(map4_guided < low_bound4);
% %     y4(map4_guided > up_bound4) = map3_guided(map4_guided > up_bound4);
% %     y4 = y4(:) * 1;
% % end









