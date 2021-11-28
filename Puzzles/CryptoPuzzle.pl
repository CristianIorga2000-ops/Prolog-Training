% https://www.brainzilla.com/logic/zebra/cryptocoins-mania/

% A human has: shirt, name, cryptocoin, amount, password, sold.
% Let a human be a tuple of these attributes, we will define a list of humans:

% The solution idea is to instantiate a list of humans (as tuples) together with all the 
%	conditions that must be met (written as hints). 

% We need a list of humans as tuples, where each position in the list represents the house 
% Below we define the predicate to create such a list

%humans(i, i/o).	
%humans(N, HumansList) - Creates a list with N tuples of form (_Shirt,_Name,_Cryptocoin,_Amount,_Password,_Sold)

% Base case for empty list
humans(0, []):- !.
humans(N, [(_Shirt,_Name,_Cryptocoin,_Amount,_Password,_Sold)|T]):-
    N1 is N-1,
    humans(N1, T).


% Below are predicates for getting the N-th element of the list to correspond to a tuple	
	
% humans(i/o, i/o, i/o)
% Only used as humans(i, i, i).
% humans(N, HumansList, Pattern) - is used as a declaration that the tuple at position N in the
%	HumansList must match the tuple Pattern

%base case - found element
humans(1, [H|_], H):- !.
humans(N, [_|T], R):- 
       N1 is N-1,
       humans(N1, T, R).
% The next step is to translate the hints into predicates
% They will later be used to instantiate the list of humans
% A hint is simply a statement given as hypothesis by the puzzle problem.
% A hint can be of 3 main types:
%	1) Existence declaration hint, which declares the existence of a tuple pattern
%		anywhere in the list
%		ex: h([(town, newOrleans, _, _, _, _)|_]).
%			'There is a tuple in the list that looks like that' or
%			'There is a town in New Orleans...'
%			h([_|T]):- h(T). - recursively goes trough all the list to say
%								'There can be someone like this on any position!'
%								
%	2) Neighborhood declaration hint, which declares a tuple pattern is to the left/
%		to the right/ next to (left or right) another tuple pattern
%		ex: h([(billy,_,_,_,_,_),(john,_,_,_,_,_)|_]).
%			'Billy is to the left of John!' or
%			'John is to the right of Billy'
%			h([_|T]):- h(T).
%			
%			h([(billy,_,_,_,_,_),(john,_,_,_,_,_)|_]).
%			h([(john,_,_,_,_,_),(billy,_,_,_,_,_)|_]).
%			h([_|T):- h(T).
%			'Billy is next to John! (Either left or right of John)' or
%			'John is next to Billy!'
%		
%	3) Position pattern declaration hint, which declares that a pattern exists
%		on a certain position in the list.
%		h(1, HumansList, (skywalker, _, _, _, _, _)).
%		'There is a dude names skywalker on position 1' or
%		'There is a Star Wars reference on position 1...'
%		Note that there is no need to have a recursive function.
%		This declaration is only for a certain position.
%		
%	4) Approximate relative position, which declares that a pattern exists
%		somwhere to the left/ right of a pattern.
%		???
%		hint99(Humans):-
%		humans(N2, Humans, (right,_,_,_,_,_)),
%		humans(N1, Humans, (left,_,_,_,_,_)),
%    	N1 < N2.
%    	Does not work..
%
% Russell is exactly to the right of the man who sold the Boat to buy cryptocoins.
h1([(_,_,_,_,_,boat),(_,russell,_,_,_,_)|_]).
h1([_|T]):- h1(T).

% The one that uses his favorite site's name as his password is at one of the ends.
h2(Humans):- humans(1, Humans, (_,_,_,_,favsite,_)).
h2(Humans):- humans(5, Humans, (_,_,_,_,favsite,_)).

% At the first position is the enthusiast that sold his Bike.
h3(Humans):- humans(1, Humans, (_,_,_,_,_,bike)).
%%%%
% The man wearing the Green shirt is somewhere between the man who has BrainCoins and the man who sold his Computer, in that order.
h4(Humans).
h4([_|T]):- h4(T).

% In the middle is the man that has 100 coins.
h20(Humans):- humans(3, Humans, (_,_,_,100,_,_)).

% The enthusiast that has Coinzillas is next to the enthusiast that has the biggest amount of coins.
h5([(_,_,coinzilla,_,_,_),(_,_,_,500,_,_)|_]).
h5([(_,_,_,500,_,_),(_,_,coinzilla,_,_,_)|_]).
h5([_|T]):- h5(T).

% The man wearing the White shirt is somewhere to the left of the man who has his dog's name as his password.
h6(Humans).
h6([_|T]):- h6(T).

% Oliver is exactly to the left of the enthusiast that has SudoCoins.
h7([(_,oliver,_,_,_,_),(_,_,sudocoin,_,_,_)|_]).
h7([_|T]):- h7(T).

