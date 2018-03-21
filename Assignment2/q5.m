function [ number ] = q5( filename)

top4 = zeros(10,4);
sortedInds = zeros(44100, 1);

Y = fft(audioread('q5/0.ogg'));
top4 = find_top4(Y, top4, 1);

Y = fft(audioread('q5/1.ogg'));
top4 = find_top4(Y, top4, 2);
    
Y = fft(audioread('q5/2.ogg'));
top4 = find_top4(Y, top4, 3);

Y = fft(audioread('q5/3.ogg'));
top4 = find_top4(Y, top4, 4);

Y = fft(audioread('q5/4.ogg'));
top4 = find_top4(Y, top4, 5);

Y = fft(audioread('q5/5.ogg'));
top4 = find_top4(Y, top4, 6);

Y = fft(audioread('q5/6.ogg'));
top4 = find_top4(Y, top4, 7);

Y = fft(audioread('q5/7.ogg'));
top4 = find_top4(Y, top4, 8);

Y = fft(audioread('q5/8.ogg'));
top4 = find_top4(Y, top4, 9);

Y = fft(audioread('q5/9.ogg'));
top4 = find_top4(Y, top4, 10);

disp(top4);
number = uint64(0);

audinfo = audioinfo(filename);

z2 = 0;
for i=1:(audinfo.TotalSamples/audinfo.SampleRate)
    min = 9999999;
    digit = -1;
    z1 = (i)*audinfo.SampleRate;
%     window = audioread(filename,[z2+1,z1]);
    Y = fft(audioread(filename,[z2+1,z1]));
    [~, sortedInds] = sort(Y(:),'descend');
    top4c = sortedInds(1:4);
%     top4c = top4c.';
    top4c = sort(top4c.');
    for j=1:10
        if min > sum(abs(top4c-top4(j,:)))
            digit = j-1;
            min = sum(abs(top4c-top4(j,:)));
        end
    end
    number = number*10;
    number = number + digit;
    z2 = z1;
end
disp(number);
end

function top4 = find_top4(P, top4, k)
[~, sortedInds] = sort(P(:),'descend');
top4(k,:) = sortedInds(1:4);
top4(k,:) = sort(top4(k,:));
end