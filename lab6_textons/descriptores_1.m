%%Lab Textones
%% Diccionario de textones para cada imagen
addpath('lib');
clear all;close all;clc;

% create filter bank
[fb] = fbCreate;
% numero de textones en diccionario
k = 50;
%Carpeta de base de datos de entrenamiento
dirtrain = dir(fullfile(cd,'textures','train','*.jpg'));

%lecura de imágenes
TXT=struct('name',[],'image',[],'map',[],'textons',[]);

cont=1;
for i=1:13
    for j=1:4
        TXT(cont).image = imread(fullfile(cd,'textures','train',...
            dirtrain(j+(30*i)).name));
        TXT(cont).name = dirtrain(j+(30*i)).name;
        % diccionario de textones
        im=TXT(cont).image;
        [map,textons] = computeTextons(fbRun(fb,im),k);
        TXT(cont).map=map;
        TXT(cont).textons=textons;
        cont=cont+1;
        cont
    end
end
