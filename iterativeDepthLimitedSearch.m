function [result] = iterativeDepthLimitedSearch(initialState, maxDepth)
    result = false;
    seen = zeros(0,9);
    for depth = 1:maxDepth
       result = depthLimitedSearch(initialState, depth, seen);
       if result
           return
       end
    end
end

