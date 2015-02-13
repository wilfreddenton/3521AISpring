function [actions]= findActionFromState(state);

    %gives adj indices of any node
    if x==1
        adjList=[2 4];
    elseif x==2
        adjList=[1 3 5];
    elseif x==3 
        adjList=[2 6];
    elseif x==4
        adjList=[1 5 7];
    elseif x==5
        adjList=[2 4 6 8];
    elseif x==6
        adjList=[3 5 9];
    elseif x==7
        adjList=[4 8];
    elseif x==8
        adjList=[5 7 9];
    elseif x==9
        adjList=[6 8];
    end

end