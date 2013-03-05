function AStar(inmat)
%AStar Summary of this function goes here
visited=changestate(inmat);
parent=1;
parentIndex=intmax;
weightMatrix=goalDistance(inmat);
moves=mat2str(inmat);
runningCost=1;
tic;
while(~isempty(moves))
    inmat=str2num(moves(1,:));
    moves=moves(~ismember(1:size(moves,1),1),:);
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
                    visited=[visited;changestate(workingClone)];
                    parent=[parent;find(visited==changestate(inmat))];
                    tCost=runningCost(parent(end))+1;
                    %runningCost=cat(1,runningCost,tCost);
                    tDistance=goalDistance(workingClone);
                    runningCost=[runningCost;tCost];
                    weightMatrix=[weightMatrix;(tDistance+tCost)];
                    %Places the node either on the moves matrix like a
                    %queue (if it does not have a higher cost) or like a
                    %stack (if it has a higher cost).
                    count=1;
%                     'almost moves.'
                    if(size(moves,1)==0)
                        moves=mat2str(workingClone);
%                         'If statement'
                    else
%                         'outside the small while.'
                        while(count<=(size(moves,1)))
%                             'loopdeloop'
                            %if((tCost+tDistance)<(runningCost(find(visited==changestate(str2num(moves(count,:)))))+weightMatrix(find(visited==changestate(str2num(moves(count,:)))))))
                            if((tCost+tDistance)<(weightMatrix(find(visited==changestate(str2num(moves(count,:)))))))
                                if(count==1)
                                    moves=[mat2str(workingClone);moves];
                                else
                                    %tempMatrix=moves(1:count-1,:);
                                    %tempMatrix=cat(1,tempMatrix,mat2str(workingClone));
                                    moves=[moves(1:count-1,:); mat2str(workingClone); moves(count:end,:)];
                                end
                                break;
                            end
                            if(count==(size(moves,1)))
                                moves=[moves;mat2str(workingClone)];
                                break;
                            end
                            count=count+1;
                        end
                    end
                end
            end
        end
    end
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
