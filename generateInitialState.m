function [initialState] = generateInitialState(depth)
%GENERATEINITIALSTATE Summary of this function goes here
%   Detailed explanation goes here
    goal_state = [1 2 3 4 5 6 7 8 0];
    explored = [];
    initialState = goal_state;
    currentDepth = 0;
    while currentDepth < depth
        actions = findActionsFromState(initialState);
        explored = [explored; initialState];
        potentialStates = [];
        for i = 1:numel(actions)
            state = findStateFromAction(initialState, actions(i));
            if ~ismember(state, explored)
                potentialStates = [potentialStates; state];
            end
        end
        randomIndex = randperm(numel(potentialStates), 1);
        initialState = potentialStates(randomIndex);
        currentDepth = currentDepth + 1;
    end
    disp(explored)
    disp(initialState)
end
