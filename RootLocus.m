%%Problem 1
s=tf('s');
%syms s;
w=logspace(-2,4,10000);
%G=1/(s*(s/20+1)*((s/100)^2+0.5*(s/100)+1));
L=70E-6;
R=3.41;
J=1.35E-7;
b=19.89E-7;
N=200;
ke=6.59E-3;
kt=6.59E-3;
Gint=((kt*N)*(50*s+12.5))/(s*(s^3*(L*J*N^2)+s^2*(N^2*(R*J+L*b))+s*(R*b*N^2-(L*0.0529)-kt*ke*N^2)-(R*0.0529)));
Gder=((kt*N)*(.005*s+125))/(s^3*(L*J*N^2)+s^2*(N^2*(R*J+L*b))+s*(R*b*N^2-(L*0.0529)-kt*ke*N^2)-(R*0.0529));
P=0.328/(0.0368*s^2);
T=(100*Gint*P)/(s+100+Gint*s+100*Gint*P+100*Gint);
figure(1);clf();
bode(G,w);grid on;hold on;

%z1=20;
%p1=5*20;
%D1=((s/z1)+1)/((s/p1)+1);
%bode(D1*G,w);

%k=10^(29.6/20);
%bode(k*D1*G,w);

%L(s)=30.2/s  Kv=30.2  introduce 100/30.2
%z2=3;
%p2=z2/(100/30.2);
%D2=(s+z2)/(s+p2);
%bode(k*D1*D2*G,w);


%%root locus 
%G=4/((s+0.5)*(s-0.5)*(s+15));
%D=(s+2);
figure(2);clf();
rlocus(T);
grid on;axis equal;


