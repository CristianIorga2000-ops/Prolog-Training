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
%   (l1 + m1) U sumTwoLists(l2..lx, m2..my)

%flow(i, i, i/o)/