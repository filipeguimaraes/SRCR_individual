% Base de conhecimento

:- include('dados/contentores.pl').
:- include('dados/ligacoes2.pl').

:- dynamic contentor/6.
:- dynamic ligacao/3.


:- include('algoritmos/breadthfirst.pl').
:- include('algoritmos/depthfirst.pl').
:- include('algoritmos/aestrela.pl').

camiao(0, 15000).

testAEstrela(R):- 
    resolve_aestrela(0,R,1500).

testBf(R):-
    breadthFirst(ligacao,0,15000,R).

testDf(R):-
    recolhaLixo(0,0,[0],"Lixos",15000,0,R).



