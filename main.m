% First part should be dedicated to generating the 100 random states
%   make an array to contain the randomly generated states
%   make a loop that iterates 100 times
%   randomize parameters for generateInitialState
%   check that returned state is not in the array and then save...

goalState = [1 2 3 4 5 6 7 8 0];
randomStates = zeros(0, 9);
numStates = 0;
maxDepth = 7;
disp('Generating 100 random initial states...');
while numStates < 100
    randomDepth = randperm(maxDepth, 1);
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

disp('Running Breadth First Search on each of the initial states...');
BFSTimes = [];
for i = 1:length(randomStates)
    tic
    result = breadthFirstSearch(randomStates(i,:), goalState);
    row = [result toc*1000];
    BFSTimes = [BFSTimes;row];
end
% BFSTimes(:, end)
histogram(BFSTimes(:, end))
title('Breadth First Search Histogram')
xlabel('ms')
ylabel('frequency')

average = mean(BFSTimes(:, end));
variance = var(BFSTimes(:, end));
fprintf('\nBreadth First Search Results \n Mean: %f\n Variance: %f\n\n', average, variance);

% Depth First Search

%DFSTimes = [];
%for i = 1:length(randomStates)
%    tic
%    depthFirstSearch(randomStates(i,:), zeros(0,9), goalState);
%    DFSTimes = [DFSTimes;toc];
%end
%DFSTimes

% Iterative Depth Limited Search

disp('Running Iterative Depth Limited Search on each of the initial states...');
IDLSTimes = zeros(0,2);
for i = 1:length(randomStates)
    tic
    result = iterativeDepthLimitedSearch(randomStates(i,:), 100, zeros(0,9), goalState);
    row = [result toc*1000];
    IDLSTimes = [IDLSTimes;row];
end
figure
histogram(IDLSTimes(:, end))
title('Iterative Deepening Depth Limited Search Histogram')
xlabel('ms')
ylabel('frequency')

average = mean(IDLSTimes(:, end));
variance = var(IDLSTimes(:, end));
fprintf('\nIterative Deepening Depth First Search Results \n Mean: %f\n Variance: %f\n\n', average, variance);

% A* Search with Manhattan Distance Heuristic

disp('Running A* search with the Manhattan Distance Heuristic on each of the initial states...');
aStarTimes = [];
for i = 1:length(randomStates)
    tic
    result = aStarSearch(randomStates(i,:), goalState);
    row = [result toc*1000];
    aStarTimes = [aStarTimes;row];
end
figure
histogram(aStarTimes(:, end))
title('A* Search With Manhattan Distance Heuristic Histogram')
xlabel('ms')
ylabel('frequency')

average = mean(aStarTimes(:, end));
variance = var(aStarTimes(:, end));
fprintf('\nA* Search Results \n Mean: %f\n Variance: %f\n\n', average, variance);

disp('Finished running initial states through all search algorithms');

% find mean and variance
