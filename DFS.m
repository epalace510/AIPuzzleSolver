function DFS(inmat)
%BFS Summary of this function goes here
visited=mat2str(inmat);
moves=mat2str(inmat);
tic;
while(~isempty(moves))
    inmat=str2num(moves(end,:));
    isSol=checksolution(inmat);
    if(isSol)
        break;
    end
    zeroi=0;
    zeroj=0;
    connectionMatrix=connections(inmat);
    for i=1:3
        for j=1:3
            if inmat(i,j)==0
                zeroi=i;
                zeroj=j;
            end
        end
    end
    for i=1:3
        for j=1:3
            if connectionMatrix(i,j)==1
                workingClone=inmat;
                currentChoice=workingClone(i,j);
                workingClone(i,j)=0;
                workingClone(zeroi,zeroj)=currentChoice;
                if(isempty(find(strcmp(visited,mat2str(workingClone)))))
                    visited=cat(1,visited,mat2str(workingClone));
                    %makes a stack
                    moves=cat(1,mat2str(workingClone),moves);
                end
            end
        end
    end
    moves=moves(~ismember(1:size(moves,1),end),:);
end
drawpuzzle(inmat);
toc
end

