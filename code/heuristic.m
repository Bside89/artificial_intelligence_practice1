% Universidade Federal de Mato Grosso
% Instituto de Engenharia
% Inteligência Artificial - 2016/2
%
% Extra: Função Octave/MATLAB que deve implementar uma nova heurística.
% A função deve receber uma matriz __S__ com um estado do quebra-cabeça
% e devolver uma estimativa (__dist__) da quantidade de movimentos
% necessários para se chegar no objetivo.
%
% A função realiza um "upgrade" da heurística de Manhattan.
% O algoritmo consiste em calcular o custo de um estado __S__ utilizando a
% função de manhattan. Em seguida, são gerados os estados-filhos de __S__ e
% calculados os respectivos custos de manhattan dos mesmos.
% Caso algum destes estados-filhos tenha um custo de manhattan menor do que
% o estado pai, a função devolve o valor de custo calculado (isto é, o
% mesmo custo de manhattan). Caso contrário, a função devolve o custo de
% manhattan acrescentado de um.
%
% O argumento aqui é de que a heurística de manhattan estima a quantidade
% de movimentos necessários para alcançar-se o estado objetivo. No entanto, caso
% nenhum estado-filho possui custo menor do que o estado-pai, é fácil ver
% que um movimento a mais será necessário para alcançar o objetivo.
%
% Embora intuitivamente esta função pareça ser mais complexa e lenta do que
% a função de manhattan, testes executados comprovam a eficácia da função
% heuristic. A tabela a seguir explicita os resultados.
%
% Tempo de execução (em segundos) do algoritmo A-star utilizando cada
% heurística no seguinte caso de teste: S = [4 6 7; 9 5 8; 2 1 3].
%
% Função		| Tempo 1   | Tempo 2   | Tempo 3   | Média
%               |           |           |           |
% manhattan(S)  | 66.7      | 41.9      | 67.1      | 58.5667
%               |           |           |           |
% heuristic(S)  | 33.7      | 30.6      | 30.9		| 31.7333
%
% Com a função heuristic, o algoritmo continua obtendo o caminho ótimo,
% assim como com a função manhattan, porém em um tempo médio de execução
% muito menor.
% Isto se dá pois, com a função heuristic, o algoritmo de A-star SELECIONA
% melhor os estados, inserindo na fila MENOS estados com valores iguais.
%
% author:   raonifst at gmail dot com
%           bruno403f at gmail dot com

function [ dist ] = heuristic( S )

dist = manhattan(S);
if dist == 0
    return;
end
moves = legal_moves(S); % Array contendo as peças que podem ser movidas
for i=1:size(moves, 1)
    M = do_move(S, moves(i)); % Gera estado-filho de __S__
    if dist > manhattan(M) % Se possuir um estado-filho melhor do que __S__
        return;
    end
end
dist = dist + 1;

end
