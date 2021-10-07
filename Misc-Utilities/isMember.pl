%Function to test if an element is a member of a list
isMember(X, [Head|Tail]):-
    X is Head;
    isMember(X, Tail).