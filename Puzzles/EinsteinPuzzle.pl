%ALL THE DEFINED FACTS, GROUPED BY DEFINING PREDICATE
lives(brit, House):-
	colour(House, red).
lives(norwegian, 1).

toLeft(House1, House2):-
	colour(House1, green),
	colour(House2, white).

drinks(dane, tea).
drinks(Owner, coffee):-
	owns(House, Owner),
	colour(House, green).
	
drinks(Owner, milk):-owns(centerhouse, Owner).
drink(Owner, beer):-smokes(Owner, bluemaster).

keepsPets(swede, dogs).
keepsPets(Owner, birds):-smokes(Owner, pallmall).

smokes(Owner, dunhill):-
	owns(House, Owner),
	colour(House, yellow).
smokes(german, prince).

livesNextToHuman(Owner, Neighbour):-
	smokes(Owner, blends),
	keepsPets(Neighbour, cats).
livesNextToHuman(Owner, Neighbour):-
	keepsPets(Owner, horses),
	smokes(Neighbour, dunhill).
livesNextToHuman(Owner, Neighbour):-
	drinks(Neighbour, water),
	smokes(Owner, blends).

livesNextToHouse(norwegian, House):-
	colour(House, blue).

%ADDITIONAL DEFINITIONS
%Center is 3
owns(centerhouse, Owner) :- owns(3, Owner).

%Owner-lives relationship
lives(Owner, House):-
	owner(Owner, House).
owner(Owner, House):-
	lives(Owner, House).

%left-right relationship
toRight(House1, House2):-
	toLeft(House2, House1).
toLeft(House1, House2):-
	toRight(House2, House1).

%livesNextToHuman-livesNextToHuman relationship
livesNextToHuman(Owner, Neighbour):-
	livesNextToHouse(Owner, NeighbourHouse),
	owner(Neighbour, NeighbourHouse).

livesNextToHouse(Owner, House):-
	livesNextToHuman(Owner, Neighbour),
	owner(Neighbour, House).

%left, right definitions
toLeft(House1, House2):-
	House1 is House2-1.

toRight(House1, House2):-
	House1 is House2+1.
	
%livesNextToHouse definitions
livesNextToHouse(Owner, House):-
	owner(Owner, OwnerHouse),
	toLeft(House, OwnerHouse);
	toRight(House, OwnerHouse).	
	
