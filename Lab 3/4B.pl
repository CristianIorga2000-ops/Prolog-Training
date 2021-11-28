%LAB 3 EXERCISE 4 SUBPOINT B
%For a heterogeneous list, formed from integer numbers and list of digits, 
%	write a predicate to compute the sum of all numbers represented as sublists.

%SUMMARY
%Using the function to sum list numbers created in 4A
sumListNumbersInListCore([Head|Tail], Sum, Result):-
	atomic(Head),
	sumListNumbersInListCore(Tail, Sum, Result).

sumListNumbersInListCore([Head|Tail], Sum, Result):-
	\+atomic(Head),
	sumListNumbers(Head, Sum, NewSum),
	sumListNumbersInListCore(Tail, NewSum, Result).
	
sumListNumbersInListCore([], Sum, Sum).
	
sumListNumbersInList(List, Result):-
	sumListNumbersInListCore(List, [0], Result).
	
%Mathemathical model:
%sumListNumbersInListCore(l1..ln, sum) = 
%	sumListNumbersInListCore(l2..ln, sum), l1 is atomic, !;
%	sumListNumbersInListCore(l2..ln, sumListNumbers(sum,l2)), (l1 not atomic);
%	sum, n = 0.
%
%sumListNumbersInList(List) =
%	sumListNumbersInListCore(List, 0).

	
	
	
	
%Functions for summing list numbers	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Main (wrapper) function for summing list numbers
sumListNumbers(List1, List2, Result):-
	reverseList(List1, ReversedList1),
	reverseList(List2, ReversedList2),
	sumTwoLists(ReversedList1, ReversedList2, ReversedSum),
	processRemainder(ReversedSum, ReversedResult),
	reverseList(ReversedResult, Result).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function to reverse a given list
reverseListCore([], Result, Result).

reverseListCore([Head|Tail] , TempResult, Result):-
	reverseListCore(Tail, [Head|TempResult], Result).
	
reverseList([Head|Tail], Result) :-
	reverseListCore(Tail, [Head], Result).
	
%Mathemathical model:
%reverseListCore(l1..ln, temp) = 
%	temp, n = 0;
%	reverseListCore(l2..ln, l1 U temp).
%
%reverseList(l1..ln) =
%	reverseListCore(l2..ln, l1).

%flow=(i, i/o)/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function to sum the elements of two lists
sumTwoLists([Head1|Tail1], [Head2|Tail2], [Sum|TailRest]):-
	Sum is Head1 + Head2,
	sumTwoLists(Tail1, Tail2, TailRest).

sumTwoLists([], [], []).

sumTwoLists(List, [], List).

sumTwoLists([], List, List).

%Mathemathical model:
% sumTwoLists(l1..lx, m1..my) =
% 	[], x = 0, y = 0;
%	l1..lx, y = 0;
%	m1..my, x=0;
%   (l1 + m1) U sumTwoLists(l2..lx, m2..my).

%flow(i, i, i/o)/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%