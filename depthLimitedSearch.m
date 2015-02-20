%Depth Limited Search. Parameters are: initialState, array to begin our
%search; levelsFromMaxDepth, an integer used in recursive calls to indicate
%that we moved down a level; seen, set of all explored states.
function [result] = depthLimitedSearch(initialState, levelsFromMaxDepth, seen)
    result = false;
    if isGoalState(initialState)
        result = true;
        return
    elseif levelsFromMaxDepth == 0
        return
    else
        possibleActions= findActionsFromState(initialState);
        for i=1:length(possibleActions)
            child = findStateFromAction(initialState, possibleActions(i));
            %only make recursive call if we haven't seen this state before
            if ~ismember(child, seen, 'rows')
                seen = [seen; child];
                %each recursive call is one level deeper so subtract 1
                %from levelsFromMaxDepth
                result = depthLimitedSearch(child, levelsFromMaxDepth - 1, seen);
                if result
                    return
                end
            end
        end
    end
    
end

