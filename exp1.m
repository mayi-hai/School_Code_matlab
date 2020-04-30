format compact
clc,clear
fun=@(x)1./(1+6*x.*x);
fplot(fun,[-4,4]);%实际曲线
grid on
hold on
axis([-4 4 -0.1 1.1])%绘图中用于设置坐标值范围
%拉格朗日插值法
x=-4:1:4;y=fun(x);xi=-4:0.1:4;
m=length(x);n=length(y);p=length(xi);
if m~=n 
    error('向量x与y的长度必须一致');
end
s=0;
for k=1:n
    t=ones(1,p);
    for j=1:n
        if j~=k,
            t=t.*(xi-x(j))/(x(k)-x(j));
        end
    end
    s=s+t*y(k);
end
yi=s;
plot(xi,yi,'k')%拉格朗日插值曲线
   
%牛顿插值法
x=-4:0.5:4;y=fun(x);
m=length(x);n=length(y);
if m~=n 
    error('向量x与y的长度必须一致');
end
% 计算差商表(注意：该计算差商代码的方法与课程讲授方法有区别)
k=2;f(1)=y(1);
while k~=n+1
    f(1)=y(k);
    for i=1:k-1
        if i~=k-1
            f(i+1)=(f(i)-y(i))/(x(k)-x(i));
        else
            f(i+1)=(f(i)-y(i))/(x(k)-x(i));
        end
    end
    cs(i)=f(i+1);
    y(k)=f(k);
    k=k+1;
end
% 计算newton插值
x_i=-4:0.1:4;p=length(x_i);
yi=zeros(1,p);
for k=1:p
    xi=x_i(k);
cfwh=0;
for i=1:n-1
    w=1;
    for j=1:i
        w=w*(xi-x(j));
    end
    cfwh=cfwh+cs(i)*w;
end
yi(k)=y(1)+cfwh;
end
plot(x_i,yi,'r')%牛顿插值曲线
legend('实际曲线','拉格朗日插值','牛顿插值', 'Location','NorthEast');

