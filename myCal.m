format long 
clear all

%¡ª¡ª¡ª¡ª¡ª¡ª´¬ÊôÐÔ¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª
M=0.961+0.105+0.2;%Î¦¸ËºÍÖØÎï

boat.H=0.175; %´¬¸ß
boat.A=(0.175/0.0175);%H=A*X^2+B*Y^2
boat.B=(0.175/0.0121);
boat.theta=1/180*pi;%Æ«×ª½Ç¶È
boat.longguDist=[0.02829,0.08391,0.1232];%¸÷Æ¬¾àÀë
boat.density=0.386/0.3;%°å×ÓÃæÃÜ¶È
%¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª



%¡ª¡ª¡ª¡ª¼ÆËãÌå»ýV´¬¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª
V.xmin=-(boat.H/boat.A).^(1/2);
V.xmax= (boat.H/boat.A).^(1/2);

V.ymin=@(x) -sqrt((boat.H-boat.A*x.^2)./boat.B);
V.ymax=@(x)  sqrt((boat.H-boat.A*x.^2)./boat.B);

V.f=@(x,y) boat.H-boat.A*x.^2-boat.B*y.^2;
boat.V=quad2d(V.f,V.xmin,V.xmax,V.ymin,V.ymax);
disp('´¬µÄÌå»ýV:'); disp(boat.V);
%¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª



%¡ª¡ª¡ª¡ª¼ÆËã´¬µÄ±íÃæ»ý¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª

S.jiabanf=@(x) 2*sqrt((boat.H-boat.A*x.^2)/boat.B);
S.jiaban=quad(S.jiabanf,V.xmin,V.xmax);
disp('¼×°åS:'); disp(S.jiaban);
S.jiemian=0;
for i=1:3
    S.xmin=-(((boat.H-boat.B*boat.longguDist(i).^2)/boat.A).^(1/2)); 
    S.xmax=(((boat.H-boat.B*boat.longguDist(i).^2)/boat.A).^(1/2)); 
    S.jiemianf=@(x) boat.H-(boat.A*x.^2+boat.B*boat.longguDist(i)^2);
    temp=quad(S.jiemianf,S.xmin,S.xmax);
    %disp('½ØÃæS:'); disp(i);disp(temp)
    S.jiemian=S.jiemian+temp;
end
disp('½ØÃæS:'); disp(S.jiemian);
S.ymin=-sqrt(boat.H/boat.B);
S.ymax= sqrt(boat.H/boat.B);
S.longguf=@(y) boat.B*y.^2+0.03-boat.B*y.^2;
S.longgu=quad(S.longguf,S.ymin,S.ymax);
disp('Áú¹ÇS:'); disp(S.longgu);
boat.S=S.longgu+S.jiemian+S.jiaban;
disp('´¬×ÜS:'); disp(boat.S);
%¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª
boat.m=boat.S*boat.density+M;%´¬×ÜÖØ
disp('´¬×ÜÖØ:'); disp(boat.m);
%¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª


%¡ª¡ª¡ª¡ª¡ª¡ª¼ÆËãÖØÐÄ¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª
boat.kongCOMf=@(x,y) (boat.H.^2-(boat.A*x.^2+boat.B*y.^2).^2)/2;
boat.kongCOM=quad2d(boat.kongCOMf,V.xmin,V.xmax,V.ymin,V.ymax)/boat.V;
disp('¿Õ´¬ÖØÐÄkCOM:'); disp(boat.kongCOM);


under_boat=0.1;
boat.COM=(boat.kongCOM*boat.S*boat.density)/boat.m + 0.980*0.047/boat.m + 0.105 * (0.175+(0.25-under_boat))/boat.m;
%×Ü´¬ÖØÐÄx×Ü´¬ÖÊÁ¿=¿Õ´¬ÖØÐÄx¿Õ´¬ÖÊÁ¿+Î¦¸ËÖØÐÄxÎ¦¸ËÖÊÁ¿+ÖØÎïÖØÐÄxÖØÎïÖÊÁ¿
disp('´¬ÖØÐÄCOM:'); disp(boat.COM);
%¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª




%¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª³ÔË®Ïß¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª
boat.waterLine=0.05;
wucha=1000;
while (wucha>0.00001)
      o=@(x,y)boat.waterLine-boat.A*x.^2-boat.B*y.^2;
      waterxmin=-sqrt(boat.waterLine/boat.A);
      waterxmax=sqrt(boat.waterLine/boat.A);
      waterymin=@(x)-sqrt((boat.waterLine-boat.A*x.^2)./boat.B);
      waterymax=@(x)sqrt((boat.waterLine-boat.A*x.^2)./boat.B);
      volumnp=quad2d(o,waterxmin,waterxmax,waterymin,waterymax);
      wucha=abs(volumnp-boat.m/1000);
      boat.waterLine=boat.waterLine+0.0001;
end 
boat.waterLine=boat.waterLine-0.00001;
wucha=1000;
disp('³ÔË®Ïß:'); disp(boat.waterLine);
%¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª


%¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¸¡ÐÄ¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª
F.kmax=boat.H;
F.kmin=0;
F.k=0.3;
while (i<1000)   %È·¶¨
  c = [boat.A,-tan(boat.theta),-F.k ];
  r = roots(c);
if r(1)>r(2) 
     temp1=r(1);
     temp2=r(2);
else
     temp1=r(2);
     temp2=r(1);
