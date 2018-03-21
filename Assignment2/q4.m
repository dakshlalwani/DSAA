%% a) FFT of given images

im = rgb2gray(imread('q4/Img1a.png'));
% im = im2double(imread('q4/Img1b.png'));
% im = im2double(imread('q4/Img2a.png'));
% im = im2double(imread('q4/Img2b.png'));
output = fftshift(fft2(im));
figure;
imagesc(abs(output)), colormap gray;
colorbar;
figure;
imagesc(uint8(log(1+abs(output)))), colormap gray;
colorbar;

%% b) NOISE REMOVAL
clc;
im = im2double(imread('q4/Img3.png'));
figure;
imshow(im);
denoised = zeros(size(im,1),size(im,2),size(im,3));
disp(size(im,3));
denoised(:,:,1)=medfilt2(im(:,:,1),[3,3]);
denoised(:,:,2)=medfilt2(im(:,:,2),[3,3]);
denoised(:,:,3)=medfilt2(im(:,:,3),[3,3]);
figure;
imshow(denoised);
