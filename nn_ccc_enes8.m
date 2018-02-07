%% close all, clear all, clc
close all, clear all, clc

%% MULTÝPLE READ FOR IMAGES

Input_folder = 'C:\Users\enesk\Desktop\w-s\nn-matlab\50piksel\yatay'; % folder with big images
Input_folder_h = 'C:\Users\enesk\Desktop\w-s\nn-matlab\50piksel\dikey'; % folder with big images
test_folder = 'C:\Users\enesk\Desktop\w-s\nn-matlab\50piksel\test'; % folder with big images



files_h = dir(fullfile(Input_folder_h));
files_v = dir(fullfile(Input_folder));
files_t= dir(fullfile(test_folder));


for  i=3:17

Picture_horizantal{i-2}=imread(char(join( (Input_folder)+"\"+files_v(i).name ) ) );
Picture_vertical{i-2}=  imread(char(join( (Input_folder_h)+"\"+files_h(i).name ) ) );

end


figure('Name','Yatay Veri Seti')
for i = 1:15
    subplot(3,5,i);grid on 
    imshow(Picture_horizantal{i});title(i);
        
end



% figure('Name','Dikey Veri Seti')
% for i = 1:15
%     subplot(3,5,i);grid on 
%     imshow(Picture_horizantal{i});title(i);  
%     hold on    
% end
%  end

%% %%Creating raw x y coordinates 

for i=1:15 
 I =cell2mat(Picture_horizantal(i))  ;
 
[ r , n ]=row_and_col_avarage_of_img(I,50,50);
row_avarage_array_horizantal{i}=r;
row_avarage_array_vertical{i}=n;
 
 
 I2 =cell2mat(Picture_vertical(i))  ;
 [ r2 , n2 ]=row_and_col_avarage_of_img(I2,50,50);
  col_avarage_array_horizantal{i}= r2;
  col_avarage_array_vertical{i}= n2;

 
 
end



%% Downsample and Merge 

   
   for i=1:15
       vc=row_avarage_array_horizantal{i};
       rc=row_avarage_array_vertical{i};
       cc= col_avarage_array_horizantal{i};
       nc= col_avarage_array_vertical{i};
   
        downsampled_row_avr_horizantal{i}=vc(1:2:50);
        downsampled_row_avr_vertical{i}=rc(1:2:50);
        downsampled_col_avr_horizantal{i}=cc(1:2:50);
        downsampled_col_avr_vertical{i}=nc(1:2:50);

    end


horizantal_pic_data=zeros(50,15);
for jack=1:15 
R = {[downsampled_row_avr_horizantal{jack}, downsampled_col_avr_horizantal{jack}]};
R=cell2mat(R);
R=R';
horizantal_pic_data(:, jack)=R;


end

vertical_pic_data=zeros(50,15);
for jack=1:15 
R = {[downsampled_row_avr_vertical{jack}, downsampled_col_avr_vertical{jack}]};
R=cell2mat(R);
R=R';
vertical_pic_data(:, jack)=R;


end

 all_data_here=[vertical_pic_data  horizantal_pic_data ] ;



%train_target=ones(1,15);

train_target=[ 0 0 0 0 0  0 0 0 0 0   0 0 0 0 0  1 1 1 1 1  1 1 1 1 1  1 1 1 1 1 ] ;


%nnd12sd1
%% mlp manuel 

mlp=feedforwardnet([20 10]);
mlp.layers{1}.transferFcn='tansig';
mlp.layers{2}.transferFcn='tansig';
mlp.layers{3}.transferFcn='logsig';

mlp.trainFcn='traingd';
mlp.performFcn='mse';
mlp.trainParam.min_grad= 1e-10 ;
mlp.trainParam.showWindow=true;
mlp.trainParam.epochs=100000;
mlp.trainParam.time=inf;
mlp.trainParam.goal=0;

als=mlp.layerWeights
  mlp = train(mlp,all_data_here,train_target);
  
 % mlp = train(mlp,50,2,);
%mlp=train(mlp,dataset(:,1:numberOfFeatures)' ,targets)

%% Imort new data to try  network  !! 

test_picture=imread(char(join( (test_folder)+"\"+files_t(3).name ) ) );
test_picture2=imread(char(join( (test_folder)+"\"+files_t(4).name ) ) );
test_picture3=imread(char(join( (test_folder)+"\"+files_t(5).name ) ) );
test_picture4=imread(char(join( (test_folder)+"\"+files_t(6).name ) ) );


 
test_pic_data= make_a_test_sample(test_picture)  ;
test_pic_data2= make_a_test_sample(test_picture2);
test_pic_data3= make_a_test_sample(test_picture3);
test_pic_data4= make_a_test_sample(test_picture4);



  
%% Test it here



 print_result( mlp(test_pic_data) )
 print_result( mlp(test_pic_data2) )
 print_result( mlp(test_pic_data3) )
 print_result( mlp(test_pic_data4) )










