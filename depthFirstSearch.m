function [result]= depthFirstSearch(initial_state,seen, goalState)
   result= false;  

   %if we find goal state, no need to proceed
   if initial_state == goalState
       result= true;
       return
   end
   possibleActions = findActionsFromState(initial_state);
   for i=1: numel(possibleActions)
       child = findStateFromAction(initial_state, possibleActions(i));
       
       %only run through recursive check if we have not seen this state
       %before
       if ~ismember(child, seen, 'rows')
          seen = [seen; child];
          result= depthFirstSearch(child, seen, goalState);
         
          if result == true
            return
          end  
       end     
   end
end