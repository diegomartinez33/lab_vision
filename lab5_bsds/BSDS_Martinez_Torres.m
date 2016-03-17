% Initialization
clc, clear all, close all
%% Cleaning repeated directories
if(exist('data','dir')==1)
    rmdir('data','s')
end
%% Assigning name to directories.
Test = fullfile('BSR','BSDS500','data','images','test');
Test1 = fullfile('data','Test1');Test2 = fullfile('data','Test2');
mkdir(Test1),mkdir(Test2)
Test3 = fullfile('data','Test3');Test4 = fullfile('data','Test4');
mkdir(Test3);mkdir(Test4);
%% Ajusting Function Parameters.
feat = 'hsv+xy';feat2 = 'rgb';  method1 = 'k-means';method2 = 'gmm';
K = 5:9;
%% Reading and applying
RTe = dir(Test);
%First Combination: K-Means, HSV+XY and K = 5:9
for x = 3:length(RTe)-1
    im = imread(fullfile(Test,char(RTe(x).name)));
    for t = 1:5
   	segs{t} = segment_by_clustering(im,feat,method1,K(t));
    end
    nom = strrep(char(RTe(x).name),'.jpg','.mat');
    save(fullfile(Test1,nom),'segs');
    disp(strcat('Succesfully run function on image',{' '},nom))
end

%Second Combination: GMM, HSV+XY and K = 5:9
for x = 3:length(RTe)-1
    im = imread(fullfile(Test,char(RTe(x).name)));
    for t = 1:5
        segs{t} = segment_by_clustering(im,feat,method2,K(t));  
    end
    nom = strrep(char(RTe(x).name),'.jpg','.mat');
    save(fullfile(Test2,nom),'segs'); 
    disp(strcat('Succesfully run function on image',{' '},nom))
end

%Third Combinaton: K-Means, RGB and K = 5:9
for x = 3:length(RTe)-1
    im = imread(fullfile(Test,char(RTe(x).name)));
    for t = 1:5
        segs{t} = segment_by_clustering(im,feat2,method1,K(t));
    end
    nom = strrep(char(RTe(x).name),'.jpg','.mat');
    save(fullfile(Test3,nom),'segs');
    disp(strcat(' Succesfully run function on image',{' '},nom))
end

%Fourth Combination: GMM, RGB and K = 5:9
for x = 3:length(RTe)-1
    im = imread(fullfile(Test,char(RTe(x).name)));
    for t =1:5
        segs{t} = segment_by_clustering(im,feat2,method2,K(t));
    end
    nom = strrep(char(RTe(x).name),'.jpg','.mat');
    save(fullfile(Test4,nom),'segs');
    disp(strcat('Successfully run funcion on image',{' '},nom))
end
