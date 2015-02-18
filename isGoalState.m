function [result] = isGoalState(state)
    goalState = [1 2 3 4 5 6 7 8 0];
    result = state == goalState;
end

