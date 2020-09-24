`timescale 1s / 0.1s
`define y2r 2
`define y2g 2
`define g2y 10
`define r2y 10
module traffic_control(up,down,left,right,walk,x,clk,clear);
output right,down,left,up,walk;
reg [0:3]walk;
input clk,x,clear;
parameter s0=3'd0,s1=3'd1,s2=3'd2,s3=3'd3,s4=3'd4,s5=3'd5,s6=3'd6,s7=3'd7;
reg [2:0]current_state;
reg [2:0]next_state;
parameter red=3'd0,yellow=3'd1,green=3'd2;//up-1,down-2,left=3,right-0
always@(posedge clk)
    begin
        if(clear)
        begin
            current_state = s0;
         end
        else
        begin
            current_state = next_state;//51
        end
            always@(current_state)
            begin
               case(current_state)
               s0:
               begin
                up=green;
                right=red;
                walk = 4'd8;
               end
               s1:
                 begin
                  up=yellow;
                  down=yellow;
                  walk = 4'd8;
                  end
                s2:
                begin
                up=red;
                down=green;
                walk = 4'd4;
                end
               s3:
                begin
                 down=yellow;
                 left=yellow;
                 walk = 4'd4;
                end
                s4:
                begin
                 left=green;
                 down=red;
                  walk = 4'd2;
                end
                s5:
                               begin
                                left=yellow;
                                right=yellow;
                                walk = 4'd2;
                               end
               s6:
               begin
                left=red;
                right=green;
                walk=4'd1;
                end
                s7:
                begin
                right=yellow;
                up=yellow;
                walk=4'd1;
                end
                endcase
                
                always@(current_state or x)
                begin
                    case(current_state)
                    s0:
                    begin
                        //repeat(`g2y)@(posegde clk);
                        #g2y
                        next_state=s1;
                    end
                    s1:
                    begin
                        #y2g;
                        next_state=s2;
                    end
                     s2:
                     begin
                       #g2y;
                       next_state=s3;
                     end
                     s3:
                     begin
                        #y2r;
                        next_state=s4;
                     end
                     s4:
                     begin
                        #g2y;
                        next_state=s5;
                     end
                     s5:
                     begin
                     #y2g;
                     next_state=s6;
                     end
                     s6:
                     begin
                      #g2y;
                      next_state=s7;
                     end
                     s7:
                     begin
                        #y2g;
                        next_state=s0;
                     end
                     endcase
                end
       end
 endmodule