%��ȡ�ļ�,����ͼ��
Im  = imread('pout.tif');
Im1 = imread('cameraman.tif');
imwrite(Im,'test1.tif');
imwrite(Im1,'test2.tif');

%ͼ����Ϣ
sz = size(Im);
h = sz(1);  %ͼ��߶�
w = sz(2);  %ͼ����
avg_pix = sum(Im(:))/(h*w); %ͼ��Ҷ�ƽ��ֵ����ͷ���
avg_pix_fast = mean(Im(:));    %ͼ��Ҷ�ƽ��ֵ���������ã�
covIm = cov(double(Im));    %ͼ���Э�������

sprintf('ͼ��߶ȣ�%.2f;\nͼ���ȣ�%.2f;\n',h,w)
sprintf('ͼ��Ҷ�ƽ��ֵ����ͷ�����%.2f;\nͼ��Ҷ�ƽ��ֵ���������ã���%.2f;\n',avg_pix,avg_pix_fast)



%ͼ����ת��ƽ�ƣ�����
Im_t = Tranimage(double(Im),90/180/pi,50,50,1);


figure(1);
subplot(121);imshow(Im);title('ԭͼ��');
subplot(122);imshow(uint8(Im_t));title('��תƽ�ƺ�ͼ��');
saveas(1,'fig_1.pdf');