% The man who sold his family Jewelry to buy cryptocoins is exactly to the right of the man who has Coinzillas.
h8([(_,_,coinzilla,_,_,_),(_,_,_,_,_,familyjewelry)|_]).
h8([_|T]):- h8(T).

% At the fifth position is someone whose password has only numbers.
h9(Humans):- humans(5, Humans, (_,_,_,_,numbersonly,_)).

% The enthusiast that has 500 coins is next to the enthusiast that sold his Computer to buy cryptocoins.
h10([(_,_,_,500,_,_),(_,_,_,_,_,computer)|_]).
h10([(_,_,_,_,_,computer),(_,_,_,500,_,_)|_]).
h10([_|T]):- h10(T).

% The man wearing the Yellow shirt is at the fourth position.
h11(Humans):- humans(4, Humans, (yellow,_,_,_,_,_)).

% Leslie is exactly to the right of the man who sold his family Jewelry.
h12([(_,_,_,_,_,familyjewelry),(_,leslie,_,_,_,_)|_]).
h12([_|T]):- h12(T).

% Eugene is wearing the Green shirt.
h13([(green,eugene,_,_,_,_)|_]).
h13([_|T]):- h13(T).

% At the third position is the enthusiast that uses the strongest password to keep his coins protected.
h14(Humans):- humans(3, Humans, (_,_,_,_,strongest,_)).

% Russell is exactly to the left of the man that has 400 coins.
h15([(_,russell,_,_,_,_),(_,_,_,400,_,_)|_]).
h15([_|T]):- h15(T).

% At one of the ends is the man who sold his Computer.
h16(Humans):- humans(1, Humans, (_,_,_,_,_,computer)).
h16(Humans):- humans(5, Humans, (_,_,_,_,_,computer)).

% The man wearing the Black shirt is at the first position.
h17(Humans):- humans(1, Humans, (black,_,_,_,_,_)).

% Someone has precisely 300 IQCoins.
h18([(_,_,iqcoins,300,_,_)|_]).
h18([_|T]):- h18(T).

% The enthusiast that sold his family Jewelry is next to the enthusiast wearing the White shirt.
h19([(white,_,_,_,_,_),(_,_,_,_,_,familyjewelry)|_]).
h19([(_,_,_,_,_,familyjewelry),(_,_,_,_,_,white)|_]).
h19([_|T]):- h19(T).

% Hidden hints are hints that are not given as hypothesis (as it would be normal),
%	because the creator of the puzzle was a weak man.
% They are found in the list of possible answers.
% 	ex: There is NO mention of logicoin in the hypothesis.
%		There is mention of logicoin in the list of possible answers.
%	=>	hiddenHint([(_, _, logicoin, _, _, _)|_]).
%		hiddenHint([_|T]): - hiddenHint(T).
%		'There must be someone owning logicoin, somewhere...'

hiddenHint1([(blue,_,_,_,_,_)|_]).
hiddenHint1([_|T]):- hiddenHint1(T).

hiddenHint2([(_,charles,_,_,_,_)|_]).
hiddenHint2([_|T]):- hiddenHint2(T).

hiddenHint3([(_,_,logicoin,_,_,_)|_]).
hiddenHint3([_|T]):- hiddenHint3(T).

hiddenHint4([(_,_,_,200,_,_)|_]).
hiddenHint4([_|T]):- hiddenHint4(T).

hiddenHint5([(_,_,_,_,qwert,_)|_]).
hiddenHint5([_|T]):- hiddenHint5(T).

hiddenHint6([(_,_,_,_,_,car)|_]).
hiddenHint6([_|T]):- hiddenHint6(T).

% The solution is of course a list of 5 humans that meets all the conditions 
%	imposed by the hints.
% After doing the hard repetitive work of translating the hints into Prolog 
%		predicates, it is time to leave the computer commit acts of unfathomable
%		magic and instantly calculate such a list.
% All we need to do is say: 
% 	- Computer! Please give me a list of 5 humans. Here are some hints about how it
%		should look like.
% As below:


solution(Humans):-
    humans(5, Humans),
    hiddenHint1(Humans),
    hiddenHint2(Humans),
    hiddenHint3(Humans),
    hiddenHint4(Humans),
    hiddenHint5(Humans),
    hiddenHint6(Humans),
    h1(Humans),
    h2(Humans),    
    h3(Humans),    
    h4(Humans),    
    h5(Humans),    
    h6(Humans),    
    h7(Humans),    
    h8(Humans),    
    h9(Humans),    
    h10(Humans),    
    h11(Humans),    
    h12(Humans),    
    h13(Humans),    
    h14(Humans),    
    h15(Humans),    
    h16(Humans),    
    h17(Humans),    
    h18(Humans),    
    h19(Humans),    
    h20(Humans).    
    