A = imread('cameraman.tif');

avg3 = [-1,-2,-1;0,0,0;1,2,1];
avg3f = rot90(avg3);

B = padarray(A,[1 1]);
Output = zeros([size(A,1) size(A,2)]);

for i = 1:size(B,1)-2
    for j = 1:size(B,2)-2
%         convolution with M
        Temp = double(B(i:i+2,j:j+2)).*avg3;
%         convolution with transpose of M
%         Temp = double(B(i:i+2,j:j+2)).*avg3.';
        Output(i,j) = sum(Temp(:));
    end
end
% Output(:,:) = conv2(A(:,:),avg3);
imshow(Output);
