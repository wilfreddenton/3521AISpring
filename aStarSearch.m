% This is A-Star Search. Initial State is input as an array that is the 
% root of the search. Result is a boolean indicating whether the goal-
% state has been reached or not.
function [result] = aStarSearch(initialState)
    result = false;
    
    %if we find goal state, no need to proceed
    if isGoalState(initialState)
        result = true;
        return
    end
    frontier = initialState; %set of states generated but not explored
    seen = zeros(0,9); %set of states that have been explored
    
    while ~isempty(frontier)
        minManhattanDistance = 0;
        length = size(frontier, 1);  
        state = zeros(0,9);
        optimalStateIndex = 0;
        
        %find minimum manhattan distance among all states in frontier
        for i = 1:length
            potentialState = frontier(i,:);  
            manhattanDistance = manhattanDistanceHeuristic(potentialState);
            if minManhattanDistance > manhattanDistance || i == 1
                minManhattanDistance = manhattanDistance;
                optimalStateIndex = i;   
                state = potentialState;
            end
        end
        frontier(optimalStateIndex,:) = []; %remove chosen state from set 
        seen = [seen; state]; %add chosen state to explored list
        
        possibleActions = findActionsFromState(state);
        for i = 1:numel(possibleActions)
            %child <— CHILD -Node(problem, node , action)
            child = findStateFromAction(state, possibleActions(i));

            %if child.STATE is not in seen or frontier then

            %if problem GOAL- TEST(child.STATE) then return SOLUTION( child)
            if ~ismember(child,frontier, 'rows') && ~ismember(child, seen, 'rows')
                if isGoalState(child)
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

