% Universidade Federal de Mato Grosso
% Instituto de Engenharia
% Inteligência Artificial - 2016/2
%
% Função Octave/MATLAB que recebe um estado __State__ e verifica se
% este estado possui solução, isto é, se este estado pode ser alterado
% para que chegue ao estado objetivo do jogo.
%
% author: bruno403f at gmail dot com

function [ result ] = valitychecker( State )

O = [1 2 3; 4 5 6; 7 8 9];
blank_value = 9;
if sum(State(:) ~= O(:)) == 2 && find(State == blank_value) == 9
    result = false;
else
    result = true;
end

end
