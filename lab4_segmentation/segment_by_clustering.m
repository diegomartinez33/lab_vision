function my_segmentation = segment_by_clustering( rgb_image, feature_space, clustering_method, number_of_clusters)
%SEGMENT_BY_CLUSTERING: 
%   Realiza la clusterización de una imagen en RGB
%   ingresado como parametro. Opciones:
%   -rgb_image:          Imagen en el espacio de color RGB
%   -feature_space:      Espacio de color sobre el cual se quiere hacer la
%                        clusterizacion. Pueder ser:
%                        'rgb' - Espacio de color RGB
%                        'hsv' - Espacio de color HSV
%                        'lab' - Espacio de color LAB
%                        'rgb+xy' - Espacio de color RGB teniendo en cuenta
%                                  posiciones en X y Y
%                        'hsv+xy' - Espacio de color HSV teniendo en cuenta
%                                  posiciones en X y Y
%                        'lab+xy' - Espacio de color LAB teniendo en cuenta
%                                  posiciones en X y Y
%   -clustering_method:  Metodo de clusterización. Puede ser:
%                        'kmeans' - clusterización por K-centroides
%                        'gmm' - clusterización por mezcla de gaussianas
%                        'watershed' - clusterización jerarquica por lineas
%                                     divisorias de agua
%   -number_of_clusters: Numero de clusters que se desean obtener. Si se
%                        escoge el metodo de clusterización jerarquica es 
%                        necesario ingresar en este parametro el valor de 
%                        h-minimo que se desea imponer a la clusterización 
%                        por watershed.
if nargin < 4
    number_of_clusters=3;
elseif nargin < 3
    number_of_clusters=3;
    clustering_method='kmeans';
elseif nargin < 2
    number_of_clusters=3;
    feature_space = 'rgb';
    clustering_method='kmeans';
elseif nargin < 1
    error('No hay suficientes parametros');
end

sizewin=5;%Tamaño de la ventana
window=sizewin*[1,1];%Ventana
num=number_of_clusters;%numero de clusters
%valor de h-minimos si se realiza un metodo de clusterización jerargico
h=number_of_clusters;

Im=im2double(rgb_image);%Imagen de entrada a double

%Filas y columnas de la imagen de entrada
rows=size(Im,1);
cols=size(Im,2);

%Reconocimiento de espacio de color como parametro
if strcmp(feature_space,'rgb') == 1
elseif strcmp(feature_space,'lab') == 1
    Im=rgb2lab(Im);
elseif strcmp(feature_space,'hsv') == 1
    Im=rgb2hsv(Im);
elseif strcmp(feature_space,'rgb+xy') == 1
    rgbIm=Im;
    Im(:,:,1)=rgbIm(:,:,1);
    Im(:,:,2)=rgbIm(:,:,2);
    Im(:,:,3)=rgbIm(:,:,3);   
    for i=1:rows
        for j=1:cols
            Im(i,j,4)=j;
            Im(i,j,5)=i;
        end
    end
    
elseif strcmp(feature_space,'lab+xy') == 1
    Im=rgb2lab(Im);
    labIm=Im;
    Im=zeros(rows,cols,5);
    Im(:,:,1)=labIm(:,:,1);
    Im(:,:,2)=labIm(:,:,2);
    Im(:,:,3)=labIm(:,:,3);
    for i=1:rows
        for j=1:cols
            Im(i,j,4)=j;
            Im(i,j,5)=i;
        end
    end 
elseif strcmp(feature_space,'hsv+xy') == 1
    Im=rgb2hsv(Im);
    hsvIm=Im;
    Im=zeros(rows,cols,5);
    Im(:,:,1)=hsvIm(:,:,1);
    Im(:,:,2)=hsvIm(:,:,2);
    Im(:,:,3)=hsvIm(:,:,3);
    for i=1:rows
        for j=1:cols
            Im(i,j,4)=j;
            Im(i,j,5)=i;
        end
    end 
end

%Reconocimiento de metodo de clusterización como parametro
%K-means
if strcmp(clustering_method,'kmeans')
    %Extracción de intensidades de cada canal
    l=0;
    for i=1:rows
        for j=1:cols
            l=l+1;
            X(l,:)=Im(i,j,:);
        end
    end
    
    %Etiquetas de Clusterización K-means
    idx=kmeans(X,num);
    
    %Reconstrucción de imagen con etiquetas
    idxpos=1;
    for i=1:rows
        for j=1:cols
            segs(i,j)=idx(idxpos);
            idxpos=idxpos+1;
        end
    end
    image(segs)
    colormap colorcube
elseif strcmp(clustering_method,'gmm')
    %Extracción de intensidades de cada canal
    l=0;
    for i=1:rows
        for j=1:cols
            l=l+1;
            X(l,:)=Im(i,j,:);
        end
    end
    
    %mezcla de gaussianas
    obj=fitgmdist(X,num);
    %Etiquetas determinadas por la mezcla de gaussianas
    idx=cluster(obj,X);
    %Reconstrucción de imagen con etiquetas
    idxpos=1;
    for i=1:rows
        for j=1:cols
            segs(i,j)=idx(idxpos);
            idxpos=idxpos+1;
        end
    end
    image(segs)
    colormap colorcube
    
elseif strcmp(clustering_method,'watershed')
    %Imagen de entrada a escala de grises
    Im=rgb2gray(Im);
    %gradiente
    hy= fspecial('sobel');
    hx= hy';
    Iy= imfilter(Im, hy, 'replicate');
    Ix = imfilter(Im, hx, 'replicate');
    grad = sqrt(Ix.^2 + Iy.^2);
    % watersheds
    ws= watershed(grad);
    figure(1);
    marker = imextendedmin(grad, h);
    new_grad= imimposemin(grad, marker);
    ws= watershed(new_grad);
    segs=label2rgb(ws);
    imshow(segs);
end

%Output de la funcion
my_segmentation=segs;
end
