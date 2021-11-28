%Function to test if an element is a member of a list
%isMember(l, l1..ln) = 
%	l == l1;
%	isMember(l, l2..ln).
%flow(i,i)
isMember(X, [Head|Tail]):-
    X is Head;
    isMember(X, Tail).