%LAB 2 EXERCISE 2 SUBPOINT A
%Write a predicate to remove all occurrences of a certain atom from a list.
%We will use the misc function from removeElemAllOccurences

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
    

