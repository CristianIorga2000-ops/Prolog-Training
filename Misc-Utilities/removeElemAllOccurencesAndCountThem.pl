%Function to remove all occurences of an element from a list and count those occurences
%Base case for empty list
removeElem([], _, [], 0).
%Found element case
removeElem([Head|Tail], Head, TailRest, Count):-
    removeElem(Tail, Head, TailRest, RestCount),
    Count is 1 + RestCount.
%Different element case
removeElem([Head|Tail], Elem, [Head|TailRest], Count):-
    dif(Head, Elem),
    removeElem(Tail, Elem, TailRest, Count).