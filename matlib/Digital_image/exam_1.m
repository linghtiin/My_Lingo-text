%读取文件,保存图像
Im  = imread('pout.tif');
Im1 = imread('cameraman.tif');
imwrite(Im,'test1.tif');
imwrite(Im1,'test2.tif');

%图像信息
sz = size(Im);
h = sz(1);  %图像高度
w = sz(2);  %图像宽度
avg_pix = sum(Im(:))/(h*w); %图像灰度平均值（求和法）
avg_pix_fast = mean(Im(:));    %图像灰度平均值（函数调用）
covIm = cov(double(Im));    %图像的协方差矩阵

sprintf('图像高度：%.2f;\n图像宽度：%.2f;\n',h,w)
sprintf('图像灰度平均值（求和法）：%.2f;\n图像灰度平均值（函数调用）：%.2f;\n',avg_pix,avg_pix_fast)



%图像旋转，平移，缩放
Im_t = Tranimage(double(Im),90/180/pi,50,50,1);


figure(1);
subplot(121);imshow(Im);title('原图像');
subplot(122);imshow(uint8(Im_t));title('旋转平移后图像');
saveas(1,'fig_1.pdf');

