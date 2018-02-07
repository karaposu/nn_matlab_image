function [] = print_result(vvvv)



if(vvvv>0.9)
  
msg=['test sonucu : yatay ; hesaplanan deger :',num2str(vvvv)];
else
    
 msg=['test sonucu : dikey ;hesaplanan deger :',num2str(vvvv)];
end

disp(msg)

end