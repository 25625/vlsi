`timescale 1s / 0.1s

module digital(clk,res,sec,min,hr,dd,mm,yy,sc,mn,hrs,dt,mon,yr,ww);
input res,clk;
output reg[5:0]sec;
output reg[5:0]min;
output reg[4:0]hr;
output reg[5:0]dd;
output reg[1:3]ww;
output reg[3:0]mm;
output reg[11:0]yy;
input sc,mn,hrs,dt,mon,yr;
integer w,w1;
always@(posedge clk/*,posedge res,posedge sc,posedge mn,posedge hrs,posedge dt,posedge mon,posedge yr*/)
begin
   if(res)
       begin
           sec<=0;
           min<=0;
           hr<=0;
           dd<=1;
           mm<=1;
           yy<=2016;
           ww<=5;
       end   
     else if(sec<=58)
        begin
            sec=sec+1;
            //t=t+1;
           
        end           
     else
        begin
           sec<=0;
           min=min+1;
        end
     if(min>=60)
        begin
            min<=0;
            hr=hr+1;
        end
     
      if(hr==24)
        begin
            hr<=0;             
            dd=dd+1;
            w=dd;
            w1=dd+1;
            if(w<=w1)
                                    if(ww<=7)
                                        begin
                                            begin
                                                ww=ww+1;
                                            end
                                     if(ww==7)
                                        begin
                                            ww=0;
                                        end
                                        end
        end 
   
                    
       
        if(mm%2==1 && mm<8)
        begin   
        if(dd>=32)
            begin
                dd<=1;
                mm=mm+1;
            end
         end
         else if(mm!=2 && mm%2==0 && mm<8)
         begin
            if(dd>=31)
                begin
                    dd<=1;
                    mm=mm+1;
                end
             end
             else
                begin
         if(mm==2 && dd>=29 && yy%4!=0)
            begin
                dd<=1;
                mm=mm+1;
            end
            else if(mm==2 && dd>=30 && yy%4==0)
                begin
                     dd<=1;
                     mm=mm+1;
                end
            else if(mm>=8)
                begin
                    if(mm%2==1 && dd>=31)
                        begin
                                dd<=1;
                                mm=mm+1;
                         end
                       else
                        begin
                            if(dd>=32)
                                begin
                                    dd<=1;
                                    mm=mm+1;
                                end
                        end
                  end
                 end
                                   
         if(mm>=13)
            begin
                mm<=1;
                yy=yy+1;
            end
         if(sc)
         	begin
			sec=0;
		end
	if(mn)
		begin
			min=min+1;
		end
	if(hrs)
		begin
	       hr=hr+1;
		end	
	if(dt)
		begin
			dd=dd+1;
		end
	if(mon)
		begin
			mm=mm+1;
		end
	if(yr)
		begin
			yy=yy+1;
		end
end    
endmodule
