%Function to reverse a given list

reverseListCore([], Result, Result).

reverseListCore([Head|Tail] , TempResult, Result):-
	reverseListCore(Tail, [Head|TempResult], Result).
	
reverseList([Head|Tail], Result) :-
	reverseListCore(Tail, [Head], Result).
	
%Mathemathical model:
%reverseListCore(l1..ln, temp) = 
%	temp, n = 0;
%	reverseListCore(l2..ln, l1 U temp)
%
%reverseList(l1..ln) =
%	reverseListCore(l2..ln, l1)

%flow=(i, i/o)/
	
