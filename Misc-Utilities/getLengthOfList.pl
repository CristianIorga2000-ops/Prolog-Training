%Function to get the length of a list
%getLen(l1..ln) = 
%	1 + getLen(l2..ln);
%	0, n = 0
%flow(i, o)

%Base case 
getLen([], 0).
%Recursive form, adds 1 to length for each recursion up until the base case
getLen([Head| Tail], Length):-
    getLen(Tail, Remainder),
    Length is 1 + Remainder.