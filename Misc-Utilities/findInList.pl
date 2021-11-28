% Find an element in a list

% Found element
findInListCore(Index, [Head|Tail], Head, Index):- !.
findInListCore(Index, [Head|Tail], Match, Position):-
	NewIndex is Index+1,
	findInListCore(NewIndex, Tail, Match, Position).

%flow(i, i/o, i/o)
findInList(List, Match, Index):-
	findInListCore(0, List, Match, Index).
	
% Mathemathical model
% findInListCore(i, l1..ln, l) =
%	findInListCore(i+1, l2..ln, l), l1 != l;
%	i, l1 == l.
