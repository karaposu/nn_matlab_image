function [row_avr,col_avr] = row_and_col_avarage_of_img(test_picture,x,y)
% Modified convolution routine for signal processing

I3=0;I4=0;s=0;s2=0;counter=0;

 for i=1:x ;  %1-4
                 for j=1:y   
                   I3 =(test_picture)  ;
                
                   s=s+I3(i,j);     %1. satýrýn tolamýný buldu.
                   s2=s2+I3(j,i);     %1. satýrýn tolamýný buldu.
                   counter=counter+1;
                 end

             test_row_avarage_row(i)=s/counter;  % 4 deger
             test_row_avarage_col(i)=s2/counter;  % 4 deger
            
      
             s=0;s2=0; counter=0;
 end
  
     row_avr=test_row_avarage_row
     col_avr=test_row_avarage_col
end
