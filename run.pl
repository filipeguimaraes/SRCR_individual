% Base de conhecimento

set_prolog_flag(stack_limit, 2_147_483_648).

:- include('dados/contentores.pl').
:- include('dados/ligacoes.pl').

:- dynamic contentor/6.
:- dynamic ligacao/3.


:- include('breadthfirst.pl').
:- include('aestrela.pl').

camiao(0, 15000).

testAEstrela(R):- 
    findall((S),(resolve_aestrela(0,S,500)),R).

testBf(R):-
    breadthFirst(ligacao,0,1000,R).



testeRecolha(R):-
    recRecolha([0],R).%recolhaLixo(0,0,[0],"Lixos",15000,0,R),print(R).

recRecolha([H|R],[H|R]):-
    findall(A,contentor(A,_,_,_,_,_),TS),
    subset(TS,[H|R]).
recRecolha(R,Return):-
    recolhaLixo(0,0,R,"Lixos",15000,0,R1),
    recRecolha(R1, Return).









recolhaLixo(Garagem,Descarga,[Atual|Recolhidos],TipoLixo, Capacidade, DistanciaPercorrida,R):-
    proximosContentores(Atual, Recolhidos, Proximos, Capacidade),
    member(Proximo, Proximos),
    ligacao(Atual,Proximo,Distancia),
    contentor(Proximo,_,_,_,TipoLixoProx,Litros),
    RCapacidade is Capacidade - Litros,
    RCapacidade > 0,
    RDistanciaPercorrida is DistanciaPercorrida + Distancia,
    TipoLixoProx == TipoLixo,
    recolhaLixo(Garagem, Descarga, [Proximo,Atual|Recolhidos],TipoLixo, RCapacidade, RDistanciaPercorrida,R).

recolhaLixo(Garagem,Descarga,[Atual|Recolhidos],TipoLixo, Capacidade, DistanciaPercorrida,R):-
    proximosContentores(Atual, Recolhidos, Proximos, Capacidade),
    member(Proximo, Proximos),
    ligacao(Atual,Proximo,Distancia),
    contentor(Proximo,_,_,_,TipoLixoProx,Litros),
    RCapacidade is Capacidade - Litros,
    RCapacidade > 0,
    \+ TipoLixoProx == TipoLixo,
    RDistanciaPercorrida is DistanciaPercorrida + Distancia,
    recolhaLixo(Garagem, Descarga, [Proximo,Atual|Recolhidos],TipoLixo, Capacidade, RDistanciaPercorrida,R).


recolhaLixo(Garagem,Descarga,[Atual|Recolhidos],TipoLixo, Capacidade, DistanciaPercorrida,[Atual|Recolhidos]):-
    proximosContentores(Atual, Recolhidos, Proximos, Capacidade),
    member(Proximo, Proximos),
    ligacao(Atual,Proximo,Distancia),
    contentor(Proximo,_,_,_,TipoLixoProx,Litros),
    TipoLixoProx == TipoLixo,  
    RCapacidade is Capacidade - Litros,
    RCapacidade =< 0,
    print("---------------"),
    print(RCapacidade).
    

recolhaLixo(Garagem,Descarga,[Atual|Recolhidos],TipoLixo, Capacidade, DistanciaPercorrida,[Atual|Recolhidos]).

%recolhaLixo(Garagem,Descarga,[Atual|Recolhidos],TipoLixo, Capacidade, DistanciaPercorrida,[Atual|Recolhidos]):-
%    print(Capacidade)
%    .



proximosContentores(Atual, Recolhidos, Ps, Capacidade):-
    findall(Proximo, ligacao(Atual,Proximo,Distancia),ProxsAux1),
    list_to_set(ProxsAux1,Proximos),   
    removeEqual(Recolhidos,Proximos,Ps).%, print(Ps).



    
removeEqual([],L,L).
removeEqual([H|T],L,R) :-
    removeEqual(T,L,RL),
    delete(RL,H,R)
.