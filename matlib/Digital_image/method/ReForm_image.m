%ʵ��ͼ��Ļ�������
f1 = imread('.\..\��ҵ1\q1.tif');
f2 = imread('.\..\��ҵ1\q2.tif');
f3 = imread('.\..\��ҵ3\Chest_xray).tif');

f1 = double(f1);
f2 = double(f2);
f3 = double(f3);
sz = size(f1);

beta = pi() * 0.25;
move_x = 0.21 * sz(1);
move_y = 0.21 * sz(2);
size_r = 1;

formMaix = [0,1,0;1,1,1;0,1,0];

% ͼ����ת���˲�ʵ��
f_new = Tranimage(f1, beta, move_x, move_y, size_r);
ff_new = img_fliter(f_new, formMaix);

figure();
subplot(221);
imshow(uint8(f_new));
subplot(222);
imshow(uint8(ff_new));
subplot(223);
imhist(uint8(f_new));
subplot(224);
imhist(uint8(ff_new));

% ͼ��Ҷ�ֵ����ʵ��

f3t = equl_hist(f3);
figure();
subplot(221);
imshow(uint8(f3));
subplot(222);
imshow(uint8(f3t));
subplot(223);
imhist(uint8(f3));
% plot(img_hist(f3));
subplot(224);
imhist(uint8(f3t));
% plot(img_hist(f3t));

%ͼ��ɫ,٤��任
f3tr = img_recolor(f3t);
f3trg = img_gammer(f3tr,0.7);
figure();
subplot(221);
imshow(uint8(f3));
subplot(222);
imshow(uint8(f3t));
subplot(223);
imshow(uint8(f3tr));
subplot(224);
imshow(uint8(f3trg));

%Ƶ��ͼ�任ʵ��
fft_f1 = fft2(f1);
ifft_f1 = ifft2(fft_f1);
figure();
subplot(221);
imagesc(abs(fftshift(fft_f1)));     %��λƵ��ͼ
subplot(222);
imagesc(abs(fft_f1));               %ԭʼƵ��ͼ
subplot(223);
imshow(uint8(f1));
subplot(224);
imshow(uint8(ifft_f1));


%Ƶ������任
fft_f3 = fft2(f3);
c = 1;
fft_f3_log = c * log(1 + fft_f3); 
ifft_f3_log = ifft2(fft_f3_log);

figure()
subplot(221);
imshow(uint8(f3));
subplot(222);
imshow(uint8(ifft_f3_log));
subplot(223);
imagesc(abs(fftshift(fft_f3)));
subplot(224);
imagesc(abs(fftshift(fft_f3_log)));
