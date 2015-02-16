function [result]= DFS(initial_state, seen)
   goal_state=[1 2 3 4 5 6 7 8 0];
   failure= [0 0 0 0 0 0 0 0 0];
   result= failure;
   
   if initial_state == goal_state
       fprintf('solution found');
       result=[1 2 3 4 5 6 7 8 0];
   else
       possibleActions = findActionsFromState(initial_state);
       for i=1: length(possibleActions)
           child = findStateFromAction(initial_state, possibleActions(i));

           if ~ismember(child, seen, 'rows')
              seen = [seen; child];
              result= DFS(child, seen);
           end     
         
           
           if result == goal_state
               break
           end  
       end
    
   end

end