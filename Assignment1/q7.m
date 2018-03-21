clc;
inp = [12, 20, 3, 10, 22, 19, 23, 16, 0, 21, 23, 16, 18];
out = [75, 52, 33, 97, 251, 211, 63, 65];

filterSize = size(inp,2) - size(out,2) + 1;

M = zeros(filterSize,filterSize);

for i = 1:filterSize
    for j = i:i+filterSize-1
        M(i,j-i+1) = inp(j);
    end
end
% disp(M);
Minv = inv(M);
OutputTranspose = (out(1:filterSize).');
filter = round((Minv*OutputTranspose));
filter = filter.';
filter = fliplr(filter);
disp(filter);
