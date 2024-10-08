%LAB 2 EXERCISE 2 SUBPOINT B
%b. Define a predicate to produce a list of pairs (atom n) from an initial list of atoms. In this initial list atom has n occurrences.
%Eg.: numberatom([1, 2, 1, 2, 1, 3, 1], X) => X = [[1, 4], [2, 2], [3, 1]].

%occurences(l1 l2..ln) =
%	[], n = 0
%	removeElem(l1..ln, l1, NewTail, Count), [l1, Count] U occurences(NewTail)

%removeElem(l1 l2..ln, elem, NewTail, Count) = 
%	[], n = 0
%	removeElem(l2 .. ln, elem, NewTail, Count), Count = 1 + RestCount, l1 == elem
%	removeElem(l2 .. ln, elem, NewTail, Count), l1 != elem



%flow(i, i/o)/

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
    
%Function to produce a list of pairs containing each appearing element in a list together with the number of its occurences
occurences([],[]).
occurences([Head|Tail], [[Head, FinalCount]|Rest]):-
    removeElem(Tail, Head, NewTail, Count),
    FinalCount is Count+1,
    occurences(NewTail, Rest).