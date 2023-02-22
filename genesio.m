clear all;
close all;
clc;
a = 1.2;
b = 4;
c = 6;
T = 0.1;
k = 100;
x = zeros(10000,1);
y = zeros(10000,1);
z = zeros(10000,1);
x(1) = 2;
y(1) = 0.5;
z(1) = 2.2;
u = zeros(10000,1);
N = 10000;
for i = 1:5000
    x(i+1,1) = x(i,1)+T*y(i,1);
    y(i+1,1) = y(i,1)+T*z(i,1);
    z(i+1,1) = z(i,1)+T*(-c*x(i,1)-b*y(i,1)-a*z(i,1)+(x(i,1)*x(i,1)));
    if(z(i,1) == 0)
        u(i,1) = c*x(i,1)+b*y(i,1)-((x(i,1)*y(i,1))/z(i,1)+0.01)-y(i,1)-(x(i,1)*x(i,1));
    else
        u(i,1) = c*x(i,1)+b*y(i,1)-((x(i,1)*y(i,1))/z(i,1))-y(i,1)-(x(i,1)*x(i,1));
    end
end
  %u(500) = -k*z(500,1)-y(500,1)+c*x(500,1)+b*y(500,1)+a*z(500,1)-(x(500,1)*x(500,1));
for i = 5001:N
    u(i,1) = -(12.5*x(i,1)+25*y(i,1)+1.5*z(i,1))-((z(i,1)-y(i,1))/T)+u(i-1,1);
    x(i+1,1) = x(i,1)+T*y(i,1);
    y(i+1,1) = y(i,1)+T*z(i,1);
    if(u(i,1)>1)
        u(i,1) = 1;
        z(i+1,1) = z(i,1)+T*(-c*x(i,1)-b*y(i,1)-a*z(i,1)+(x(i,1)*x(i,1)))+u(i,1);
    elseif (u(i,1)<-1)
            u(i,1) = -1;
            z(i+1,1) = z(i,1)+T*(-c*x(i,1)-b*y(i,1)-a*z(i,1)+(x(i,1)*x(i,1)))+u(i,1);
    else
        z(i+1,1) = z(i,1)+T*(-c*x(i,1)-b*y(i,1)-a*z(i,1)+(x(i,1)*x(i,1)))+u(i,1);
    end

end
j = 1:1:N;
plot(j,x(j,1));
xlabel('N');
ylabel('x')
figure;
plot(j,y(j,1));
xlabel('N');
ylabel('y')
figure;
plot(j,z(j,1));
xlabel('N');
ylabel('z')
 figure;
plot(5000:1:10000,u(5000:1:10000,1));

% plot3(x(j,1),y(j,1),z(j,1));
% figure;
% plot(x(j,1),y(j,1));
fprintf('%g ',u(5000:1:5500,1));

