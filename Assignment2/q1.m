m = imread('cameraman.tif');
x = im2double(m);
for k=0:size(x,1)-1 %Row wise FFT%
    y=x(k+1,:);
    z1 = fft_rec(y);
    x(k+1,:)=z1;
end
for p=0:size(x,2)-1 %Column wise FFT%
    y(1,:)=x(:,p+1);
    z2=fft_rec(y);
    x(:,p+1)=z2;
end
image(abs(x));
image(abs(fft2(im2double(imread('cameraman.tif')))));

function y = fft_rec(x)
n = length(x);
if n == 1
    y = x;
else
    m = n/2;
    d = exp(-2 * pi * 1i / n) .^ (0:m-1);
    z = d .* fft_rec(x(2:2:n));
    z3 = fft_rec(x(1:2:(n-1))) + z;
    z4 = z3 - (2*z);
    y = [ z3 , z4 ];
end
end