
bar12by12 = [0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	1	0	0	0	0	0
0	0	0	0	0	0	1	0	0	0	0	0
0	0	0	0	0	0	1	0	0	0	0	0
0	0	0	0	0	0	1	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0
];

bar10by10 = [0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0
0	0	0	0	1	0	0	0	0	0
0	0	0	0	1	0	0	0	0	0
0	0	0	0	1	0	0	0	0	0
0	0	0	0	1	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0
];

bar8by8 = [0	0	0	0	0	0	0	0
0	0	0	1	0	0	0	0
0	0	0	1	0	0	0	0
0	0	0	1	0	0	0	0
0	0	0	1	0	0	0	0
0	0	0	1	0	0	0	0
0	0	0	1	0	0	0	0
0	0	0	0	0	0	0	0

];

circle1 = [1	1	0	0	0	0	0	0	0	0
1	1	1	1	1	1	1	1	1	0
1	1	0	0	0	0	0	0	1	0
0	1	0	0	0	0	0	0	1	0
0	1	0	0	0	0	0	0	1	0
0	1	0	0	0	0	0	0	1	0
0	1	0	0	0	0	0	0	1	0
0	1	0	0	0	0	0	0	1	0
0	1	1	1	1	1	1	1	1	0
0	0	0	0	0	0	0	0	0	0
];

figure;
imagesc(bar10by10, [0, 1]);
set(gcf, 'Position', [00, 00, 350, 300])
set(gca, 'FontSize', 10)% Font Size
colormap autumn
colorbar
title('Desired Far Field Image');

imwrite(bar10by10, 'bar_10by10.png');

IntensityNear = ones(8, 8);
save('bar_8by8_raw.mat','IntensityNear');



%% FarField


% clear all

N = 8;


IntensityNear = [1	1	1	1	1	1	1	1	1	1
1	0	0	0	0	0	0	0	0	1
1	0	0	0	0	0	0	0	0	1
1	0	0	0	0	0	0	0	0	1
1	0	0	0	0	0	0	0	0	1
1	0	0	0	0	0	0	0	0	1
1	0	0	0	0	0	0	0	0	1
1	0	0	0	0	0	0	0	0	1
1	0	0	0	0	0	0	0	0	1
1	1	1	1	1	1	1	1	1	1
];

% IntensityNear = [0	0	0	0	0	0	0	0	0	0	0	0
% 0	0	0	0	0	0	0	0	0	0	0	0
% 0	0	1	1	1	1	1	1	1	1	0	0
% 0	0	1	0	0	0	0	0	0	1	0	0
% 0	0	1	0	0	0	0	0	0	1	0	0
% 0	0	1	0	0	0	0	0	0	1	0	0
% 0	0	1	0	0	0	0	0	0	1	0	0
% 0	0	1	0	0	0	0	0	0	1	0	0
% 0	0	1	0	0	0	0	0	0	1	0	0
% 0	0	1	1	1	1	1	1	1	1	0	0
% 0	0	0	0	0	0	0	0	0	0	0	0
% 0	0	0	0	0	0	0	0	0	0	0	0
% ];

save('imageNear_grids.mat', 'IntensityNear');

figure
imagesc(IntensityNear);

IntensityNear(N, N) = 0;
IntensityNear(1:2:N - 1, :) = 1;
IntensityNear(:, 1:2:N - 1) = 1;
save('imageNear_meshgrid.mat', 'IntensityNear');

IntensityNear = ones(N, N);
save('imageNear_uniform.mat', 'IntensityNear');

%% A letter map
A = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 1 1 1 1 1 1 0 0 0 0 0 0 0
    0 0 0 0 0 0 1 1 0 0 0 0 1 1 0 0 0 0 0 0
    0 0 0 0 0 1 1 0 0 0 0 0 0 1 1 0 0 0 0 0
    0 0 0 0 1 1 0 0 0 0 0 0 0 0 1 1 0 0 0 0
    0 0 0 0 1 1 0 0 0 0 0 0 0 0 1 1 0 0 0 0
    0 0 0 0 1 1 0 0 0 0 0 0 0 0 1 1 0 0 0 0
    0 0 0 0 1 1 0 0 0 0 0 0 0 0 1 1 0 0 0 0
    0 0 0 0 1 1 0 0 0 0 0 0 0 0 1 1 0 0 0 0
    0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0
    0 0 0 0 1 1 0 0 0 0 0 0 0 0 1 1 0 0 0 0
    0 0 0 0 1 1 0 0 0 0 0 0 0 0 1 1 0 0 0 0
    0 0 0 0 1 1 0 0 0 0 0 0 0 0 1 1 0 0 0 0
    0 0 0 0 1 1 0 0 0 0 0 0 0 0 1 1 0 0 0 0
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    ];

%% B letter map
B = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0
    0 0 0 0 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0
    0 0 0 0 1 1 0 0 0 0 0 0 0 1 1 0 0 0 0 0
    0 0 0 0 1 1 0 0 0 0 0 0 0 1 1 0 0 0 0 0
    0 0 0 0 1 1 0 0 0 0 0 0 0 1 1 0 0 0 0 0
    0 0 0 0 1 1 0 0 0 0 0 0 0 1 1 0 0 0 0 0
    0 0 0 0 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0
    0 0 0 0 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0
    0 0 0 0 1 1 0 0 0 0 0 0 0 1 1 0 0 0 0 0
    0 0 0 0 1 1 0 0 0 0 0 0 0 1 1 0 0 0 0 0
    0 0 0 0 1 1 0 0 0 0 0 0 0 1 1 0 0 0 0 0
    0 0 0 0 1 1 0 0 0 0 0 0 0 1 1 0 0 0 0 0
    0 0 0 0 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0
    0 0 0 0 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    ];

%% C letter map
C = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 1 1 1 1 1 1 1 0 0 0 0 0 0 0
    0 0 0 0 0 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0
    0 0 0 0 1 1 0 0 0 0 0 0 0 1 1 0 0 0 0 0
    0 0 0 1 1 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0
    0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 1 1 0 0 0 0 0 0 0 1 1 0 0 0 0 0
    0 0 0 0 0 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0
    0 0 0 0 0 0 1 1 1 1 1 1 1 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    ];