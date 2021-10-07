%EXERCISE 10 SUBPOINT B
%Determine difference of two sets represented as lists.

%Function to test if an element is a member of a list
isMember(X, [Head|Tail]):-
    X is Head;
    isMember(X, Tail).
    
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
    
%Function to calculate the difference of two set
diff([], [], []).
diff([], L2, L2).
diff([Head|Tail], L2, X):-
    isMember(Head, L2),
    removeElem(Tail, Head, NewTail),
    removeElem(L2, Head, NewL2),
    diff(NewTail, NewL2, X).
diff([Head|Tail], L2, [Head|Rest]):-
    not(isMember(Head, L2)),
    diff(Tail, L2, Rest).

