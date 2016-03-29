%%Lab Textones
%% Diccionario de textones para cada imagen de test
addpath('lib');
clear all;close all;clc;

% create filter bank
[fb] = fbCreate;
% numero de textones en diccionario
k = 50;
%Carpeta de base de datos de entrenamiento
dirtest = dir(fullfile(cd,'textures','test','*.jpg'));

%lecura de imágenes
TXTtest=struct('name',[],'image',[],'map',[],'textons',[]);


for i=1:250
    TXTtest(i).image = imread(fullfile(cd,'textures','test',...
        dirtest(i).name));
    TXTtest(i).name = dirtest(i).name;
    % diccionario de textones
    im=TXTtest(i).image;
    [map,textons] = computeTextons(fbRun(fb,im),k);
    TXTtest(i).map=map;
    TXTtest(i).textons=textons;
    cont=i;
    cont
end
save('TXTtest_1.mat','TXTtest');
%% histograma de descriptores

%Nuevo campo 'hists' en la estructura TXTfinal 
TXTtest().hists=[];

%pasa los mapas de textones a histogramas
for i=1:size(TXTtest,2)
    tmap=TXTtest(i).map;
    TXTtest(i).hists=histc(tmap(:),1:k);
end

%% Lectura de etiquetas
% Lectura de archvo que contiene ls etiquetas
file=fopen(fullfile(cd,'textures','names.txt'));
et=textscan(file,'%s');
file=fclose(file);

%etiquetas:25x2 cell que contiene categorias('T_01') y etiquetas de cada 
%categoria('bark1') 
cont=1;
for i=1:length(et{1,1});
    if mod(i,2)==0
        etiquetas{cont,2}=et{1,1}(i);
        cont=cont+1;
    else
        etiquetas{cont,1}=et{1,1}(i);
    end
end

%Nuevo campo 'labels' en la estructura TXTfinal 
TXTtest().labels=[];

%guardado de etiquetas en la estructura TXTfinal 
for j=1:size(TXTtest,2)
    for l=1:size(etiquetas,1)
        categoria=char(textscan(TXTtest(j).name,'%3c'));
        categoria=categoria(1,:);
        if strcmp(categoria,char(etiquetas{l,1}))==1
            TXTtest(j).labels=char(etiquetas{l,2});
            break;
        end
    end
end

save('TXTtest.mat','TXTtest');