end
  temp3= (boat.H-F.k)/tan(boat.theta);
 tiji=@(x,y)(tan(boat.theta).*x+F.k-boat.A*x.^2).^(3/2);
 f=@(x,y) boat.H-boat.A*x.^2-boat.B*y.^2;

 if(boat.theta<90/180*pi)
     if(temp3<=temp1)
     volumns=4/3/sqrt(boat.B)*quad(tiji,temp2,temp3)+quad2d(f,temp3,V.xmax,V.ymin,V.ymax);
        type=1; 
     else
         volumns=4/3/sqrt(boat.B)*quad(tiji,temp2,temp1); type=2;
     end
 end  
  if(boat.theta>90/180*pi)
   if(temp3>=temp2) 
   volumns=4/3/sqrt(boat.B)*quad(tiji,temp3,temp1)+quad2d(f,V.xmin,temp3,V.ymin,V.ymax); type=3; temp5=volumns;   volumns=boat.V-temp5;
  else  
  volumns=4/3/sqrt(boat.B)*quad(tiji,temp2,temp1); type=4;  temp5=volumns;   volumns=boat.V-temp5;
    end 
  end 
   if(volumns>=boat.m/1000)
         if(F.k>F.kmin)   F.kmin=F.k;
         end 
   end 
       if(volumns<=boat.m/1000)
         if(F.k<F.kmax)  F.kmax=F.k;
         end
       end 
      F.k=(F.kmax+F.kmin)/2;   i=i+1;  
      F.k;
end

type=1;
 F.ymin=@(x)-sqrt((tan(boat.theta)*x+F.k-boat.A*x.^2)/boat.B);
 F.ymax=@(x)sqrt((tan(boat.theta)*x+F.k-boat.A*x.^2)/boat.B);
  if(type==1)
      tijix=@(x,y)x.*(tan(boat.theta).*x+F.k-boat.A*x.^2-boat.B*y.^2);   
      fx=@(x,y)x.*(boat.H-boat.A*x.^2-boat.B*y.^2);
      fux=(quad2d(fx,temp3,V.xmax,V.ymin,V.ymax)+quad2d(tijix,temp2,temp3,V.ymin,V.ymax))/(boat.m/1000);
       
      tijiz=@(x,y)((tan(boat.theta)*x+F.k).^2-(boat.A*x.^2+boat.B*y.^2).^2)/2;
  
      fz=@(x,y)(boat.H^2-(boat.A*x.^2+boat.B*y.^2).^2)/2;
      fuz=(quad2d(fx,temp3,V.xmax,V.ymin,V.ymax)+integral2(tijiz,temp2,temp3,F.ymin,F.ymax))/(boat.m/1000);
  end 
if(type==2)
      tijix=@(x,y)x.*(tan(boat.theta).*x+F.k-boat.A*x.^2-boat.B*y.^2);  
      fx=@(x,y)x.*(boat.H-boat.A*x.^2-boat.B*y.^2);
      fux=quad2d(tijix,temp2,temp1,F.ymin,F.ymax)/(boat.m/1000);
      tijiz=@(x,y)((tan(boat.theta)*x+F.k).^2-(boat.A*x.^2+boat.B*y.^2).^2)/2;
      fz=@(x,y)(boat.H^2-(boat.A*x.^2+boat.B*y.^2).^2)/2;
      fuz=quad2d(tijiz,temp2,temp1,F.ymin,F.ymax)/(boat.m/1000);
end  
  if(type==3)
      tijix=@(x,y)x.*(tan(boat.theta).*x+F.k-boat.A*x.^2-boat.B*y.^2);  
      fx=@(x,y)x.*(boat.H-boat.A*x.^2-boat.B*y.^2);
      fux=-(quad2d(fx,V.xmin,temp3,V.ymin,V.ymax)+quad2d(tijix,temp3,temp1,F.ymin,F.ymax))/(boat.m/1000);
      tijiz=@(x,y)((tan(boat.theta)*x+F.k).^2-(boat.A*x.^2+boat.B*y.^2).^2)/2;
      fz=@(x,y)(boat.H^2-(boat.A*x.^2+boat.B*y.^2).^2)/2;
      fuz=(boat.kongCOM*boat.V-quad2d(fz,V.xmin,temp3,V.ymin,V.ymax)-quad2d(tijiz,temp3,temp1,F.ymin,F.ymax))/(boat.m/1000);
   end 
 if(type==4)
      tijix=@(x,y)x.*(tan(boat.theta).*x+F.k-boat.A*x.^2-boat.B*y.^2);  
      fx=@(x,y)x.*(boat.H-boat.A*x.^2-boat.B*y.^2);
      fux=-(4/3/sqrt(boat.B)*quad2d(tijix,temp2,temp1,F.ymin,F.ymax))/(boat.m/1000); 
      tijiz=@(x,y)((tan(boat.theta)*x+F.k).^2-(boat.A*x.^2+boat.B*y.^2).^2)/2;
      fz=@(x,y)(boat.H^2-(boat.A*x.^2+boat.B*y.^2).^2)/2;
      fuz=(quad2d(tijiz,temp2,temp1,F.ymin,F.ymax))/(boat.m/1000);
 end 
 libi=[fux,0,fuz-boat.COM];
 fu=[-sin(boat.theta),0,cos(boat.theta)];
jiegu=cross(fu,libi);
  disp('Á¦¾Ø'); disp(jiegu);



