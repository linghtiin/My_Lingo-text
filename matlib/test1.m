clear;clc;
n=0;
x=[1:14];
y=[2:16];
for i=1:7
    n=x(i)+y(i);
end


n


%%
clear;clc;
n=[];
for j=1:100
n=[n,1];
x=j;
for i=2:(x/2)
    if rem(x,i)==0
        n(j)=0;
        break;
    end
end
end
n
%%
clear;clc;

x=rand(1,8)
for i=1:8
    if x(i)>.5
        x(i)=1;
    else
        x(i)=-1;
    end
end
x
for j=1:999900vc0
    
    for i=1:7
        x(i)=x(i)*x(i+1);
    end
    x(8)=x(8)*x(1);
end

x








