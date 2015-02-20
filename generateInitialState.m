%GENERATEINITIALSTATE this function generates a random state using a 
%   parameter called depth to hold the number of moves that we want the 
%   final state to be away from the goal state
function [initialState] = generateInitialState(depth)

%   Begin initial-state as goal-state, Generate possible actions from 
%   initial_state at each level and choose one of the actions randomly.
%   Continue scrambling initial_state until current depth equals user 
%   inputted depth.
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
