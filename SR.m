clear all; clc;
num=str2double(strsplit(input('�ndices do Numerador: ','s'),' '));
den=str2double(strsplit(input('�ndices do Denominador: ','s'),' '));
FT=tf(num,den)

[polos,zeros]=pzmap(num,den)
S = stepinfo(FT,'RiseTimeLimits',[0.0,1])
%RiseTime: tempo de subida (Tr)
%SettlingTime: tempo de acomoda��o (Ts)
%SettlingMin: valor m�nimo de y uma vez que a resposta tenha aumentado
%SettlingMax: valor m�ximo de y
%Overshoot: Porcentagem m�xima de sobressinal
%Undershoot: Porcentagem do sobsinal
%Peak: Pico absoluto de y
%PeakTime: Tempo de pico (Tp)

step(FT)
[y,t]=step(FT);
% Y=find(t==S.RiseTime);

i=1;
while t(i,1)<=S.RiseTime
    Y=y(i,1);
    i=i+1;
end

i=1;
while y(i,1)<=Y*0.5
    Td=t(i,1);
    i=i+1;
end
y(i,1);
Td %tempo de atraso