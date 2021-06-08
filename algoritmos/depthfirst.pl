
:- dynamic contentor/6.
:- dynamic ligacao/3.

recolhaLixo(Garagem,Descarga,[Atual|Recolhidos],TipoLixo, Capacidade, DistanciaPercorrida,R):-
    proximosContentores(Atual, [Atual|Recolhidos], Proximos),
    member(Proximo, Proximos),
    ligacao(Atual,Proximo,Distancia),
    contentor(Proximo,_,_,_,TipoLixoProx,Litros),
    TipoLixoProx == TipoLixo,
    RCapacidade is Capacidade - Litros,
    RCapacidade > 0,
    RDistanciaPercorrida is DistanciaPercorrida + Distancia,
    recolhaLixo(Garagem, Descarga, [Proximo,Atual|Recolhidos],TipoLixo, RCapacidade, RDistanciaPercorrida,R).

recolhaLixo(Garagem,Descarga,[Atual|Recolhidos],TipoLixo, Capacidade, DistanciaPercorrida,R):-
    proximosContentores(Atual, [Atual|Recolhidos], Proximos),
    member(Proximo, Proximos),
    ligacao(Atual,Proximo,Distancia),
    contentor(Proximo,_,_,_,TipoLixoProx,Litros),
    TipoLixoProx == TipoLixo,  
    RCapacidade is Capacidade - Litros,
    RCapacidade =< 0,
    NovaCapacidade is 15000 - Litros,
    RDistanciaPercorrida is DistanciaPercorrida + DistanciaPercorrida + DistanciaPercorrida + Distancia , 
    recolhaLixo(Garagem,Descarga,[Proximo,Descarga,Atual|Recolhidos],TipoLixo,NovaCapacidade,RDistanciaPercorrida,R).

recolhaLixo(Garagem,Descarga,[Atual|Recolhidos],TipoLixo, Capacidade, DistanciaPercorrida,R):-
    proximosContentores(Atual, [Atual|Recolhidos], Proximos),
    member(Proximo, Proximos),
    ligacao(Atual,Proximo,Distancia),
    contentor(Proximo,_,_,_,TipoLixoProx,_),
    \+ TipoLixoProx == TipoLixo,
    RDistanciaPercorrida is DistanciaPercorrida + Distancia,
    recolhaLixo(Garagem, Descarga, [Proximo,Atual|Recolhidos],TipoLixo, Capacidade, RDistanciaPercorrida,R).
    
recolhaLixo(Garagem,Descarga,R,TipoLixo, Capacidade, DistanciaPercorrida,R):- print(DistanciaPercorrida),!.

proximosContentores(Atual, Recolhidos, Ps):-
    findall(Proximo, ligacao(Atual,Proximo,Distancia),ProxsAux1),
    list_to_set(ProxsAux1,Proximos),   
    removeEqual(Recolhidos,Proximos,Ps).%, print(Ps).

removeEqual([],L,L).
removeEqual([H|T],L,R) :-
    removeEqual(T,L,RL),
    delete(RL,H,R)
.