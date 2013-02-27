function isSol = checksolution(inmat)

solution = [0 1 2; 3 4 5; 6 7 8];
totalval = sum(sum(inmat == solution));
if totalval == 9
    isSol = true;
else
    isSol = false;
end

end