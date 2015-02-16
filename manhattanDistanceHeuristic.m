function [distance] = manhattanDistanceHeuristic(state)
    distance = 0;
    for i = 1:9
        X = 0; Y = 0; Xi = 0; Yi = 0; count = 0;
        ithTile = state(i);
        
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
            distance = distance + (abs(Xi - X) + abs(Yi - Y));
        end
    end
end

