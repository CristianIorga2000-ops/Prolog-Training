%Function to make a list contain only digits, properly adding remainders
processRemainderCore([Head|Tail], Flag, [AdjustedHead|TailRest]):-
	Sum is Head + Flag,
	AdjustedHead is mod(Sum, 10),
	(Sum > 9 ->
		NewFlag is 1;
	NewFlag is 0
	),
	processRemainderCore(Tail, NewFlag, TailRest).
	
processRemainderCore([], 1, [1]).

processRemainderCore([], 0, []).

processRemainder(List, Result):-
	processRemainderCore(List, 0, Result).
	
%Mathemathical model
%processRemainderCore(l1..ln, flag) = 
%	[], flag = 0, n = 0;
%	[1], flag = 1, n = 0;
%	[(flag+l1)%10] U processRemainderCore(l2..ln, newFlag), newFlag = 
%															1, flag+l1 > 9 
% 	.														2, flag+l1 < 9
%processRemainder(l1..ln) =
%	processRemainderCore(l1..ln, 0).

%flow(i, i/o)/