function[result]= breadthFirstSearch(initialState)
    %node <-- a node with STATE = problem.INITIAL-STATE, PATH-COST =0
    %goal_state= [1 2 3 4 5 6 7 8 0];
    result=false;
    %if problem.GOAL-TEST( node. STATE) then return SOLUTION(node)
    if isGoalState(initialState)
        result=1;
        return
    end
    %frontier — a FIFO queue with node as the only element
    frontier = initialState;
    %seen <—an empty set
    seen = [];
    %loop do

    while ~isempty(frontier)
        %node q— POP( frontier) f* chooses the shallowest node in frontier *I
        state = frontier(1,:);
        frontier(1,:)= []; %clearing value means node is popped.

        %add node.STATE to seen
        seen = [seen; state];
        %for each action in problem .ACTIONS(node. STATE) do
        possibleActions= findActionsFromState(state);
        for i=1:numel(possibleActions);
            %child <— CHILD -Node(problem, node , action)
            child= findStateFromAction(state, possibleActions(i));

            %if child.STATE is not in seen or frontier then

            %if problem GOAL- TEST(child.STATE) then return SOLUTION( child)
            if ~ismember(child,frontier, 'rows') && ~ismember(child, seen, 'rows')
                if isGoalState(child)
                    result=true;
                    return
                else  
                    %frontier INSERT( child, frontier)
                    frontier(size(frontier,1)+1,:)= child;
                end
            end 
        end
    end
end