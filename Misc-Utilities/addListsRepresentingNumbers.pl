%Function to sum the elements of two lists

sumTwoLists([Head1|Tail1], [Head2|Tail2], [Sum|TailRest]):-
	Sum is Head1 + Head2,
	sumTwoLists(Tail1, Tail2, TailRest).

sumTwoLists([], [], []).

sumTwoLists(List, [], List).

sumTwoLists([], List, List).
