%EXERCISE 10 SUBPOINT A
%. Determine the number formed by adding all even elements and subtracting all odd numbers of the list.


%Base case
sum_list([], 0).

%Even number
sum_list([H|T], Sum) :-
   sum_list(T, Rest),
   Sum is H + Rest,
   H mod 2 =:= 0.
   
%Odd number
sum_list([H|T], Sum) :-
   sum_list(T, Rest),
   Sum is -H + Rest,
   H mod 2 =:= 1.
 