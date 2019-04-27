%Ô­Ê¼Í¼Ïñ

f1 = imread('q1.tif');
f2 = imread('q2.tif');
f1 = double(f1);
f2 = double(f2);
sz = size(f1);

t_mse = 0;
t_f1_2 = 0;

t_ui1 = 0;
t_ui2 = 0;
t_d1 = 0;
t_d2 = 0;
t_d12 = 0;

for x = 1: sz(1)
    for y = 1: sz(2)
        t_mse = t_mse + power(f2(x,y)-f1(x,y),2);
        t_f1_2 = t_f1_2 + power(f1(x,y),2);
        
        t_ui1 = t_ui1 + f1(x,y);
        t_ui2 = t_ui2 + f2(x,y);
    end
end
t_ui1 = 1.0 * t_ui1/(sz(1)*sz(2));
t_ui2 = 1.0 * t_ui2/(sz(1)*sz(2));

for x = 1: sz(1)
    for y = 1: sz(2)
        t_d1 = t_d1 + power(f1(x,y) - t_ui1,2);
        t_d2 = t_d2 + power(f2(x,y) - t_ui2,2);
        t_d12 = t_d12 + (f1(x,y) - t_ui1) * (f2(x,y) - t_ui2);
    end
end
t_d1 = sqrt(t_d1/(sz(1)*sz(2)-1));
t_d2 = sqrt(t_d2/(sz(1)*sz(2)-1));
t_d12 = t_d12/(sz(1)*sz(2)-1);

c1 = 0.1;
c2 = 0.1;
c3 = 0.05;

l = (2 * t_ui1 * t_ui2 + c1) / (power(t_ui1,2) + power(t_ui2,2) + c1);
c = (2 * t_d1 * t_d2 + c2) / (power(t_d1,2) + power(t_d2,2) + c2);
s = (t_d12 + c3) / (t_d1 * t_d2 + c3);


MSE = 1.0 * t_mse/(sz(1)*sz(2))
SNR = 10 * log10(t_f1_2 / t_mse)
PSNR = 10 * log10(power(255,2)/MSE)

SSIM = power(l,1) * power(c,1) * power(s,1)
SSIM_fast = (2 * t_ui1 * t_ui2 + c1)*(2 * t_d12 + c2)/((power(t_ui1,2) + power(t_ui2,2) + c1)*(power(t_d1,2) + power(t_d2,2) + c2))





