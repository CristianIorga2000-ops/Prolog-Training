%Function to remove first occurence an element from a list
%Base case for empty list
removeElem([], _, []).
%Base case for found element
removeElem([Head|Tail], Head, Tail).
%Still searching case
removeElem([Head|Tail], Elem, [Head|TailRest]):-
    dif(Head, Elem),
    removeElem(Tail, Elem, TailRest).
    

