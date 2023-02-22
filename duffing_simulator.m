clear all;
close all;
clc;
time = 0:0.01:100;
xint = [2,1];
[t,x] = ode23(@(t,x) diffung(t,x),time,xint);
plot(t,x(:,1))
xlabel('time')
ylabel('x(1)')
figure;
plot(t,x(:,2))
xlabel('time')
ylabel('x(2)')