clc;
% comment it out to run RESIZEBL
imshow(RESIZENN(imread('chrome.jpg')));
% comment it out to run RESIZENN
% imshow(RESIZEBL(imread('chrome.jpg')));

function newMat = RESIZENN(A)
    X=5;
    oldSize = size(A);
    newSize = oldSize.*X;
    newSize = newSize(1:2);
%     disp(oldSize);
%     disp(newSize);
    ri = ((1:newSize(1)))/X;
    ci = ((1:newSize(2)))/X;
    rowIndex = ceil(ri);
    colIndex = ceil(ci);
    newMat = A(rowIndex,colIndex,:);
end

% b)

function [out] = RESIZEBL(im)
    X=2;
    %// Get some necessary variables first
    in_rows = size(im,1);
    in_cols = size(im,2);
    out_rows = X*in_rows;
    out_cols = X*in_cols;

    %// Let S_R = R / R'
%     S_R = in_rows / out_rows;
    %// Let S_C = C / C'
%     S_C = in_cols / out_cols;

    %// Define grid of co-ordinates in our image
    %// Generate (x,y) pairs for each point in our image
    [cf, rf] = meshgrid(1 : out_cols, 1 : out_rows);

    %// Let r_f = r'*S_R for r = 1,...,R'
    %// Let c_f = c'*S_C for c = 1,...,C'
    rf = rf/X;
    cf = cf/X;

    %// Let r = floor(rf) and c = floor(cf)
    r = floor(rf);   
    c = floor(cf);

    %// Any values out of range, cap
    r(r < 1) = 1;
    c(c < 1) = 1;
    r(r > in_rows - 1) = in_rows - 1;
    c(c > in_cols - 1) = in_cols - 1;

    %// Let delta_R = rf - r and delta_C = cf - c
    delta_R = rf - r;
    delta_C = cf - c;

    %// Final line of algorithm
    %// Get column major indices for each point we wish
    %// to access
    in1_ind = sub2ind([in_rows, in_cols], r, c);
    in2_ind = sub2ind([in_rows, in_cols], r+1,c);
    in3_ind = sub2ind([in_rows, in_cols], r, c+1);
    in4_ind = sub2ind([in_rows, in_cols], r+1, c+1);

    %// Now interpolate
    %// Go through each channel for the case of colour
    %// Create output image that is the same class as input
    out = zeros(out_rows, out_cols, size(im, 3));
    out = cast(out, class(im));

    for idx = 1 : size(im, 3)
        chan = double(im(:,:,idx)); %// Get i'th channel
        %// Interpolate the channel
        tmp = chan(in1_ind).*(1 - delta_R).*(1 - delta_C) + ...
            chan(in2_ind).*(delta_R).*(1 - delta_C) + ...
            chan(in3_ind).*(1 - delta_R).*(delta_C) + ...
            chan(in4_ind).*(delta_R).*(delta_C);
        out(:,:,idx) = cast(tmp, class(im));
    end
end