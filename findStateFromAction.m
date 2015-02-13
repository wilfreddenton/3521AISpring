function[child]= actions(node,action)
    child=node;
    %find blank square, remember MATLAB begins indices at 1
    index=1;
    while node(index)~=0
        index=index+1;
    end

    %action 1 == UP
    if  action==1 && index>3
        temp=child(index);
        child(index)=child(index-3);
        child(index-3)=temp; 

     %action 2 == DOWN
    elseif action==2 && index<7
        temp= child(index);
        child(index)= child(index+3);
        child(index+3)= temp;

     %action 3 == LEFT
    elseif action==3 && (mod(index,3)~=1)
        temp= child(index);
        child(index)= child(index-1);
        child(index-1)= temp;
     %action 4 == RIGHT
    elseif action==4 && (mod(index,3)~=0)
        temp= child(index);
        child(index)= child(index+1);
        child(index+1)= temp;

    end

end
