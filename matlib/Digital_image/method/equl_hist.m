function f_new = equl_hist(img,n)
%equl_hist Í¼ÏñÖ±·½Í¼¾ùºâ
%   x'x

if nargin == 1
    n = 256;
end

sz = size(img);

hist_org = img_hist(img);
sz_h_o = numel(hist_org);

Fg = zeros(sz_h_o,1);
for pg = 1:sz_h_o
    for i = 1:pg
        Fg(pg) = Fg(pg) + hist_org(i);
    end
    Fg(pg) = Fg(pg)/numel(img);
end
    
Fg = round((Fg* sz_h_o) +0.5);

f_new = zeros(sz);
for i = 0:n-1
    f_new(img==i) = Fg(i+1);
end

end

