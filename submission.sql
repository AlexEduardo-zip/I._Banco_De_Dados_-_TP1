-- 2021032145
-- A2 πestadio σano=′1958′ (local ⋊ ⋉ partidas)
-- retorna estadios do ano 1958 que tiveram partidas
SELECT estadio
    FROM Local, Partidas
    WHERE Local.id_partida=Partidasid_partida
    AND ano=1958 ;
-- A0 πnome jogador σnumero camisa=14 (jogador)
-- Lista jogadores que usam a camisa 14
SELECT nome_jogador
    FROM jogadores
    WHERE numero_camisa=14 ;
-- A3 πnome treinador σgols mandante≥7 (jogadores ⋊ ⋉ partidas)
-- Lista nome dos treinadores que realizaram mais de 6 gols em uma partida como mandante
SELECT nome_treinador
    FROM  jogadores, partidas
    WHERE jogadores.id_partida=partidas.id_partida
    AND goals_mandante>6;
-- A1 πnome jogador σinicias time=′ITA′∧ ano=1994 (jogador ⋊ ⋉ partidas)
-- Lista nome dos jogadores que jogaram no time da italia em 1994
SELECT nome_jogador
    FROM jogadores, partidas 
    WHERE jogadores.id_partida=partidas.id_partida
    AND iniciais_time = 'ITA' AND ano=1994;
-- A4 πtime mandante σgols marcados=≥150 (copasdomundo ⋊ ⋉ partidas)
-- Lista times que marcaram mais de 149 gols como mandante em partidas de copas do mundo
SELECT time_mandante
    FROM CopasDoMundo, partidas
    WHERE CopasDoMundo.ano=partidas.ano
    AND SUM(goals_mandante)>149 ;
-- B3 Liste (1) o nome das cidades que sediaram mais de uma edi¸c˜ao de Copas do Mundo e (2) seus respectivos pa´ıses.
SELECT cidade, pais
    FROM Local, CopasDoMundo, Partidas
    WHERE Partidas.id_partida=Local.id_partida 
    AND Partidas.ano=CopasDoMundo.ano 
    GROUP BY cidade
    HAVING COUNT(DISTINCT CopasDoMundo.ano) > 1;
-- B2. Liste (1) o id partida, (2) a data e hora e (3) o ano dos jogos finais em todas as copas
SELECT DISTINCT id_partida, data_hora, ano
    FROM Partidas
    WHERE fase='Final' ;
-- B1. Liste (1) iniciais do time, (2) o nome do treinador que foram para as quartas de finais em 1970.
SELECT DISTINCT iniciais_time, nome_treinador
    FROM jogadores, Partidas
    WHERE jogadores.id_partida=Partidas.id_partida 
    AND fase="Quartas de Final" AND ano=1970;
-- B4. Liste (1) quantas fases diferentes teve a copa que teve um p´ublico total maior que 300 mil (2) e qual foi o pa´ıs campe˜ao.
SELECT fase, pais
    FROM  Partidas, CopasDoMundo
    WHERE ano=ano 
    AND publico_total > 300000 ;
-- B5. Liste (1) o nome das cidades, (2) estadios e (3) o p´ublico dos jogos da copa do ano de 2006 em qualquer um dos times fizeram 3 ou mais gols.
SELECT cidade, estadios, publico
    FROM Local, Partidas
    WHERE id_partida=id_partida
    AND goals_mandante>3 AND goals_visitante>3;


    """
SELECT DISTINCT campeao, publico_total
    FROM  CopasDoMundo, Partidas
    WHERE CopasDoMundo.ano=Partidas.ano 
    AND publico_total>300000 
    AND (fase, COUNT(fase)) IN (SELECT DISTINCT fase, COUNT(fase)
                                  FROM Partidas
                                  GROUP BY fase);
"""