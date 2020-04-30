format compact
clc,clear
fun=@(x)1./(1+6*x.*x);
fplot(fun,[-4,4]);%ʵ������
grid on
hold on
axis([-4 4 -0.1 1.1])%��ͼ��������������ֵ��Χ
%�������ղ�ֵ��
x=-4:1:4;y=fun(x);xi=-4:0.1:4;
m=length(x);n=length(y);p=length(xi);
if m~=n 
    error('����x��y�ĳ��ȱ���һ��');
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
plot(xi,yi,'k')%�������ղ�ֵ����
   
%ţ�ٲ�ֵ��
x=-4:0.5:4;y=fun(x);
m=length(x);n=length(y);
if m~=n 
    error('����x��y�ĳ��ȱ���һ��');
end
% ������̱�(ע�⣺�ü�����̴���ķ�����γ̽��ڷ���������)
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
% ����newton��ֵ
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
plot(x_i,yi,'r')%ţ�ٲ�ֵ����
legend('ʵ������','�������ղ�ֵ','ţ�ٲ�ֵ', 'Location','NorthEast');

