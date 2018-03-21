load q2/q2.mat
% sound(X,Fs);
Y = fft(X);
clear X;
[hijk, sortedInds] = sort(Y(:),'descend');
top4=sortedInds(1:4);
Y1 = zeros(1, size(Y,1));
i = 1:1:4;
j = -5:1:5;
Y1(top4(i)+j) = Y(top4(i)+j);
y_filtered = ifft(Y1);
audiowrite('q2/result.wav',y_filtered ,Fs);
plot(y_filtered);
sound(y_filtered, Fs);