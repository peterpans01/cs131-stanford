%Authors: hung.nguyen@inria.fr

%% read a image, convert it to grayscale image and convert to double type array.
img = double(rgb2gray(imread('flower.bmp')));

%===============================================================================
%part a

%% compute svd of matrix
%svd_vector = svd(img);
%disp(size(svd_vector));

%% get top 10 values
%[sortedX,sortingIndices] = sort(k,'descend');
%top10 = sortedX(1:10)

%% plot the singular values and their rankings
%figure;                      % Open new figure
%rankings = 1 : size(svd_vector, 1);          % 1x49 row vec
%plot(rankings, svd_vector);
%xlabel('rankings');           % Assign label for x-axis
%ylabel('singular value');         % Assign label for y-axis
%title('Relations between singular value and their rankings');           % Assign plot title

%===============================================================================
%% part b

%show the original image
%imshow(uint8(img));

%compute svd form image
[u,s,v] = svd(img);
%constructed_image = u*s*v';
%figure;
%imshow(uint8(img));
disp(size(u));
disp(size(v));
disp(size(img));


%===============================================================================

%convert diagonal matrix into vector 
%vector_diag = diag(s);

%try to convert back the original image with different top k values
% for k = 10 -> so bad quailty
% for k = 50 -> still bad
% for k = 100 -> acceptable
for k = [10 50 100]
    %new_s = diag([vector_diag(1:k,:) ; zeros(size(s,2)-k, 1)]) ;
    new_image = u(:,1:k)*new_s(1:k,1:k)*v(:,1:k)';
    figure;
    imshow(uint8(new_image));
end

