function [] = q6(fileName)
[y, Fs] = audioread(fileName);
fftY = fft(y);
fftY = fftY(1: size(y, 1)/2);

allPermutations = perms(1: 4);
allPermutations = repelem(allPermutations, 1, size(y, 1)/8) * size(y, 1);
allPermutations = (allPermutations - size(y, 1))/8;

allPermutations = allPermutations + repmat((1: size(y, 1)/8), 24, 4);

allPermutationsY = fftY(allPermutations);

minV = 9999999;
soln = 0;

for place = 1:24
    temp = [allPermutationsY(place, :).'; (fliplr(allPermutationsY(place, :))')];
    temp = ifft(temp);
    differ = sum(abs(diff(temp)));
    if (differ < minV)
        minV = differ;
        soln = place;
    end
end
temp = [allPermutationsY(soln, :).'; (fliplr(allPermutationsY(soln, :))')];
temp = real(ifft(temp));
sound(temp,Fs);
disp(soln);
end