/*
 * Pokedex Discovery
 * 
 * Carolina França Pimentel de Cirqueira - 029191061
 * Gabriel Borges Calheiros - 029181066
 * Guilherme Luiz Garcia Lefrançois - 029181030
 * Lucas Ruan Andrade Almeida - 029201064
 * 
*/

/* Padrão da resposta */
go :- hypotesis(Pokemon),
    write('O Pokémon em questão provavelmente é: '),
    write(Pokemon),
    nl,
    undo.

/* Teste de hipóteses */
hypotesis(corphish) :- corphish, !.
hypotesis(crawdaunt) :- crawdaunt, !.
hypotesis(paras) :- paras, !.
hypotesis(parasect) :- parasect, !.
hypotesis(growlithe) :- growlithe, !.
hypotesis(arcanine) :- arcanine, !.
hypotesis(buizel) :- buizel, !.
hypotesis(floatzel) :- floatzel, !.
hypotesis(bellsprout) :- bellsprout, !.
hypotesis(victreebel) :- victreebel, !.
hypotesis(ponyta) :- ponyta, !.
hypotesis(rapidash) :- rapidash, !.
hypotesis(squirtle) :- squirtle, !.
hypotesis(blastoise) :- blastoise, !.
hypotesis(tangela) :- tangela, !.
hypotesis(tangrowth) :- tangrowth, !.
hypotesis(cyndaquil) :- cyndaquil, !.
hypotesis(typhlosion) :- typhlosion, !.
hypotesis(basculin) :- basculin, !.
hypotesis(politoed) :- politoed, !.
hypotesis(chikorita) :- chikorita, !.
hypotesis(meganium) :- meganium, !.
hypotesis(unknown). /* Desconhecido */

/* Regras para identificação das hipóteses (Pokémons) */
corphish :- 
    vermelho,
    agua,
    verify(nao_evoluiu).

crawdaunt :- 
    vermelho,
    agua,
    verify(eh_evoluido).

paras :-
    vermelho,
    planta,
    verify(nao_evoluiu).    

parasect :-
    vermelho,
    planta,
    verify(eh_evoluido).

growlithe :-
    vermelho,
    fogo,
    verify(nao_evoluiu).

arcanine :- 
    vermelho,
    fogo,
    verify(eh_evoluido).

buizel :-
    amarelo,
    agua,
    verify(nao_evoluiu).

floatzel :-
    amarelo,
    agua,
    verify(eh_evoluido).

bellsprout :- 
    amarelo,
    planta,
    verify(nao_evoluiu).

victreebel :-
    amarelo,
    planta,
    verify(eh_evoluido).

ponyta :-
    amarelo,
    fogo,
    verify(nao_evoluiu).

rapidash :-
    amarelo,
    fogo,
    verify(eh_evoluido).

squirtle :-
    azul,
    agua,
    verify(nao_evoluiu).

blastoise :-
    azul,
    agua,
    verify(eh_evoluido).

tangela :-
    azul,
    planta,
    verify(nao_evoluiu).

tangrowth :-
    azul,
    planta,
    verify(eh_evoluido).

cyndaquil :-
    verde,
    fogo,
    verify(nao_evoluiu).

typhlosion :-
    verde,
    fogo,
    verify(eh_evoluido).

basculin :-
    verde,
    agua,
    verify(nao_evoluiu).

politoed :-
    verde,
    agua,
    verify(eh_evoluido).

chikorita :-
    verde,
    planta,
    verify(nao_evoluiu).

meganium :-
    verde,
    planta,
    verify(eh_evoluido).

/* Classificações */
vermelho :-
    verify(eh_vermelho).

agua :-
    verify(tipo_agua).

amarelo :-
    verify(eh_amarelo).

azul :-
    verify(eh_azul).

verde :-
    verify(eh_verde).

planta :-
    verify(tipo_planta).

fogo :-
    verify(tipo_fogo).

/* Padrão das perguntas */
ask(Pergunta) :-
    write('O Pokémon em questão tem a seguinte característica: '),
    write(Pergunta),
    write('? '),
    read(Resposta),
    nl,
    ((Resposta == sim ; Resposta == s)
    ->
    assert(sim(Pergunta)) ;
    assert(nao(Pergunta)), fail).

:- dynamic sim/1,nao/1.

/* Padrão das perguntas */
verify(S) :-
    (sim(S)
    ->
    true ;
    (nao(S)
    ->
    fail ;
    ask(S))).

/* Desfazer todas as afirmações sim/não */
undo :- retract(sim(_)),fail.
undo :- retract(nao(_)),fail.
undo.
