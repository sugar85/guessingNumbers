load('trainedWeight.mat');

X = processingImage('0.bmp');
X = [X;processingImage('1.bmp')];
X = [X;processingImage('2.bmp')];
X = [X;processingImage('3.bmp')];
X = [X;processingImage('4.bmp')];
X = [X;processingImage('5.bmp')];
X = [X;processingImage('6.bmp')];
X = [X;processingImage('7.bmp')];
X = [X;processingImage('8.bmp')];
X = [X;processingImage('9.bmp')];
y = predict(Theta1,Theta2,X);
y
