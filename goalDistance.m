function gdistance = goalDistance( inmat )
%GOALDISTANCE Summary of this function goes here
%   Detailed explanation goes here
goal=[0 1 2;3 4 5;6 7 8];
gdistance=0;
if(inmat(1,1)==0 && inmat(1,2)==1 && inmat(1,3)==2 && inmat(2,1)==3 && inmat(2,2)==4 && inmat(2,3)==5 && inmat(3,1)==6 && inmat(3,2)==7 && inmat(3,3)==8)
    gdistance=0;
else
%     Setting 1 in place.
    workingClone=inmat;
    [i,j]=find(workingClone==1);
    while(workingClone(1,2)~=1)
        if(i>1)
            temp=workingClone(i-1,j);
            workingClone(i-1,j)=workingClone(i,j);
            workingClone(i,j)=temp;
            i=i-1;
            gdistance=gdistance+1;
        end
        if(j>2)
            temp=workingClone(i,2);
            workingClone(i,2)=workingClone(i,j);
            workingClone(i,j)=temp;
            j=j-1;
            gdistance=gdistance+1;
        end
        if(j<2)
            temp=workingClone(i,2);
            workingClone(i,2)=workingClone(i,j);
            workingClone(i,j)=temp;
            j=j+1;
            gdistance=gdistance+1;
        end
    end
    workingClone=inmat;
%     Setting 2 in place.
    [i,j]=find(workingClone==2);
    while(workingClone(1,3)~=2)
        if(i>1)
            temp=workingClone(i-1,j);
            workingClone(i-1,j)=workingClone(i,j);
            workingClone(i,j)=temp;
            i=i-1;
            gdistance=gdistance+1;
        end
        if(j<3)
            temp=workingClone(i,j+1);
            workingClone(i,j+1)=workingClone(i,j);
            workingClone(i,j)=temp;
            j=j+1;
            gdistance=gdistance+1;
        end
    end
    workingClone=inmat;
%     Setting 3 in place
    [i,j]=find(workingClone==3);
    while(workingClone(2,1)~=3)
        if(i>2)
            temp=workingClone(i-1,j);
            workingClone(i-1,j)=workingClone(i,j);
            workingClone(i,j)=temp;
            i=i-1;
            gdistance=gdistance+1;
        end
        if(i<2)
            temp=workingClone(i+1,j);
            workingClone(i+1,j)=workingClone(i,j);
            workingClone(i,j)=temp;
            i=i+1;
            gdistance=gdistance+1;
        end
        if(j>1)
            temp=workingClone(i,j-1);
            workingClone(i,j-1)=workingClone(i,j);
            workingClone(i,j)=temp;
            j=j-1;
            gdistance=gdistance+1;
        end
    end
    workingClone=inmat;
%     Setting 4 in place
    [i,j]=find(workingClone==4);
    while(workingClone(2,2)~=4)
        if(i>2)
            temp=workingClone(i-1,j);
            workingClone(i-1,j)=workingClone(i,j);
            workingClone(i,j)=temp;
            i=i-1;
            gdistance=gdistance+1;
        end
        if(i<2)
            temp=workingClone(i+1,j);
            workingClone(i+1,j)=workingClone(i,j);
            workingClone(i,j)=temp;
            i=i+1;
            gdistance=gdistance+1;
        end
        if(j>2)
            temp=workingClone(i,j-1);
            workingClone(i,j-1)=workingClone(i,j);
            workingClone(i,j)=temp;
            j=j-1;
            gdistance=gdistance+1;
        end
        if(j<2)
            temp=workingClone(i,j+1);
            workingClone(i,j+1)=workingClone(i,j);
            workingClone(i,j)=temp;
            j=j+1;
            gdistance=gdistance+1;
        end
    end
    workingClone=inmat;
%     Setting 5 in place
    [i,j]=find(workingClone==5);
    while(workingClone(2,3)~=5)
        if(i>2)
            temp=workingClone(i-1,j);
            workingClone(i-1,j)=workingClone(i,j);
            workingClone(i,j)=temp;
            i=i-1;
            gdistance=gdistance+1;
        end
        if(i<2)
            temp=workingClone(i+1,j);
            workingClone(i+1,j)=workingClone(i,j);
            workingClone(i,j)=temp;
            i=i+1;
            gdistance=gdistance+1;
        end
        if(j<3)
            temp=workingClone(i,j+1);
            workingClone(i,j+1)=workingClone(i,j);
            workingClone(i,j)=temp;
            j=j+1;
            gdistance=gdistance+1;
        end
    end
    workingClone=inmat;
%     Setting 6 in place
    [i,j]=find(workingClone==6);
    while(workingClone(3,1)~=6)
        if(i<3)
            temp=workingClone(i+1,j);
            workingClone(i+1,j)=workingClone(i,j);
            workingClone(i,j)=temp;
            i=i+1;
            gdistance=gdistance+1;
        end
        if(j>1)
            temp=workingClone(i,j-1);
            workingClone(i,j-1)=workingClone(i,j);
            workingClone(i,j)=temp;
            j=j-1;
            gdistance=gdistance+1;
        end
    end
    workingClone=inmat;
%     Setting 7 in place
    [i,j]=find(workingClone==7);
    while(workingClone(3,2)~=7)
        if(i<3)
            temp=workingClone(i+1,j);
            workingClone(i+1,j)=workingClone(i,j);
            workingClone(i,j)=temp;
            i=i+1;
            gdistance=gdistance+1;
        end
        if(j>2)
            temp=workingClone(i,j-1);
            workingClone(i,j-1)=workingClone(i,j);
            workingClone(i,j)=temp;
            j=j-1;
            gdistance=gdistance+1;
        end
        if(j<2)
            temp=workingClone(i,j+1);
            workingClone(i,j+1)=workingClone(i,j);
            workingClone(i,j)=temp;
            j=j+1;
            gdistance=gdistance+1;
        end
    end
    workingClone=inmat;
%     Setting 8 (the final one) in place
    [i,j]=find(workingClone==8);
    while(workingClone(3,3)~=8)
        if(i<3)
            temp=workingClone(i+1,j);
            workingClone(i+1,j)=workingClone(i,j);
            workingClone(i,j)=temp;
            i=i+1;
            gdistance=gdistance+1;
        end
        if(j<3)
            temp=workingClone(i,j+1);
            workingClone(i,j+1)=workingClone(i,j);
            workingClone(i,j)=temp;
            j=j+1;
            gdistance=gdistance+1;
        end
    end
    
end
end

