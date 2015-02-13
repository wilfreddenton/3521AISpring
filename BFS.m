%node <-- a node with STATE = problem.INITIAL-STATE, PATH-COST =0
initial= [2 6 3 1 0 7 5 8 4];
goal_state= [1 2 3 4 5 6 7 8 0];
path_cost= 0;
tic
%if problem.GOAL-TEST( node. STATE) then return SOLUTION(node)
if initial == goal_state
   fprintf('solution found');
end
 %frontier — a FIFO queue with node as the only element
 frontier = initial;
 %explored <—an empty set
 explored= [];
%loop do
empty=[];
stop=0;  %bool to indicate finish loop

while ~isempty(frontier) && ~stop
    
    %node q— POP( frontier) f* chooses the shallowest node in frontier *I
    state = frontier(1,:);
    frontier(1,:)= []; %clearing value means node is popped.

    %add node.STATE to explored
    explored = [explored; state]
    %for each action in problem .ACTIONS(node. STATE) do
    possibleActions= findActionsFromState(state);
    for j=1:length(possibleActions);
        %child <— CHILD -Node(problem, node , action)
        child= findStateFromAction(state, possibleActions(j));

        %if child.STATE is not in explored or frontier then
 
        %if problem GOAL- TEST(child.STATE) then return SOLUTION( child)
        if ~ismember(child,frontier, 'rows') && ~ismember(child,explored, 'rows')
            if child == goal_state
                fprintf('Solution Found')
                child
                stop=1;
                toc
            else  
        %frontier INSERT( child, frontier)
        frontier(size(frontier,1)+1,:)= child;
            end
        end 
        
        if stop
           break;
        end
    end
end
  %if EMPTY(frontier)then return failure
      if isempty(frontier)
         fprintf('failure');
      end