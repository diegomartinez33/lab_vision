% Ejercicio de imagenes hibridas
clear all; close all;
%% Lectura de imagenes
unzip('https://www.dropbox.com/sh/dz2zsros2f7dh2n/AAA41dlfSq5RVKMwcJl6PNKga?dl=1');

dr1=fullfile(cd,'mascara.jpg');
dr2=fullfile(cd,'otra_cara.jpg');


img1=imread(dr1);
img2=imread(dr2);

%%
img2=imresize(img2,[size(img1,1) size(img1,2)]);

%% Filtering
lowFc=1/30;%Frecuencia de corte baja
highFc=1/100;%Frecuencia de corte alta

%relación entre la frecuencia de corte y la varianza del filtro gaussiano
%wikipedia/Gaussian filter
sigmalow=1/(2*pi*lowFc);
sigmahigh=1/(2*pi*highFc);

%Filtrado gaussiano
%Ventana definida como una aproximación de la ventana usada por la función
%imgaussfilt()
lowKernel=fspecial('gaussian',[4*ceil(sigmalow) 4*ceil(sigmalow)], sigmalow);
highKernel=fspecial('gaussian',[4*ceil(sigmahigh) 4*ceil(sigmahigh)], sigmahigh);

img1f=imfilter(img1,lowKernel)+4;%Filtro pasa bajas
img2f=img2-imfilter(img2,highKernel)+4;%Filtro pasa altas

img1f=uint8(img1f);
img2f=uint8(img2f);

X=img1f+img2f;%Hybrid image
imwrite(X,'hybrid_mascara_cara.jpg');

imshow(X);
set(gcf, 'Position', get(0,'Screensize'));