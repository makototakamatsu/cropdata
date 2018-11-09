clear all;
%�E���Ɏʐ^���z�u�����(�[�x�摜)
file_name = uigetfile('*');
IMG = imread(file_name);
%�o�C���e�����t�B���^
patch = imcrop(IMG,[50, 50, 50 50]);
imshow(patch);
patchVar = std2(patch)^2;
DoS = 2*patchVar;
IMG = imbilatfilt(IMG,DoS);
imshow(IMG);
IMG = imbilatfilt(IMG,DoS,2);
imshow(IMG);
IMG = imresize(IMG,[256 256]);
IMG(:,:,1) = imadjust(IMG(:,:,1));
IMG(:,:,2) = imadjust(IMG(:,:,1));
IMG(:,:,3) = imadjust(IMG(:,:,1));
%�q�X�g�O����
IMG = histeq(IMG);
imagesc(IMG); colorbar; axis image;

IMG0 = IMG;
%�����Ɏʐ^���z�u�����(RGB�摜)
file_name = uigetfile('*');
IMG = imread(file_name);
IMG = imresize(IMG,[256 256]);
IMG(:,:,1) = imadjust(IMG(:,:,1));
IMG(:,:,2) = imadjust(IMG(:,:,1));
IMG(:,:,3) = imadjust(IMG(:,:,1));
imagesc(IMG); colorbar; axis image;


IMG = [IMG IMG0];

imwrite(IMG,'result.png');
imagesc(IMG); colorbar; axis image;