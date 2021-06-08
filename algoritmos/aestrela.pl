:- dynamic contentor/6.
:- dynamic ligacao/3.

resolve_aestrela(Nodo, Caminho/Custo, Capacidade) :-
	contentor(Nodo,_,_,_,_, Capacidade1),
	aestrela([[Nodo]/0/Capacidade1], InvCaminho/Custo/_, Capacidade),
	reverse(InvCaminho, Caminho).

aestrela(Caminhos, SolucaoCaminho, Capacidade) :-
	obtem_melhor(Caminhos, MelhorCaminho),
	seleciona(MelhorCaminho, Caminhos, OutrosCaminhos),
	expande_aestrela(MelhorCaminho, ExpCaminhos),
	append(OutrosCaminhos, ExpCaminhos, NovoCaminhos),
	aestrela(NovoCaminhos, SolucaoCaminho, Capacidade).	

aestrela(Caminhos, Caminho, Capacidade) :-
    obtem_melhor(Caminhos, Caminho),
    Caminho = [Nodo|_]/_/Cap,Cap<Capacidade.


expande_aestrela(Caminho, ExpCaminhos) :-
	findall(NovoCaminho, move_aestrela(Caminho,NovoCaminho), ExpCaminhos).

move_aestrela([Nodo|Caminho]/Custo/_, [ProxNodo,Nodo|Caminho]/NovoCusto/Est) :-
	ligacao(Nodo, ProxNodo, PassoCusto),\+ member(ProxNodo, Caminho),
	NovoCusto is Custo + PassoCusto,
	contentor(ProxNodo,_,_,_,_, Est).	
	

obtem_melhor([Caminho], Caminho) :- !.

obtem_melhor([Caminho1/Custo1/Est1,_/Custo2/Est2|Caminhos], MelhorCaminho) :-
	Est1 =< Est2, !, 
	obtem_melhor([Caminho1/Custo1/Est1|Caminhos], MelhorCaminho).
	
obtem_melhor([_|Caminhos], MelhorCaminho) :- 
	obtem_melhor(Caminhos, MelhorCaminho).





goal([],Cap):-
    Cap < 0.

goal([H|T],Cap):-
    contentor(H,_,_,_,_, Capacidade),
    RCap is Cap - Capacidade,
    goal(T,RCap).


seleciona(E, [E|Xs], Xs).
seleciona(E, [X|Xs], [X|Ys]) :- seleciona(E, Xs, Ys).
