load('trainedWeight-0.01.mat');

X = processingImage('testData/0.bmp');
X = [X;processingImage('testData/1.bmp')];
X = [X;processingImage('testData/2.bmp')];
X = [X;processingImage('testData/3.bmp')];
X = [X;processingImage('testData/4.bmp')];
X = [X;processingImage('testData/5.bmp')];
X = [X;processingImage('testData/6.bmp')];
X = [X;processingImage('testData/7.bmp')];
X = [X;processingImage('testData/8.bmp')];
X = [X;processingImage('testData/9.bmp')];
y = predict(Theta1,Theta2,X);
y
