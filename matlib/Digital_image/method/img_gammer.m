function f_new = img_gammer(img,gammer_val)
%img_gammer 对图像进行伽马变换
%   xx

if nargin == 1
    gammer_val = 1;
end

sz = size(img);
i_max = max(img(:));
i_min = min(img(:));

% hist_org = 0 : 255;
% hist_new = 256 * (hist_org/256) .^ gammer_val;



f_new = zeros(sz);
for i = i_min: i_max
    for x = 1: sz(1)
        for y = 1: sz(2)
            if img(x,y) == i
                f_new(x,y) = i_max * (img(x,y)/i_max)^gammer_val;
            end
        end
    end
end


end

