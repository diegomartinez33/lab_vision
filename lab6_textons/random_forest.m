%%Lab Textones
%% Entrenamiento de clasificador (Random Forest)
addpath('lib');
clear all;close all;clc;

%Cargar descriptores
load('TXT.mat');
% numero de textones en diccionarios
k=size(TXTfinal(1).textons,1);
%% histograma de descriptores

%Nuevo campo 'hists' en la estructura TXTfinal 
TXTfinal().hists=[];

%pasa los mapas de textones a histogramas
for i=1:size(TXTfinal,2)
    tmap=TXTfinal(i).map;
    TXTfinal(i).hists=histc(tmap(:),1:k);
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
TXTfinal().labels=[];

%guardado de etiquetas en la estructura TXTfinal 
for j=1:size(TXTfinal,2)
    for l=1:size(etiquetas,1)
        categoria=char(textscan(TXTfinal(j).name,'%3c'));
        categoria=categoria(1,:);
        if strcmp(categoria,char(etiquetas{l,1}))==1
            TXTfinal(j).labels=char(etiquetas{l,2});
            break;
        end
    end
end
%% Clasificador

%Organiza histogramas y etiquetas para meter a TreeBagger
for i=1:size(TXTfinal,2)
    descriptors(i,:)=TXTfinal(i).hists';
    labels{i,:}=TXTfinal(i).labels;
end

%Estructura con bosques con diferente numero de arboles
Forests=struct('numtrees',[],'TreeBagger',[]);

%Creación de bosques con diferente numero de arboles
num=10;
while num <= 100
    Forests(num/10).numtrees=num;
    Forests(num/10).TreeBagger=TreeBagger(num,descriptors,labels,...
        'Method','classification');
    num=num+10;
end

%% Test

%Organiza histogramas y etiquetas para meter a TreeBagger
for i=1:size(TXTtest,2)
    descripTest(i,:)=TXTtest(i).hists';
    labelsTest{i,:}=TXTtest(i).labels;
end
