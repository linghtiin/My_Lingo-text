function hist = img_hist(img, n)
%img_hist 获取图像的灰度直方图
%   xx
sz = size(img);

if nargin == 1
    n = 256;
end

hist = zeros(n,1);

for p = 0:n-1
    for i = 1 : sz(1)
        for j = 1:sz(2)
            if p == img(i,j)
                hist(p+1) = hist(p+1) + 1;
            end
        end
    end
end
        

end

