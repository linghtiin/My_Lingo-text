function new_img = img_fliter(img,formMaix)
%img_fliter 为图像通过模板矩阵进行滤波,低灰度像素补值。
%img        图像
%formMaix   模板矩阵

sz = size(formMaix);
sz_f = size(img);

m_sz = (sz-1)/2;
formMaix = formMaix/sum(formMaix(:)) * numel(formMaix);

temp_img = blkdiag(zeros(sz),img,zeros(sz));

for x = sz(1): sz(1)+sz_f(1)
    for y = sz(2): sz(2)+sz_f(2)
        temp_maix = temp_img(x-m_sz(1):x+m_sz(1), y-m_sz(2):y+m_sz(2)).* formMaix;    
        
        if temp_img(x,y) < mean(temp_maix(:))
            temp_img(x,y) = mean(temp_maix(:));            
        end    
    end
end

new_img = temp_img(sz(1)+1:sz(1)+sz_f(1), sz(2)+1:sz(2)+sz_f(2));

end

