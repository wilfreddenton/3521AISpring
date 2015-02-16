function [actions]= findActionsFromState(state)

    %Possible Actions defined:
    %1= UP
    %2= DOWN
    %3= LEFT
    %4= RIGHT
    
    index=1;
    %Find index of zero in state array
    while state(index)~=0
        index=index+1;
    end
    
    %gives possible actions depending on zero's index
    if index==1
        actions=[4 2];  %ex. if the zero is in the first square, can move 
                        %right and down
    elseif index==2
        actions=[3 2 4];
    elseif index==3 
        actions=[3 2];
    elseif index==4
        actions=[1 4 2];
    elseif index==5
        actions=[1 3 2 4];
    elseif index==6
        actions=[1 3 2];
    elseif index==7
        actions=[1 4];
    elseif index==8
        actions=[1 3 4];
    elseif index==9
        actions=[1 3];
    end

end