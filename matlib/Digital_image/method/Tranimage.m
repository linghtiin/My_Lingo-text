function f_new = Tranimage(f, beta, move_x, move_y, size_r)
%Tranimage  ��ͼ��������š���ת���������ĵ㣩��ƽ�Ʋ���
%beta ��ת�ǣ�������
%move_x,move_y ƽ�ƾ���
%size_r ���ű���


sz = size(f);

%��ת����
TranMaix_whirl = [cos(beta)           ,sin(beta)          ,0;
                  -sin(beta)          ,cos(beta)          ,0;
                  0                   ,0                  ,1    ];

%������λ�ƾ���
TranMaix_size = [size_r             ,0                  ,move_x;
                 0                  ,size_r             ,move_y;
                 0                  ,0                  ,1      ];

 %��ת���ľ���
TranMaix_whirlpiont = [1             ,0                  ,0.5 * sz(1);
                       0             ,1                  ,0.5 * sz(2);
                       0             ,0                  ,1           ];

                   
%������ͼ�����
new_size = [ceil(size_r * 1.22 *sz(1)), ceil( size_r * 1.22 *sz(2) )];
f_new = zeros(new_size(1),new_size(2));

%����ԭͼ�������һΪ��ͼ�����ֵ
for x = 1:sz(1)
    for y = 1:sz(2)
        t_local = TranMaix_size * TranMaix_whirlpiont * TranMaix_whirl * inv(TranMaix_whirlpiont) * [x, y, 1].';
        f_new(round(t_local(1)),round(t_local(2))) = f(x,y);
    end
end



end

