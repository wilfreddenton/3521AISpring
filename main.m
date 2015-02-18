% Generate 100 random states
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

% Loop for all the generated initial states

% Breadth First Search

disp('Running Breadth First Search on each of the initial states...');
BFSTimes = [];
for i = 1:length(randomStates)
    tic
    result = breadthFirstSearch(randomStates(i,:));
    row = [result toc*1000];
    BFSTimes = [BFSTimes;row];
end
% BFSTimes(:, end)
histogram(BFSTimes(:, end))
title('Breadth First Search Histogram')
xlabel('time (ms)')
ylabel('frequency')

average = mean(BFSTimes(:, end));
variance = var(BFSTimes(:, end));
fprintf('\nBreadth First Search Results \n Mean: %.2f ms\n Variance: %.2f ms^2\n\n', average, variance);

% Depth First Limited Search

disp('Running Depth First Limited Search on each of the initial states...');
DFSTimes = [];
for i = 1:length(randomStates)
   tic
   result = depthLimitedSearch(randomStates(i,:), maxDepth, zeros(0,9));
   row = [result toc*1000];
   DFSTimes = [DFSTimes;row];
end
% DFSTimes(:, end)
figure
histogram(DFSTimes(:, end))
title('Depth First Limited Search Histogram')
xlabel('time (ms)')
ylabel('frequency')

average = mean(DFSTimes(:, end));
variance = var(DFSTimes(:, end));
fprintf('\nDepth First Limited Search Results \n Mean: %.2f ms\n Variance: %.2f ms^2\n\n', average, variance);

% Iterative Depth Limited Search

disp('Running Iterative Depth Limited Search on each of the initial states...');
IDLSTimes = zeros(0,2);
for i = 1:length(randomStates)
    tic
    result = iterativeDepthLimitedSearch(randomStates(i,:), maxDepth);
    row = [result toc*1000];
    IDLSTimes = [IDLSTimes;row];
end
figure
histogram(IDLSTimes(:, end))
title('Iterative Deepening Depth Limited Search Histogram')
xlabel('time (ms)')
ylabel('frequency')

average = mean(IDLSTimes(:, end));
variance = var(IDLSTimes(:, end));
fprintf('\nIterative Deepening Depth First Search Results \n Mean: %.2f ms\n Variance: %.2f ms^2\n\n', average, variance);

% A* Search with Manhattan Distance Heuristic

disp('Running A* search with the Manhattan Distance Heuristic on each of the initial states...');
aStarTimes = [];
for i = 1:length(randomStates)
    tic
    result = aStarSearch(randomStates(i,:));
    row = [result toc*1000];
    aStarTimes = [aStarTimes;row];
end
figure
histogram(aStarTimes(:, end))
title('A* Search With Manhattan Distance Heuristic Histogram')
xlabel('time (ms)')
ylabel('frequency')

average = mean(aStarTimes(:, end));
variance = var(aStarTimes(:, end));
fprintf('\nA* Search Results \n Mean: %.2f ms\n Variance: %.2f ms^2\n\n', average, variance);

disp('Finished running initial states through all search algorithms');

% find mean and variance
