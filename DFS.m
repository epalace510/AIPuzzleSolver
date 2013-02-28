function DFS(inmat)
%BFS Summary of this function goes here
%keep track of all visited nodes with a matrix of strings.
visited=mat2str(inmat);
%Moves will be my stack of moves which I haven't yet performed.
moves=mat2str(inmat);
tic;
%while there are moves to do...
while(~isempty(moves))
  %take a state (move) from the top (end) of my stack
    inmat=str2num(moves(end,:));
    %If we've found the solution, break! We're done.
    isSol=checksolution(inmat);
    if(isSol)
        break;
    end
    zeroi=0;
    zeroj=0;
    %returns a matrix of 0s and 1s, where 1s are bordered by inmat's 0s.
    %This will likely be deprecated for efficiency.
    connectionMatrix=connections(inmat);
    for i=1:3
        for j=1:3
            if inmat(i,j)==0
              %Find the coordinates of the 0 (blank tile) in inmat.
                zeroi=i;
                zeroj=j;
            end
        end
    end
    for i=1:3
        for j=1:3
          %Look for tiles I can move.
            if connectionMatrix(i,j)==1
              %have to use workingClone instead of inmat so I don't accidentally take a move before unqueueing it.
                workingClone=inmat;
                %currentChoice is the value of the tile I'm moving.
                currentChoice=workingClone(i,j);
                workingClone(i,j)=0;
                %switches the c=values.
                workingClone(zeroi,zeroj)=currentChoice;
                %Checks to see if the matrix we just got has already been seen (either on the queue or has been taken and unqueued.
                if(isempty(find(strcmp(visited,mat2str(workingClone)))))
                  %Adds the state to the matrix of states we've visited. This prevents infinite loops.
                    visited=cat(1,visited,mat2str(workingClone));
                    %This adds the value at the end (top) of the matrix moves, emulating a stack.
                    moves=cat(1,moves,mat2str(workingClone));
                end
            end
        end
    end
    %This removes the last line of the moves stack, emulating the ability to "pop" a state off the top of the stack.
    moves=moves(~ismember(1:size(moves,1),end),:);
end
drawpuzzle(inmat);
toc
end

