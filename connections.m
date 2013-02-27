function connectionMatrix = connections( inmat )
%CONNECTIONS Summary of this function goes here
%   Detailed explanation goes here
connectionMatrix=[0,0,0;0,0,0;0,0,0];
for i=1:3
    for j=1:3
        if i<3
            if inmat(i+1,j)==0
                connectionMatrix(i,j)=1;
            end
        end
        if i>1
            if inmat(i-1,j)==0
                connectionMatrix(i,j)=1;
            end
        end
        if j<3
            if inmat(i,j+1)==0
                connectionMatrix(i,j)=1;
            end
        end
        if j>1
            if inmat(i,j-1)==0
                connectionMatrix(i,j)=1;
            end
        end
    end
end

end

