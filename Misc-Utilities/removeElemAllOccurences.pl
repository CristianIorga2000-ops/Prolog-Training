%Function to remove all occurences of an element from a list
%Base case for empty list
removeElem([], _, []).
%Found element case
removeElem([Head|Tail], Head, TailRest):-
    removeElem(Tail, Head, TailRest). 
%Different element case
removeElem([Head|Tail], Elem, [Head|TailRest]):-
    dif(Head, Elem),
    removeElem(Tail, Elem, TailRest).
    

