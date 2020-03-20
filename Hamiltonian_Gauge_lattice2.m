clc
clear all
close all
Nd = 15; 
t = 1; 
h = - 0.02;
k1 = exp(h); 
k2 = exp(-h); 
g = k1 - k2;

Nr = (Nd + 1)/4;
F0 = sparse(zeros(Nr, Nr));
E1 = sparse(fliplr(diag([k2 0.0*k1 0.0*k1 k1])));
E2 = sparse(fliplr(0*diag([k1 k1 k1 k1])));
D1 = diag(-g*1i*ones(1,Nr)) + diag(k1*ones(1,Nr-1), 1) + diag(k2*ones(1,Nr-1), -1);
D2 = diag(-g*1i*ones(1,Nr)) + diag(k2*ones(1,Nr-1), 1) + diag(k1*ones(1,Nr-1), -1);
D3 = diag(3*g*1i*ones(1,Nr)) + diag(0.3*k1*ones(1,Nr-1), 1) + diag(0.3*k1*ones(1,Nr-1), -1);
H = sparse([D1 E1 F0 F0;
            E1 D1 E2 F0;
            F0 E2 D3 E2;
            F0 F0 E2 D3]);

% H = sparse([D1 E1;
%             E1 D1;
%             ]);

[V, A] = eig(full(H));
lam = diag(A);
% [~, idx] = sort(real(lam));
% lam1 = lam(idx);
figure
plot(real(lam),'b*')
hold on
plot(imag(lam)*50,'r*')
set(gcf, 'Position', [00, 00, 350, 300])
% axis([0 Nd + 1 -2.5 2.5])
set(gca,'FontSize', 14) % Font Size
Lasing = find(imag(diag(V)) > 0);
Lasing=5

bn = 5
figure
bar(angle(V(:,bn)),'b')
hold on
plot(abs(V(:,bn))/max(abs(V(:,bn))),'r*')
set(gcf, 'Position', [00, 00, 350, 300])
set(gca,'FontSize', 14) % Font Size
axis([0 Nd + 1 -pi pi])


Intensity = abs(V(:, Lasing)) .* abs(V(:, Lasing));
Intensity = Intensity ./ max(Intensity);
Phase = angle(V(:, Lasing));
Nall = sqrt(Nd+1);
for k = 1:1:Nall

    if mod(k, 2)
        RT(k, :) = Intensity((k - 1) * Nall + (1:Nall));
    else
        RT(k, :) = fliplr(Intensity((k - 1) * Nall + (1:Nall))');
    end

end

for k = 1:1:Nall

    if mod(k, 2)
        RA(k, :) = Phase((k - 1) * Nall + (1:Nall));
    else
        RA(k, :) = fliplr(Phase((k - 1) * Nall + (1:Nall))');
    end

end

figure;
imagesc(RT);
colorbar;
set(gcf, 'Position', [00, 00, 400, 300]);
set(gca, 'FontSize', 14);

figure;
imagesc(RA, [-pi pi]);
colormap([0.5 0.5 0.5; 0 1 1; 0 1 0; 1 0.5 0; 0.5 0.5 0.5]);
% colormap 'flag'
colorbar;

% bn = 9;
% figure
% bar(angle(V(:,bn)),'b')
% hold on
% plot(abs(V(:,bn))/max(abs(V(:,bn))),'r*')
% set(gcf, 'Position', [00, 00, 350, 300])
% set(gca,'FontSize', 14) % Font Size
% axis([0 Nd + 1 -pi pi])
% phi = linspace(2*pi/(Nd + 1),2*pi,Nd + 1);
% phi2 = circshift(phi,1);
% xRing = [cos(phi);cos(phi)*1.5;cos(phi2)*1.5;cos(phi2)];
% yRing = [sin(phi);sin(phi)*1.5;sin(phi2)*1.5;sin(phi2)];
% ringData = angle(V(:,bn));
% figure
% patch(xRing,yRing,ringData, 'Edgecolor','none');
% set(gca,'cLim',[-pi pi]);
% axis square
%  axis off
% set(gcf,'color','w');
% colormap('hsv')
% colorbar