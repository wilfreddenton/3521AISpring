function [result] = depthLimitedSearch(initialState, levelsFromMaxDepth, seen, goalState)
    result = false;
    if initialState == goalState
        result = true;
        return
    elseif levelsFromMaxDepth == 0
        return
    else
        possibleActions= findActionsFromState(initialState);
        for i=1:length(possibleActions)
            child = findStateFromAction(initialState, possibleActions(i));
            if ~ismember(child, seen, 'rows')
                seen = [seen; child];
                result = depthLimitedSearch(child, levelsFromMaxDepth - 1, seen, goalState);
                if result
                    return
                end
            end
        end
    end
    
end

