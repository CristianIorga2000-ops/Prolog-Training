%LAB 4 EXERCISE 11
%“Colouring” a map. n countries are given; write a predicate to determine
%	 all possibilities of colouring n countries with m colours, such that
%	 two adjacent countries not having the same colour.
%

/*
Example query:
generateMatches([romania, moldavia, hungary, italy],
                [blue, red, yellow],
                [(romania, [moldavia, hungary])],
                X).
*/

% The main function
%Countries: [c1, c2, .., cn];
%Colours: [cl1, cl2, .., cln];
%CountryRelations: [(cm1, [c1, c2, .., cn]),..], 
%	neighbours(cm1) = [c1, c2, .., cn],
%	V neighbour e neighbours(country), neighbour e Countries
%flow(i, i, i, o)
generateMatches(Countries, ColoursChoices, CountriesRelations, CountriesColours):- 
    getLen(Countries, LenCountries),
    create(LenCountries, CountriesColours),
    insertElementsLeft(Countries, CountriesColours),
    generateSequence(LenCountries, ColoursChoices, Colours),
    insertElementsRight(Colours, CountriesColours),
    populationControl(CountriesColours, CountriesRelations).

%Function to create a list of N empty (_Country, _Colour) tuples
%flow(i,o).
%create(N) =
%	[], N = 0, !;
%	(_Country,_Colour) U create(N-1).
create(0, []):- !.
create(N, [(_Country, _Colour)|Tail]):-
       N1 is N-1,
       create(N1, Tail).

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
    
%Choose current item 
makeChoice([Head|_], Head).

%Go to next choice
makeChoice([_|Tail], Result):-
    makeChoice(Tail, Result).

% Functions to insert the elements of a list into a position (left or right)
% 	of each corresponding tuple of a list of tuples
% insertElementsLeft(Elements, List)
% insertElementsLeft (c1..cn, l1..lm) = 
% 	insertElementsLeft(c2..cn, l2..lm), l1 = (c1,_);
% 	n == 0;
% 	m == 0;
% insertsElementRight(...) = ... (_, c1); ...
% flow(i,i).
%Insert elements in the left side of the tuple (for countries)
insertElementsLeft([], _):- !.
insertElementsLeft(_, []):- !.
insertElementsLeft([Element|Tail], [(Element, _)|TailElements]):-
    insertElementsLeft(Tail, TailElements). 

%Insert elements in the right side of the tuple (for colours)
insertElementsRight([], _):- !.
insertElementsRight(_, []):- !.
insertElementsRight([Element|Tail], [(_, Element)|TailElements]):-
    insertElementsRight(Tail, TailElements).       

%Function to test if an element is a member of a list
%isMember(l, l1..ln) = 
%	l == l1;
%	isMember(l, l2..ln).
%flow(i,i)
isMember(X, [Head|Tail]):-
    X = Head;
    isMember(X, Tail).
        
%Function to get the length of a list
%getLen(l1..ln) = 
%	1 + getLen(l2..ln);
%	0, n = 0
%flow(i, o)

%Base case 
getLen([], 0):- !.
%Recursive form, adds 1 to length for each recursion up until the base case
getLen([_| Tail], Length):-
    getLen(Tail, Remainder),
    Length is 1 + Remainder.

% Function to get the neighbours of a country
% No defined neighbours base case
neighbours(_, [], []):- !.
% Found neighbours base case
neighbours(Country, [(Country, NeighboursList)|_], NeighboursList):- !.
neighbours(Country, [_|Tail], NeighboursList):-
    neighbours(Country, Tail, NeighboursList).

% Function to verify if Neighbour is a one-sided neighbour for Country
%	one-sided -> appears in Country`s neighbours list
%	but we don`t verify that Country appears Neighbour`s neighbours list
% flow(i,i,i).
isNeighbour(Country, Neighbour, CountriesRelations):-
    neighbours(Country, CountriesRelations, NeighboursList), 
    isMember(Neighbour, NeighboursList).

%Function to verify 2 countries are neighbours
%flow(i, i, i)
areNeighbours(Country1, Country2, CountriesRelations):-
    isNeighbour(Country1, Country2, CountriesRelations);
    isNeighbour(Country2, Country1, CountriesRelations).

% Function to assert a population condition on a list
% In our case, population control states that:
% 	1) no two neighbouring elements can have the same colours
% 	2) a country must have a valid colour
% 	
% populationControl(CountriesColours, CountriesRelations)
% populationControlCore((c, cl), (c1, cl1)..(cn, cln), CR)=
% 	populationControlCore((c, cl), (c2, cl2)..(cn,cln), CR),
% 		areNeighbours(c, c1), cl != cl1;
% 		
% 	populationControlCore((c, cl), (c2, cl2)..(cn,cln), CR),
% 		!(areNeighbours(c, c1));
% 		
% 	n = 0.
% flow(i, i)
%Wrapper function
populationControl([Head|Tail], CountriesRelations):-
    populationControlCore(Head, Tail, CountriesRelations).
%Succes check case
populationControlCore(_, [], _):- !.
%Neighbours case
populationControlCore((Country, Colour),[(Country1,Colour1)|Tail], CountriesRelations):-
    areNeighbours(Country, Country1, CountriesRelations), !,
    Colour \= Colour1,
    populationControlCore((Country, Colour), Tail, CountriesRelations).
%Not neighbours
populationControlCore(Tuple, [_|Tail], CountriesRelations):-
    populationControlCore(Tuple, Tail, CountriesRelations).

    



