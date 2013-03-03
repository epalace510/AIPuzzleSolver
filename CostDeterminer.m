function cost = CostDeterminer( inNum )
%COSTDETERMINER Summary of this function goes here
%   If this were a true Uniform Cost implementation, there would be
%   different costs based on the different numbers/which node was being
%   moved. However, in this case all moves have the same cost.
if(inNum>0 && inNum<9)
    cost=2;
else
    cost=2;
end

end

