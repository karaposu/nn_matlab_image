function [test_pic_data] = make_a_test_sample(test_picture)
[row_avr , col_avr] =row_and_col_avarage_of_img(test_picture,50,50);

 downsampled_row_avr=zeros(25,1);  downsampled_col_avr=zeros(25,1);test_pic_data=zeros(50,1);
 
 downsampled_row_avr= row_avr(1:2:50)
 downsampled_col_avr= col_avr(1:2:50)
  R = [downsampled_row_avr, downsampled_col_avr];
R=R';
test_pic_data(:, 1)=R;


end