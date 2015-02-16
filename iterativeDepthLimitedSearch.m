function [result] = iterativeDepthLimitedSearch(initialState, maxDepth, seen, goalState)
    result = false;
    seen = zeros(0,9);
    for depth = 1:maxDepth
       result = depthLimitedSearch(initialState, depth, seen, goalState);
       if result
           return
       end
    end
end

