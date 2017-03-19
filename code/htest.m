% Universidade Federal de Mato Grosso
% Instituto de Engenharia
% Inteligência Artificial - 2016/2
%
% Script Octave/MATLAB que deve ser utilizado para testar as diferentes
% heurísticas elaboradas.
%
% author: bruno403f at gmail dot com

clear
clc

% Utilizado para comparar objetos - NAO APAGUE! %
global id;
id = intmin;
% %

% Caso de teste (1, 2, 3, 4 e 5)
%M = [4 1 3; 9 2 5; 7 8 6];
%M = [9 1 3; 4 2 5; 7 8 6];
%M = [4 9 5; 3 8 6; 7 1 2];
%M = [5 3 2; 7 6 4; 8 1 9];
%M = [4 6 7; 9 5 8; 2 1 3];

M(:,:,1) = [4 1 3; 9 2 5; 7 8 6];
M(:,:,2) = [9 1 3; 4 2 5; 7 8 6];
M(:,:,3) = [4 9 5; 3 8 6; 7 1 2];
M(:,:,4) = [5 3 2; 7 6 4; 8 1 9];
M(:,:,5) = [4 6 7; 9 5 8; 2 1 3];

for i=1:size(M, 3)
    
    fprintf('Testando tempo de execução para:');
    S = M(:,:,i)
    fprintf('Aguarde...\n\n');
    
    if i ~= 5
        fprintf('Teste (hamming) iniciado.\n');
        m = astar(S, @hamming);
        assert(m.eq(Node([1 2 3; 4 5 6; 7 8 9], 0)));
        fprintf('Teste (hamming) concluído.\n\n');
    end
    
    fprintf('Teste (manhattan) iniciado.\n');
    m = astar(S, @manhattan);
    assert(m.eq(Node([1 2 3; 4 5 6; 7 8 9], 0)));
    fprintf('Teste (manhattan) concluído.\n\n');
    
    fprintf('Teste (heuristic) iniciado.\n');
    m = astar(S, @heuristic);
    assert(m.eq(Node([1 2 3; 4 5 6; 7 8 9], 0)));
    fprintf('Teste (heuristic) concluído.\n\n');
    
end
