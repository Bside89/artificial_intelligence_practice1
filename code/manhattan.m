% Universidade Federal de Mato Grosso
% Instituto de Engenharia
% Intelig�ncia Artificial - 2016/2
%
% Fun��o Octave/MATLAB que deve implementar a heur�stica de manhattan.
% A fun��o deve receber uma matriz __State__ representando um estado 
% qualquer do jogo e deve calcular a soma das dist�ncias (horizontal e 
% vertical) de cada c�lula deste estado para a posi��o que ela deveria 
% ocupar no estado objetivo.
%
% author: raonifst at gmail dot com

function [ dist ] = manhattan( State )

	dist = 0;

    % Mapeamento das casas do estado objetivo atrav�s de suas posi��es:
    %
    % (1,1) -> 1          (1,2) -> 2          (1,3) -> 3
    % (2,1) -> 4          (2,2) -> 5          (2,3) -> 6
    % (3,1) -> 7          (3,2) -> 8
    Map = [1 1 ; 1 2 ; 1 3 ; 2 1 ; 2 2 ; 2 3 ; 3 1 ; 3 2];
    
    for i=1:3
        for j=1:3
            n = State(i, j);
            if (n ~= 9)
                dist = dist + abs(i - Map(n, 1)) + abs(j - Map(n, 2));
            end
        end
    end
    
end
