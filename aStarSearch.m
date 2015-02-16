function [result] = aStarSearch(initialState, goalState)
    result = false;
    if initialState == goalState
        result = true;
        return
    end
    frontier = initialState;
    seen = zeros(0,9);
    
    while ~isempty(frontier)
        minManhattanDistance = 0;
        length = size(frontier, 1);
        state = zeros(0,9);
        optimalStateIndex = 0;
        for i = 1:length
            potentialState = frontier(i,:);
            manhattanDistance = manhattanDistanceHeuristic(potentialState);
            if minManhattanDistance > manhattanDistance || i == 1
                minManhattanDistance = manhattanDistance;
                optimalStateIndex = i;
                state = potentialState;
            end
        end
        frontier(optimalStateIndex,:) = [];
        seen = [seen; state];
        
        possibleActions = findActionsFromState(state);
        for i = 1:length(possibleActions)
            %child <— CHILD -Node(problem, node , action)
            child = findStateFromAction(state, possibleActions(i));

            %if child.STATE is not in seen or frontier then

            %if problem GOAL- TEST(child.STATE) then return SOLUTION( child)
            if ~ismember(child,frontier, 'rows') && ~ismember(child, seen, 'rows')
                if child == goalState
                    result = true;
                    return
                else  
                    %frontier INSERT( child, frontier)
                    frontier(size(frontier,1)+1,:) = child;
                end
            end 
        end
    end
end

