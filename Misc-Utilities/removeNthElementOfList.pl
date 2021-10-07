%Function to remove the Nth element of a list
%Base case if N is greater than the length of the list
removeNth([],_,[]).
%Base case if index is 0: the head is dropped, the tail is returned
removeNth([_|Tail], 0, Tail):-
    !.
%Case if still searching for the element: head is memorised to be concatenated with future valid heads and the eventual final tail of base case where index is 0
removeNth([Head|Tail], N, [Head|TailRest]):-
    N1 is N-1,
    removeNth(Tail, N1, TailRest).


