clc;
filter = [1,2,1;0,0,0;-1,-2,-1];
im = imread('sample_inp.png');
finalim = zeros(size(im,1)+2,size(im,2)+2,size(im,3));
finalim(:,:,1) = conv2(im(:,:,1),filter);
finalim(:,:,2) = conv2(im(:,:,2),filter);
finalim(:,:,3) = conv2(im(:,:,3),filter);
imshow(finalim);

% a)
filter = [1,2,1;0,0,0;-1,-2,-1];
im = imread('blur.jpg');
finalim = zeros(size(im,1)+2,size(im,2)+2,size(im,3));
finalim(:,:,1) = conv2(im(:,:,1),filter);
finalim(:,:,2) = conv2(im(:,:,2),filter);
finalim(:,:,3) = conv2(im(:,:,3),filter);
imshow(finalim);

% b)
im = imread('blur.jpg');
filter = [1,2,1;0,0,0;-1,-2,-1];
finalim = zeros(size(im,1)+2,size(im,2)+2,size(im,3));
finalim(:,:,1) = conv2(im(:,:,1),filter.');
finalim(:,:,2) = conv2(im(:,:,2),filter.');
finalim(:,:,3) = conv2(im(:,:,3),filter.');
imshow(finalim);

% c)
im = imread('blur.jpg');
filter = [1,2,1;0,0,0;-1,-2,-1];
finalim = zeros(size(im,1)+2,size(im,2)+2,size(im,3));
finalim(:,:,1) = conv2(im(:,:,1),filter)+conv2(im(:,:,1),filter.');
finalim(:,:,2) = conv2(im(:,:,2),filter)+conv2(im(:,:,2),filter.');
finalim(:,:,3) = conv2(im(:,:,3),filter)+conv2(im(:,:,3),filter.');
imshow(finalim);

% d)
% Using following 3 images:vegeta.jpg,Pikachu.jpg,a18.jpg