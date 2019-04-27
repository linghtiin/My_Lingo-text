function f_new = img_recolor(img)
%img_recolor Í¼Ïñ·´É«
%   x'x

sz = size(img);
i_max = max(img(:));
i_min = min(img(:));

f_new = zeros(sz);
for i = i_min : i_max-1
    f_new(img==i) = i_max - i;
end


end

