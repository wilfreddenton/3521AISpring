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
            if ~ismember(state, explored, 'rows')
                potentialStates = [potentialStates; state];
            end
        end
        length = size(potentialStates,1);
        randomIndex = randperm(length, 1);
        initialState = potentialStates(randomIndex,:);
        currentDepth = currentDepth + 1;
    end
end
