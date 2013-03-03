function BFS(inmat)
%BFS Summary of this function goes here
visited=changestate(inmat);
parent=1;
parentIndex=intmax;
moves=mat2str(inmat);
tic;
while(~isempty(moves))
    inmat=str2num(moves(1,:));
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
                state=changestate(workingClone);
                if(~(any(visited(:) == state)))
                    visited=cat(1,visited,changestate(workingClone));
                    parent=cat(1,parent,find(visited==changestate(inmat)));
                    %makes a queue
                    moves=cat(1,moves,mat2str(workingClone));
                end
            end
        end
    end
    moves=moves(~ismember(1:size(moves,1),1),:);
end
if(isSol)
    reverseOrder=changestate(inmat);
    parentIndex=parent(find(visited==changestate(inmat)));
    preIndex=0;
    while(parentIndex~=preIndex)
        preIndex=parentIndex;
        inmat=visited(parentIndex);
        parentIndex=parent(parentIndex);
        reverseOrder=cat(1,inmat,reverseOrder);
    end
    reverseOrder
else
    'There is no solution.'
end
%drawpuzzle(inmat);
toc
end

function reint = changestate(a)
charst=strcat(num2str(a(1)),num2str(a(4)),num2str(a(7)),num2str(a(2)),num2str(a(5)),num2str(a(8)),num2str(a(3)),num2str(a(6)),num2str(a(9)));
reint = eval(charst);
end
