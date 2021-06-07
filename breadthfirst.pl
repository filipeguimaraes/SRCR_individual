:- dynamic contentor/6.

prepend([H|T]/Capacidade, X, [X,H | T]/RCapacidade):-
    contentor(X,_,_,_,TipoLixoProx,Litros),
    contentor(H,_,_,_,TipoLixo,_),
    TipoLixoProx == TipoLixo,
    RCapacidade is Capacidade - Litros
    .

prepend([H|T]/Capacidade, X, [X,H | T]/RCapacidade):-
    contentor(X,_,_,_,TipoLixoProx,_),
    contentor(H,_,_,_,TipoLixo,_),
    \+ TipoLixoProx == TipoLixo,
    RCapacidade is Capacidade.

breadthFirst(Succ, [[State | Path]/C | Queue], Visited, Capacidade, Distancia, Solution) :-
    findall(X, call(Succ, State, X, _), Next),
    subtract(Next, Visited, Nexts),
    list_to_set(Nexts, Next1),
    maplist(prepend([State | Path]/C), Next1, Next2),
    C>0,
    append(Queue, Next2, Queue2),
    append(Next1, Visited, Visited1),
    breadthFirst(Succ, Queue2, Visited1, Capacidade, Distancia, Solution).

breadthFirst(Succ, [[State | Path]/C | Queue], Visited, Capacidade, Distancia, Solution) :-
    findall(X, call(Succ, State, X, _), Next),
    subtract(Next, Visited, Nexts),
    list_to_set(Nexts, Next1),
    maplist(prepend([State | Path]/C), Next1, Next2),
    C =< 0,
    append(Queue, Next2, Queue2),
    append(Next1, Visited, Visited1),
    breadthFirst(Succ, Queue2, Visited1, Capacidade, Distancia, Solution).
    

breadthFirst(_, [R/Cap | _], _, _, Distancia, R).

breadthFirst(Succ, Start, Goal, Solution) :-
    contentor(Start,_,_,_,_,_),
    breadthFirst(Succ, [[Start]/15000], [Start], Goal, 0, Solution1),
    reverse(Solution1, Solution)
.