% Universidade Federal de Mato Grosso
% Instituto de Engenharia
% Intelig�ncia Artificial - 2016/2
%
% Fun��o Octave/MATLAB que mostra o caminho percorrido em solu��o do quebra-cabe�a.
% A fun��o recebe um n� de busca __node__ e mostra o caminho percorrido.
%
% author: raonifst at gmail dot com

function reconstruct_path( node )

if ~isempty(node)
    if isempty(node.Prev)
        show(node.State);
    else
        reconstruct_path(node.Prev);
        show(node.State);
    end
end

end
