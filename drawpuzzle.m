function drawpuzzle(inmat) 

hold on;
for x=0:2
    for y=0:2
        xpos = x*5;
        ypos = 10-y*5;
        x1 = x+1;
        y1 = y+1;
        val = inmat(y1,x1);
        
        if val == 0
            rectangle('Position', [xpos,ypos,5,5], 'facecolor', [0.8 0.8 0.8]);
        else
            rectangle('Position', [xpos,ypos,5,5], 'facecolor', [1 1 1]);
            text(xpos+2.5, ypos+2.5, num2str(val));
        end
        
    end
end
hold off;
pause(0.3);
end