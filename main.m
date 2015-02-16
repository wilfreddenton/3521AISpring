% First part should be dedicated to generating the 100 random states
%   make an array to contain the randomly generated states
%   make a loop that iterates 100 times
%   randomize parameters for generateInitialState
%   check that returned state is not in the array and then save...

goalState = [1 2 3 4 5 6 7 8 0];
randomStates = zeros(0, 9);
numStates = 0;
maxDepth = 7;
while numStates < 100
    randomDepth = randperm(maxDepth, 1)
    state = generateInitialState(randomDepth);
    if ~ismember(state, randomStates, 'rows')
       randomStates = [randomStates; state];
       numStates = numStates + 1;
    end
end

% Second part is running the randomly generated states through each of the
% algorithms

% Loop for all the generated initial states
%   run through BFS

% BFSTimes = [];
% for i = 1:length(randomStates)
%     tic
%     result = breadthFirstSearch(randomStates(i,:), goalState);
%     row = [result toc];
%     BFSTimes = [BFSTimes;row];
% end
% BFSTimes

% Depth First Search

%DFSTimes = [];
%for i = 1:length(randomStates)
%    tic
%    depthFirstSearch(randomStates(i,:), zeros(0,9), goalState);
%    DFSTimes = [DFSTimes;toc];
%end
%DFSTimes

% Iterative Depth Limited Search

% IDLSTimes = zeros(0,2);
% for i = 1:length(randomStates)
%     tic
%     result = iterativeDepthLimitedSearch(randomStates(i,:), 100, zeros(0,9), goalState);
%     row = [result toc];
%     IDLSTimes = [IDLSTimes;row];
% end
% IDLSTimes

% A* Search with Manhattan Distance Heuristic

aStarTimes = [];
for i = 1:length(randomStates)
    tic
    result = aStarSearch(randomStates(i,:), goalState);
    aStarTimes = [aStarTimes;toc];
end
aStarTimes

% create histogram

% find mean and variance