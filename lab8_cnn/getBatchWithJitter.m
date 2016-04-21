function [im, labels] = getBatchWithJitter(imdb, batch)

im = imdb.images.data(:,:,batch) ;
labels = imdb.images.label(1,batch) ;

n = numel(batch) ;
train = find(imdb.images.set == 1) ;

sel = randperm(numel(train), n) ;
im1 = imdb.images.data(:,:,sel) ;

sel = randperm(numel(train), n) ;
im2 = imdb.images.data(:,:,sel) ;

ctx = [im1 im2] ;
ctx(:,64:191,:) = min(ctx(:,64:191,:), im) ;
dx = randi(11) - 6 ;
im = ctx(:,(64:191)+dx,:) ;
sx = (64:191) + dx ;

dy = randi(5) - 2 ;
sy = max(1, min(128, (1:128) + dy)) ;

im = ctx(sy,sx,:) ;

im = 256 * reshape(im, 128, 128, 1, []) ;
