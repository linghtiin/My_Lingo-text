function f_new = Tranimage(f, beta, move_x, move_y, size_r)
%Tranimage  对图像进行缩放、旋转（基于中心点）与平移操作
%beta 旋转角，弧度制
%move_x,move_y 平移距离
%size_r 缩放比例


sz = size(f);

%旋转矩阵
TranMaix_whirl = [cos(beta)           ,sin(beta)          ,0;
                  -sin(beta)          ,cos(beta)          ,0;
                  0                   ,0                  ,1    ];

%缩放与位移矩阵
TranMaix_size = [size_r             ,0                  ,move_x;
                 0                  ,size_r             ,move_y;
                 0                  ,0                  ,1      ];

 %旋转中心矩阵
TranMaix_whirlpiont = [1             ,0                  ,0.5 * sz(1);
                       0             ,1                  ,0.5 * sz(2);
                       0             ,0                  ,1           ];

                   
%建立新图像矩阵
new_size = [ceil(size_r * 1.22 *sz(1)), ceil( size_r * 1.22 *sz(2) )];
f_new = zeros(new_size(1),new_size(2));

%根据原图像矩阵逐一为新图像矩阵赋值
for x = 1:sz(1)
    for y = 1:sz(2)
        t_local = TranMaix_size * TranMaix_whirlpiont * TranMaix_whirl * inv(TranMaix_whirlpiont) * [x, y, 1].';
        f_new(round(t_local(1)),round(t_local(2))) = f(x,y);
    end
end



end

