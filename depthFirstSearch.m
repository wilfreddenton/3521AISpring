%Depth First Search. Parameters are initial_state which is the array 
%to begin the search; seen is a set of all states that have been explored;
%output is boolean indicating if we reached goal_state or not.Our
%implementation of DFS ran into recursive memory limits when we used 
%a max depth above 1 level, so we used the DLS version in our final 
%implementation
function [result]= depthFirstSearch(initial_state,seen)
   result= false;  

   %if we find goal state, no need to proceed
   if isGoalState(initial_state)
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
          result= depthFirstSearch(child, seen);
         
          if result == true
            return
          end  
       end     
   end
end