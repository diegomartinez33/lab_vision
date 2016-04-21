function Martinez_Torres_TrainningTextures(varargin)
%Probando terminos para hacer la red neuronal

setup ;

%Cargar dataset
imdb = load('textonsdb2.mat') ;

%Cambiar a single
imdb.images.data=im2single(imdb.images.data);

%Cargar Red Neuronal convolucional
net = initializeTexturesCNN() ;
% net = initializeTexturesCNN_2() ;

%Entrenamiento y Validadación
trainOpts.batchSize = 100 ;
trainOpts.numEpochs = 10 ;
trainOpts.continue = true ;
trainOpts.useGpu = false ;
trainOpts.learningRate = 0.001 ;
trainOpts.expDir = 'data/textons-experiment' ;
trainOpts = vl_argparse(trainOpts, varargin);

%Promedio de las imagenes en las filas
imageMean = mean(imdb.images.data(:)) ;
imdb.images.data = imdb.images.data - imageMean ;

% Convertir a GPU si se necesita
if trainOpts.useGpu
  imdb.images.data = gpuArray(imdb.images.data) ;
end

% Entrenamiento con funcion de matconvnet y funcion de muestreo con
% jittering
[net,info] = cnn_train(net, imdb, @getBatchWithJitter, trainOpts) ;

% Mueve la Red del GPU al CPU si es el caso
if trainOpts.useGpu
  net = vl_simplenn_move(net, 'cpu') ;
end

% Guarda resultados de CNN
net.layers(end) = [] ;
net.imageMean = imageMean ;
save('data/pruebas1/textonscnn1.mat', '-struct', 'net') ;
