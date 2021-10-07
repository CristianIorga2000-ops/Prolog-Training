%Function to return the nth element of a list
%Not found case returns false
%Base case
findNth([Head|_],0,Head) :-
    !.
%Searching case
findNth([_|Tail],N,H) :-
    N > 0, %add for loop prevention
    N1 is N-1,
    findNth(Tail,N1,H).