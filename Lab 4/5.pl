%Main function
sequences(N, M, Result):-
    generateList(N, Choices),
    generateSequenceMain(N, Choices, Result),
    condition(Result, M).

%Function to generate sequences using the elements in a given list of choices
%flow(i,i,o)
%generateSequence(size, choices)= 
%	[], size = 0.
%	makeChoice(choices) + generateSequence(size-1, choices);
%makeChoice(l1 l2..ln)=
%	l1;
%	makeChoice(l2..ln).
%Base case: sequence of given size generated
generateSequence(0, _, []):- !.

generateSequence(Size, Choices, [Choice|Result]):-
    NewSize is Size - 1,
	makeChoice(Choices, Choice),
    generateSequence(NewSize, Choices, Result).

%Function to generate sequences from sizes 1 to Size
%generateSequenceMain(N, Choices)=
%	[], N = 0;
%	generateSequence(Size-1, Choices);
%	generateSequence(Size, Choices);
%flow(i,i,o)
generateSequenceMain(0, _, []):- !.

generateSequenceMain(Size, Choices, Result):-
    generateSequence(Size, Choices, Result).

generateSequenceMain(Size, Choices, Result):-
    NewSize is Size-1,
    generateSequence(NewSize, Choices, Result).

%Choose current item 
makeChoice([Head|_], Head).

%Go to next choice
makeChoice([_|Tail], Result):-
    makeChoice(Tail, Result).

%Function to generate a list with numbers from 1 to n
%generateList(N)=
%	[N] U generateList(N-1);
%	[], N is 0.
generateList(0, []):- !.
generateList(N, [N|Result]):-
    N1 is N-1,
    generateList(N1, Result).

%Assert a condition on a list
%In this case, the absolute difference between neighbours must be greater than m
%condition(l1..ln)=
%	n=1;
%	condition(l2..ln), modulo(l1-l2) >= Min
condition([_], _):- !.
condition([El1, El2|Tail], Min):-
    Diff is El1-El2,
    modulo(Diff, ModDiff),
    ModDiff >= Min,
    condition([El2|Tail], Min).
    
    
%Modulo function
%modulo(X)=
%	X, X>0;
%	-X, X<0;
%flow(i,o)
modulo(X, X):-
    X > 0, !.

modulo(X, Result):-
    Result is -X.
