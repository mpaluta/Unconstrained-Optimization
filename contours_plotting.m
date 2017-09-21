clear
clc
close all
%%
lim=5;
x=linspace(-lim,lim,100);
y=linspace(-lim,lim,100);
f=zeros(length(x),length(y));
for i=1:length(x)
    for j=1:length(y)
        f(i,j)=100*(y(j)-x(i)^2)^2+(1-x(i))^2;
    end
end
C=contour(x,y,f,6,'LineWidth',1.5);
%clabel(C)

% [X,Y] = meshgrid(-3:.05:3,-3:.05:3);
% Z = 100*(Y-X^2)^2+(1-X)^2;
% contour(X,Y,Z,15)

%% point 1
width=3;

pt11=[2.5,2.0];
pt12=[2.498227462444035,6.241133975820416];
pt13=[1.002005006940253,-1.2346674775727378];
pt14=[1.0020227056811923,1.0040986300901733];
pt15=[0.9999799085425406,0.9999556444685782];
pt16=[0.9999999632624482,0.999999926122706];
line([pt11(1) pt12(1)],[pt11(2) pt12(2)],'LineWidth',width,'Color','k')
line([pt12(1) pt13(1)],[pt12(2) pt13(2)],'LineWidth',width,'Color','k')
line([pt13(1) pt14(1)],[pt13(2) pt14(2)],'LineWidth',width,'Color','k')
line([pt14(1) pt15(1)],[pt14(2) pt15(2)],'LineWidth',width,'Color','k')
line([pt15(1) pt16(1)],[pt15(2) pt16(2)],'LineWidth',width,'Color','k')

%% point2
pt21=[-2.0,2.5];
pt22=[-1.990031675167617,3.9601255426270328];
pt23=[0.9414673559203708,-7.707326880210312];
pt24=[0.9414703231903943,0.8860664656368265];
pt25=[0.9966879841937719,0.9903379477471044];
pt26=[0.9987453825165769,0.9974881062103139];
line([pt21(1) pt22(1)],[pt21(2) pt22(2)],'LineWidth',width)
line([pt22(1) pt23(1)],[pt22(2) pt23(2)],'LineWidth',width)
line([pt23(1) pt24(1)],[pt23(2) pt24(2)],'LineWidth',width)
line([pt24(1) pt25(1)],[pt24(2) pt25(2)],'LineWidth',width)
line([pt25(1) pt26(1)],[pt25(2) pt26(2)],'LineWidth',width)

%% point 3
pt31=[-1.5,-1.0];
pt32=[-1.4961583342352758,2.2384724354932724];
pt33=[0.9915127581860252,-5.2054102995737805];
pt34=[0.9915370788131083,0.9832112252895904];
line([pt31(1) pt32(1)],[pt31(2) pt32(2)],'LineWidth',width,'Color','g')
line([pt32(1) pt33(1)],[pt32(2) pt33(2)],'LineWidth',width,'Color','g')
line([pt33(1) pt34(1)],[pt33(2) pt34(2)],'LineWidth',width,'Color','g')

%%
hold on
plot(1,1,'r.','MarkerSize',20)
xlabel('x[1]')
ylabel('x[2]')