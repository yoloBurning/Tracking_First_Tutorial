%% Input
im = double(imread('lena.gif'));
mask = ones(3)/9; % only odd number!
% border = 1 : mirror;
% border = 2 : clamp; 
im_new_mirror  = convIm(im,mask,1);
im_new_clamp  = convIm(im,mask,2);

%% Plot Exercise 1
figure;
imshow([uint8(im),uint8(im_new_mirror), uint8(im_new_clamp)]);
title('Exercise 1. Right: Original image; Middle: mirror border; Left: clamp border');

%% Exercise 2
% Question a): 2D-Gaussian-filter
sigma1 = 1.0;
sigma2 = 3.0;

G1 = get2dGaussian(sigma1);
fprintf('2D-convolution sigma = 1?computation time is:')
tic
im_g1 =convIm(im,G1,2);
toc
fprintf('2D-convolution sigma = 3?computation time is:')
G2 = get2dGaussian(sigma2);
tic
im_g2 = convIm(im,G2,2);
toc
figure;
imshow([uint8(im),uint8(im_g1),uint8(im_g2)]);
title('Exercise 2a. Right: original image; Middle: smoothed,2D,sigma = 1.0; Left: smoothed,2D,sigma = 3.0;');

% Question b) & c): 1D-Gaussian-filter, computation speed, diff

% sigma = 1.0
Gh1 = Hor_Gaussian(sigma1);
Gv1 = Ver_Gaussian(sigma1);
fprintf('2 1D-convolution sigma = 1?computation time is:')
tic
G_1d1 = convIm(im,Gh1,2);
im_g1d1 =convIm(G_1d1,Gv1,2);
toc

diff1 = sum(sum(im_g1.^2)) - sum(sum(im_g1d1.^2));


%sigma = 3.0
Gh2 = Hor_Gaussian(sigma2);
Gv2 = Ver_Gaussian(sigma2);
fprintf('2 1D-convolution sigma = 3?computation time is:')
tic
G_1d2 = convIm(im,Gh2,2);
im_g1d2 =convIm(G_1d2,Gv2,2);
toc

diff2 = sum(sum(im_g2.^2)) - sum(sum(im_g1d2.^2));
fprintf('For sigma = 1.0, diff = %.22e \n',diff1);
fprintf('For sigma = 3.0, diff = %.22e',diff2);

figure;
imshow([uint8(im),uint8(im_g1d1),uint8(im_g1d2)]);
title('Exercise 2b. Right: original image; Middle: smoothed,1D,sigma = 1.0; Left: smoothed,1D,sigma = 3.0;');

%% Exercise 3
% Question a): compute gradients
Dx = [-1,0,1;-1,0,1;-1,0,1];
Dy = [-1,-1,-1;0,0,0;1,1,1];
gradX = convIm(im,Dx,2);
gradY = convIm(im,Dy,2);
figure;
imshow([uint8(im),gradX, gradY]);
title('Exercise 3a. Right: original image; Middle: Gradient in X; Left: Gradient in Y;');

% Question b): compute gradient magnitudes and orientations
magnitude= sqrt(gradX.^2 + gradY.^2);
orientation = atan(gradY./gradX).*360;
figure;
imshow([uint8(im),magnitude,orientation]);
title('Exercise 3b. Right: original image; Middle: magnitude; Left:orientation;');
%%
% Question c): associativity law, sigma = 3.0
DGx = convIm(G2,Dx,2);
DGy = convIm(G2,Dy,2);
Ix = convIm(im,DGx,2);
Iy = convIm(im,DGy,2);
figure;
imshow([Ix,Iy]);
title('Exercise 3c. Right: smoothed Gradient in X; Left: smoothed Gradient in Y;');