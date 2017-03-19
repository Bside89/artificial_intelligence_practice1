% Universidade Federal de Mato Grosso
% Instituto de Engenharia
% Intelig�ncia Artificial - 2016/2
%
% Extra: Fun��o Octave/MATLAB que deve implementar uma nova heur�stica.
% A fun��o deve receber uma matriz __S__ com um estado do quebra-cabe�a
% e devolver uma estimativa (__dist__) da quantidade de movimentos
% necess�rios para se chegar no objetivo.
%
% A fun��o realiza um "upgrade" da heur�stica de Manhattan.
% O algoritmo consiste em calcular o custo de um estado __S__ utilizando a
% fun��o de manhattan. Em seguida, s�o gerados os estados-filhos de __S__ e
% calculados os respectivos custos de manhattan dos mesmos.
% Caso algum destes estados-filhos tenha um custo de manhattan menor do que
% o estado pai, a fun��o devolve o valor de custo calculado (isto �, o
% mesmo custo de manhattan). Caso contr�rio, a fun��o devolve o custo de
% manhattan acrescentado de um.
%
% O argumento aqui � de que a heur�stica de manhattan estima a quantidade
% de movimentos necess�rios para alcan�ar-se o estado objetivo. No entanto, caso
% nenhum estado-filho possui custo menor do que o estado-pai, � f�cil ver
% que um movimento a mais ser� necess�rio para alcan�ar o objetivo.
%
% Embora intuitivamente esta fun��o pare�a ser mais complexa e lenta do que
% a fun��o de manhattan, testes executados comprovam a efic�cia da fun��o
% heuristic. A tabela a seguir explicita os resultados.
%
% Tempo de execu��o (em segundos) do algoritmo A-star utilizando cada
% heur�stica no seguinte caso de teste: S = [4 6 7; 9 5 8; 2 1 3].
%
% Fun��o		| Tempo 1   | Tempo 2   | Tempo 3   | M�dia
%               |           |           |           |
% manhattan(S)  | 66.7      | 41.9      | 67.1      | 58.5667
%               |           |           |           |
% heuristic(S)  | 33.7      | 30.6      | 30.9		| 31.7333
%
% Com a fun��o heuristic, o algoritmo continua obtendo o caminho �timo,
% assim como com a fun��o manhattan, por�m em um tempo m�dio de execu��o
% muito menor.
% Isto se d� pois, com a fun��o heuristic, o algoritmo de A-star SELECIONA
% melhor os estados, inserindo na fila MENOS estados com valores iguais.
%
% author:   raonifst at gmail dot com
%           bruno403f at gmail dot com

function [ dist ] = heuristic( S )

dist = manhattan(S);
if dist == 0
    return;
end
moves = legal_moves(S); % Array contendo as pe�as que podem ser movidas
for i=1:size(moves, 1)
    M = do_move(S, moves(i)); % Gera estado-filho de __S__
    if dist > manhattan(M) % Se possuir um estado-filho melhor do que __S__
        return;
    end
end
dist = dist + 1;

end
