function func = diffung(t,x)
func = zeros(2,1);
func(1) = x(2);
T = 0.01;
c = [100 20];
u = zeros(10001,1);
if(t<=50)
    func(2) = -11.5*(1-(2/sqrt(3+(x(1)*x(1)))))*x(1)-0.25*x(2)+sin(0.5*t);
    u = 11.5*(1-(2/sqrt(3+(x(1)*x(1)))))*x(1)-x(1)-sin(0.5*t);
   
else
   
         for n = 4999:10001
            u(n) = -c*x-(x(2)-x(1))/T-u(n-1);
           func(2) = -11.5*(1-(2/sqrt(3+(x(1)*x(1)))))*x(1)-0.25*x(2)+sin(0.5*t)+u(n);
         end
end
end