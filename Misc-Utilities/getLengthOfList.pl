%Function to get the length of a list
%Base case 
getLen([], 0).
%Recursive form, adds 1 to length for each recursion up until the base case
getLen([Head| Tail], Length):-
    getLen(Tail, Remainder),
    Length is 1 + Remainder.