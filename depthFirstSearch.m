function [result]= depthFirstSearch(initial_state,seen, goalState)
   result= false;

   
   if initial_state == goalState
       result= true;
   else
       possibleActions = findActionsFromState(initial_state);
       for i=1: length(possibleActions)
           child = findStateFromAction(initial_state, possibleActions(i));

           if ~ismember(child, seen, 'rows')
              seen = [seen; child];
              result= depthFirstSearch(child, seen, goalState);
              
               if result == true
                 break
               end  
           end     
         
       end
    
   end

end