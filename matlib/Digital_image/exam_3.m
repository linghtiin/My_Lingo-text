%¶ÁÈ¡Í¼Ïñ
Im = imread('test1.tif');
Im = double(Im);
Im_eq = equl_hist(Im);

%Í¼ÏñÈñ»¯+±ßÔµ¼ì²â
ps = {};
ps{1,1} =[-1,0,-1;0,4,0;-1,0,-1];
ps{3,1} =[1,0:0,-1];
ps{4,1} =[0,-1:1,0];
ps{2,1} = 'Robert';
ps{1,2} =fspecial('laplacian');
ps{2,2} = 'laplacian';
ps{1,3} =fspecial('prewitt');
ps{2,3} = 'prewitt';
ps{1,4} =fspecial('sobel');
ps{2,4} = 'sobel';

%Ê¹ÓÃ¾í»ýº¯Êý
figure(4);
for i = 1:4
    p = ps{1,i};
    if i == 1
        t = conv2(Im_eq,ps{3,1},'same');
        %t2 = conv2(Im_eq,ps{4,1},'same');
    elseif i == 2
        t = conv2(Im_eq,p,'same');
    else
        t1 = conv2(Im_eq,p,'same');
        t2 = conv2(Im_eq,p','same');
        t = t1 + t2;
    end
    Im_p = Im_eq - t;
    subplot(2,4,i+4);
    imshow(uint8(t));
    title([ps{2,i},'¼ì²â±ßÔµ'])
    subplot(2,4,i);
    imshow(uint8(Im_p));
    title([ps{2,i},'Èñ»¯'])
end
saveas(4,'fig_4.pdf');

%Ê¹ÓÃÍ¼ÏñÂË²¨
fig5 = figure(5);
for i = 1:4
    p = ps{1,i};
   if i == 1
        t = imfilter(Im_eq,ps{3,1},'symmetric','conv');
        %t2 = imfilter(Im_eq,ps{4,1},'symmetric','conv');
    elseif i == 2
        t = imfilter(Im_eq,p,'symmetric','conv');
    else
        t1 = imfilter(Im_eq,p,'symmetric','conv');
        t2 = imfilter(Im_eq,p','symmetric','conv');
        t = t1 + t2;
    end
    Im_p = Im_eq - t;
    subplot(2,4,i+4);
    imshow(uint8(t));
    title([ps{2,i},'¼ì²â±ßÔµ'])
    subplot(2,4,i);
    imshow(uint8(Im_p));
    title([ps{2,i},'Èñ»¯'])
end
saveas(5,'fig_5.pdf');

%edgeº¯ÊýÓ¦ÓÃ
eg_met = {'Sobel','Prewitt','Roberts','log','zerocross','Canny','approxcanny'};

figure(6);
for i = 1:8
    if i == 1
        t = 'Ô­Í¼';
        Im_e = uint8(Im);
    else
        m = eg_met{i-1};
        t = [m,'¼ì²â±ßÔµ'];
        Im_e = edge(uint8(Im),m);
    end
    subplot(2,4,i);
    imshow(Im_e);
    title(t);
end
saveas(6,'fig_6.pdf');

figure(7);
for i = 1:8
    if i == 1
        t = 'Ô­Í¼';
        Im_e = uint8(Im_eq);
    else
        m = eg_met{i-1};
        t = [m,'¼ì²â±ßÔµ'];
        Im_e = edge(uint8(Im_eq),m);
    end
    subplot(2,4,i);
    imshow(Im_e);
    title(t);
end
saveas(7,'fig_7.pdf');



