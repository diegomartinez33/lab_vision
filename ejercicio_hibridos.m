% Ejercicio de imagenes hibridas
clear all; close all;
%% Lectura de imagenes
dr=fullfile(cd,'data');
dr1=fullfile(dr,'dog.bmp');
dr2=fullfile(dr,'cat.bmp');

img1=imread(dr1);
img2=imread(dr2);

%% Filtering
lowFc=1/30;
highFc=1/100;

sigmalow=1/(2*pi*lowFc);
sigmahigh=1/(2*pi*highFc);

lowKernel=fspecial('gaussian',[4*ceil(sigmalow) 4*ceil(sigmalow)], sigmalow);
highKernel=fspecial('gaussian',[4*ceil(sigmahigh) 4*ceil(sigmahigh)], sigmahigh);

img1f=imfilter(img1,lowKernel)+4;
img2f=img2-imfilter(img2,highKernel)+4;

% img1f=imgaussfilt(img1,5);
% img2f=img2-imgaussfilt(img2,3);

img1f=uint8(img1f);
img2f=uint8(img2f);


imshow(img2f);
set(gcf, 'Position', get(0,'Screensize'));
