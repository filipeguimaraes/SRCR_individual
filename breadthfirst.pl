:- dynamic contentor/6.
% helper predicate
prepend([H|T]/Capacidade, X, [X,H | T]/RCapacidade):-
    contentor(X,_,_,_,TipoLixoProx,Litros),
    contentor(H,_,_,_,TipoLixo,_),
    TipoLixoProx == TipoLixo,
    RCapacidade is Capacidade + Litros
    .

prepend([H|T]/Capacidade, X, [X,H | T]/Capacidade):-
    contentor(X,_,_,_,TipoLixoProx,_),
    contentor(H,_,_,_,TipoLixo,_),
    \+ TipoLixoProx == TipoLixo
    .
% if goal is at the head of the queue, return it
breadthFirst(_, [Rest/C | _], _, Goal, Rest):- C>Goal-200,C<Goal.

% main recursive predicate: breadth_first(+Succ, +Queue, +Visited, +Goal, -Solution)
breadthFirst(Succ, [[State | Path]/C | Queue], Visited, Capacidade, Solution) :-
    findall(X, call(Succ, State, X, _), Next),            % find all neighboring states
    subtract(Next, Visited, Nexts),                       % remove already-visited states
    list_to_set(Nexts, Next1),                            % remove duplicates
    maplist(prepend([State | Path]/C), Next1, Next2),     % prepend each state to path
    append(Queue, Next2, Queue2),                         % add all new states to queue
    append(Next1, Visited, Visited1),                     % add all new states to visited set
    breadthFirst(Succ, Queue2, Visited1, Capacidade, Solution). % recurse
    


% top-level predicate: breadth_first(+Succ, Start, +Goal, -Solution)
breadthFirst(Succ, Start, Goal, Solution) :-
    contentor(Start,_,_,_,_,Litros),
    breadthFirst(Succ, [[Start]/Litros], [Start], Goal, Solution1),
    reverse(Solution1, Solution)
.