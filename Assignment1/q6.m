f1 = imread('F1.jpg');
faces = imread('Faces.jpg');
position = zeros(1,2);
mini = 10000;
for i = 1 : size(faces, 1) - size(f1, 1) + 1
    for j = 1 : size(faces, 2)- size(f1, 2) + 1
        x = (faces(i : i-1+size(f1,1), j : j-1+size(f1,2), 1:3));
        y = (f1);
        diff = sum(abs(x-y));
        for k = 1:2
            diff = sum(diff);
        end
        while(diff <= mini)
            mini = diff;
            position = [j,i];
            break
        end
    end
end
imshow(faces);
imrect(gca, [position,size(f1,2),size(f1,1)]);