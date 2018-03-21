load train.mat
window_len = 1000;
stride_len = 50;
start = 1;
i = 1;
z1 = start+window_len-1;
result = zeros(window_len/2,ceil(size(y,1)/stride_len));
while z1 <= size(y,1)
    c_window = y(start:min(z1, size(y,1)));
    fftx = fft(c_window);
    ffty = fftx(1:size(fftx)/2);
    z = size(ffty,1);
    result(1:z,i) = abs(ffty);
    start = start + stride_len;
    z1 = start+window_len-1;
    i = i + 1;
end
figure;
image(result);
colorbar;

y = audioread('q5/9.ogg');
window_len = 1000;
stride_len = 50;
start = 1;
i = 1;
z1 = start+window_len-1;
result = zeros(window_len/2,ceil(size(y,1)/stride_len));
while z1 <= size(y,1)
    c_window = y(start:min(z1, size(y,1)));
    fftx = fft(c_window);
    ffty = fftx(1:size(fftx)/2);
    z = size(ffty,1);
    result(1:z,i) = abs(ffty);
    start = start + stride_len;
    z1 = start+window_len-1;
    i = i + 1;
end
figure;
image(result);
colorbar;




