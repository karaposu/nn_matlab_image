# nn_matlab_image
Matlab 2017 is used for this project

This code trains a Neural Network to identify digits (Digits are drawed from Microsoft Paint)
First step is to convert images to meaningful number matrixes.To do that we took a sample image (50x50 resolution)  and calculate row means and column means seperately.We have 50 (for vertical density ) + 50  (for horizantal density ) =100 data for sample.
We downsample this to 50 values. So in end 25 (for vertical density ) + 25  (for horizantal density ) =50 in total
We put them in one matrix so for one samle image we have 50x1 matrix. 
Application accepts 30 training images.For 30 sample picture data we will have 50x30 data. Which will be used to train Neural Network.

What you need to test it?

You need to draw 30 digit pictures from Paint.With format of .bmp
And resize them to 50x50. then you need to type your folder directory to the code. 
After the training you can put a new sample and see the pattern recognition result

have fun ... 
