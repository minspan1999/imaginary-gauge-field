clc
clear all
close all
Nd = 43; 
t = 1; 
h = - 0.01;
k1 = exp(h); 
k2 = exp(-h); 
g = k1 - k2;

% h = -0.3466; h = 0.2466;

H = diag(g*1i*ones(1,Nd + 1)) + ...
    diag(t*k1*ones(1,Nd),1) + ...
    diag(t*k2*ones(1,Nd),-1);  % Assembling of Hamiltonian matrix
H(1,Nd + 1) = t*k2; H(Nd + 1,1) = t*k1;
% H((Nd + 1)/2 + 1,(Nd + 1)/2 + 1) = H((Nd + 1)/2 + 1,(Nd + 1)/2 + 1) - 0.1i;
% H(Nd + 1,Nd + 1) = 0.25i;
H(1,1) = g*1i;
[V, A] = eig(H);
lam = diag(A);
[~, idx] = sort(real(lam));
lam1 = lam(idx);
figure
plot(real(lam1),'b*')
hold on
plot(imag(lam1)*50,'r*')
set(gcf, 'Position', [00, 00, 350, 300])
axis([0 Nd + 1 -2.5 2.5])
set(gca,'FontSize', 14) % Font Size

bn = 22;
figure
bar(angle(V(:,bn)),'b')
hold on
plot(abs(V(:,bn))/max(abs(V(:,bn))),'r*')
set(gcf, 'Position', [00, 00, 350, 300])
set(gca,'FontSize', 14) % Font Size
axis([0 Nd + 1 -pi pi])
% 
% a = (Nd + 1)/4 + 1;
% I = zeros(a,a);
% for kb = 1:1:(a-1)
%     I(kb,1) = abs(V(kb,bn));
%     I(a,kb) = abs(V(kb + a - 1,bn));
%     I(a + 1 - kb,a) = abs(V(kb + 2*(a - 1),bn));
%     I(1,a + 1 - kb) = abs(V(kb + 3*(a - 1),bn));
% end
% figure
% imagesc(I)
% set(gcf, 'Position', [00, 00, 350, 300])
% colormap('hot')
% colorbar
% 
% a = (Nd + 1)/4 + 1;
% I = zeros(a,a);
% for kb = 1:1:(a-1)
%     I(kb,1) = angle(V(kb,bn));
%     I(a,kb) = angle(V(kb + a - 1,bn));
%     I(a + 1 - kb,a) = angle(V(kb + 2*(a - 1),bn));
%     I(1,a + 1 - kb) = angle(V(kb + 3*(a - 1),bn));
% end
% figure
% imagesc(-I,[-pi pi])
% set(gcf, 'Position', [00, 00, 350, 300])
% map = [1 0 0
%     1 1 0
%     0 0 1
%     1 1 0
%     1 0 0];
% colormap('hsv')
% colorbar


phi = linspace(2*pi/(Nd + 1),2*pi,Nd + 1);
phi2 = circshift(phi,1);
xRing = [cos(phi);cos(phi)*1.5;cos(phi2)*1.5;cos(phi2)];
yRing = [sin(phi);sin(phi)*1.5;sin(phi2)*1.5;sin(phi2)];
ringData = angle(V(:,bn));
figure
patch(xRing,yRing,ringData, 'Edgecolor','none');
set(gca,'cLim',[-pi pi]);
axis square
axis off
set(gcf,'color','w');
colormap('hsv')
colorbar