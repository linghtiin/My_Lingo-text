%��ȡͼ��
Im = imread('test1.tif');

%%
%ͼ��ֱ��ͼ���⻯
Im_eq = equl_hist(Im);

figure(2);
subplot(221);
%%
% 
% $$e^{\pi i} + 1 = 0$$
% 
imshow(Im);title('Դͼ��');
subplot(222);
imshow(uint8(Im_eq));title('�����ͼ��');
subplot(223);
imhist(uint8(Im));title('Դͼ��ֱ��ͼ');
% plot(img_hist(f3));
subplot(224);
imhist(uint8(Im_eq));title('�����ͼ��ֱ��ͼ');
% plot(img_hist(f3t));
saveas(2,'fig_2.pdf');

%%
%ͼ����룺
Im_n1 = imnoise(Im,'salt & pepper',0.02);
Im_n2 = imnoise(Im,'gaussian',0.02);
%��ֵ�˲�
% temp1 = [1,1,1;1,1,1;1,1,1];
% Im_in1_mean = img_fliter(double(Im_n1),temp1,'mean');
temp2 = ones(5,5)/25;
Im_in1_mean2 = imfilter(Im_n1,temp2);
Im_in2_mean2 = imfilter(Im_n2,temp2);
%��ֵ�˲�
%Im_in1_med1 = medfilt1(double(Im_n1));
Im_in1_med2 = medfilt2(double(Im_n1));
Im_in2_med2 = medfilt2(double(Im_n2));


figure(3);
subplot(241);
imshow(Im_n1);title('��������ͼ��');
subplot(242);
imshow(uint8(Im_in1_mean2));title('��������ͼ���ֵ�˲�');
subplot(243);
imshow(uint8(Im_in1_med2));title('��������ͼ����ֵ�˲�');
subplot(244);
imshow(uint8(imguidedfilter(Im_n1)));title('��������ͼ��߽籣���˲�');
subplot(245);
imshow(Im_n2);title('��˹����ͼ��');
subplot(246);
imshow(uint8(Im_in2_mean2));title('��˹����ͼ���ֵ�˲�');
subplot(247);
imshow(uint8(Im_in2_med2));title('��˹����ͼ����ֵ�˲�');
subplot(248);
imshow(uint8(imguidedfilter(Im_n2)));title('��˹����ͼ��߽籣���˲�');
saveas(3,'fig_3.pdf');


