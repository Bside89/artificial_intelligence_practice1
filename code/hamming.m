% Universidade Federal de Mato Grosso
% Instituto de Engenharia
% Intelig�ncia Artificial - 2016/2
%
% Fun��o Octave/MATLAB que implementa a heur�stica de hamming.
% 
% Este arquivo n�o deve ser alterado.
%
% author: raonifst at gmail dot com


function [ dist ] = hamming( State )

	S = State';
	H = S(:) ~= (1:9)';
 
	dist = sum(H(:)) ;
 
	if dist > 1
		dist = dist - 1;
	end
     
end

