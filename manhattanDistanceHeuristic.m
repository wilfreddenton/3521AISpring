%This heuristic is modeling (|Xi(n)-X| +|Yi(n)-Y|)
%We are using a coordinate system with (0,0) in the left corner
  %with values growing down and to the right
function [distance] = manhattanDistanceHeuristic(state)
    distance = 0;
    for i = 1:9
        X = 0;  %ideal x coordinate of a puzzle square based on value
        Y = 0;  %ideal y coordinate of a puzzle square based on value
        Xi = 0; %actual x coordinate of a puzzle square based on index
        Yi = 0; %actual y coordinate of a puzzle square based on index
        count = 0; %current iteration of loop
        
        ithTile = state(i); %i is index of a square,while ithTile is 
                             %value at that index
        
        %During first iteration when count is 0, we record Xi and Yi,
        %During second iteration when count is 1, we record X and Y
        if ithTile ~= 0
            while count < 2
                if count == 0
                    variable = i;
                else
                    variable = ithTile;
                end
                switch variable
                    case 1
                        if count == 0
                            Xi = 1;
                            Yi = 1;
                        else
                            X = 1;
                            Y = 1;
                        end
                    case 2
                        if count == 0
                            Xi = 2;
                            Yi = 1;
                        else
                            X = 2;
                            Y = 1;
                        end
                    case 3
                        if count == 0
                            Xi = 3;
                            Yi = 1;
                        else
                            X = 3;
                            Y = 1;
                        end
                    case 4
                        if count == 0
                            Xi = 1;
                            Yi = 2;
                        else
                            X = 1;
                            Y = 2;
                        end
                    case 5
                        if count == 0
                            Xi = 2;
                            Yi = 2;
                        else
                            X = 2;
                            Y = 2;
                        end
                    case 6
                        if count == 0
                            Xi = 3;
                            Yi = 2;
                        else
                            X = 3;
                            Y = 2;
                        end
                    case 7
                        if count == 0
                            Xi = 1;
                            Yi = 3;
                        else
                            X = 1;
                            Y = 3;
                        end
                    case 8
                        if count == 0
                            Xi = 2;
                            Yi = 3;
                        else
                            X = 2;
                            Y = 3;
                        end
                    case 0
                        if count == 0
                            Xi = 3;
                            Yi = 3;
                        else
                            X = 3;
                            Y = 3;
                        end
                end

                count = count + 1;
            end
            %We sum up each distance using the recorded values and
            %the heuristic equation
            distance = distance + (abs(Xi - X) + abs(Yi - Y));
        end
    end
end

