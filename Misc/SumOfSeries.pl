list_sum_core([Item], Item).
list_sum_core([Item1,Item2 | Tail], Total) :-
    list_sum_core([Item1+Item2|Tail], Total).
    
list_sum(List):-
    list_sum_core(List, X),
    Y is X,
    write(Y).