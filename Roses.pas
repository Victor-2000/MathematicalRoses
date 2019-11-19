//Program that takes as imput 2 numbers and makes roses using them.
//Inspired from article https://en.wikipedia.org/wiki/Rose_%28mathematics%29
Program Flowers;
uses    Graph;
var     t,k,r,amplitudine: real;//t-theta
        curx,cury,newx,newy,centerY,centerX,d,n,graphicDriver,graphicMode: integer;
begin
        writeln('This is a proof of how connected nature is to mathematics.');
        writeln('Use the table from the source as a guide. Have some fun :)');
        writeln('You can experiment with other numbers, if you want.');
        writeln('Inspired from article https://en.wikipedia.org/wiki/Rose_%28mathematics%29');
        //N and d are values that change the type of flower (look at the table for the guide)
        writeln('Insert n and d:');
        readln(n,d);
        graphicDriver:=detect; //The best resolution possible
        graphicMode:= 0; //Don't need auto detection
        InitGraph(graphicDriver,graphicMode,' ');
        //Some interesting values: k:= 2.7182818 16/111 16/100 11/25
        k:= n/d;
        //We get the middle point coordinates of the screen
        centerY:= GetMaxY div 2;
        centerX:= GetMaxX div 2;
        amplitudine:= 300;
        while t <= (d * 2 * PI) + 0.01 do begin
                r:= cos(k*t) * amplitudine;
                newx:= trunc(cos(t)*r);
                newy:= trunc(sin(t)*r);
                //A case which should be avoided because it produces a line
                if t <> 0 then
                        line(curx+centerX,cury+centerY,newx+centerX,newy+centerY);
                curx:=newx;
                cury:=newy;
                t:= t + 0.01;
        end;
        readln;
        closeGraph;
end.
