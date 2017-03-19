% Universidade Federal de Mato Grosso
% Instituto de Engenharia
% Intelig�ncia Artificial - 2016/2
%
% Fun��o Octave/MATLAB que deve contar a quantidade de elementos
% com valor igual a 1 (um) em uma matriz __M__ de entrada.
%
% author: raonifst at gmail dot com

function [ c ] = contagem( M )

    c = size(find(M == 1), 1);

end

