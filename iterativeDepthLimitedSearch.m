%Iterative Deepening Depth Limited Search. Parameters are: initialState,
%which is input array and maxDepth, which is the maximum number of levels
%that we want to explore deeper. Result is boolean for whether we reach
%goal or not
function [result] = iterativeDepthLimitedSearch(initialState, maxDepth)
    result = false;
    seen = zeros(0,9);   %explored states
    for depth = 1:maxDepth
       result = depthLimitedSearch(initialState, depth, seen);
       if result
           return
       end
    end
end

