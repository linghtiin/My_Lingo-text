%读取图像
Im = imread('test1.tif');

%%
%图像直方图均衡化
Im_eq = equl_hist(Im);

figure(2);
subplot(221);
%%
% 
% $$e^{\pi i} + 1 = 0$$
% 
imshow(Im);title('源图像');
subplot(222);
imshow(uint8(Im_eq));title('处理后图像');
subplot(223);
imhist(uint8(Im));title('源图像直方图');
% plot(img_hist(f3));
subplot(224);
imhist(uint8(Im_eq));title('处理后图像直方图');
% plot(img_hist(f3t));
saveas(2,'fig_2.pdf');

%%
%图像加噪：
Im_n1 = imnoise(Im,'salt & pepper',0.02);
Im_n2 = imnoise(Im,'gaussian',0.02);
%均值滤波
% temp1 = [1,1,1;1,1,1;1,1,1];
% Im_in1_mean = img_fliter(double(Im_n1),temp1,'mean');
temp2 = ones(5,5)/25;
Im_in1_mean2 = imfilter(Im_n1,temp2);
Im_in2_mean2 = imfilter(Im_n2,temp2);
%中值滤波
%Im_in1_med1 = medfilt1(double(Im_n1));
Im_in1_med2 = medfilt2(double(Im_n1));
Im_in2_med2 = medfilt2(double(Im_n2));


figure(3);
subplot(241);
imshow(Im_n1);title('椒盐噪声图像');
subplot(242);
imshow(uint8(Im_in1_mean2));title('椒盐噪声图像均值滤波');
subplot(243);
imshow(uint8(Im_in1_med2));title('椒盐噪声图像中值滤波');
subplot(244);
imshow(uint8(imguidedfilter(Im_n1)));title('椒盐噪声图像边界保持滤波');
subplot(245);
imshow(Im_n2);title('高斯噪声图像');
subplot(246);
imshow(uint8(Im_in2_mean2));title('高斯噪声图像均值滤波');
subplot(247);
imshow(uint8(Im_in2_med2));title('高斯噪声图像中值滤波');
subplot(248);
imshow(uint8(imguidedfilter(Im_n2)));title('高斯噪声图像边界保持滤波');
saveas(3,'fig_3.pdf');


