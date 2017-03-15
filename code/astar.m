% Universidade Federal de Mato Grosso
% Instituto de Engenharia
% Inteligência Artificial - 2016/2
%
% Função Octave/MATLAB que deve implementar o algoritmo A-estrela.
% A função deve receber uma matriz __M__ com estado inicial do  
% quebra-cabeça, o apontador para a função heurística __h__ e devolver um 
% nó de busca __n__ com o estado objetivo. Para que seja possível  
% reconstruir o caminho percorrido até a solução, cada nó produzido pelo  
% algoritmo de busca deve conter umareferência para o nó que o descobriu 
% (i.e., nó visitado no passo anterior).
%
% Para executar o algoritmo para um estado S com heurística de hamming por 
% exemplo pode-ser fazer:
% S = [4 1 3; 9 2 5; 7 8 6];
% node = astar(S, @hamming);
% 
% Extra: A variável __error__ deve ser utilizada para identificar jogos  
% que não possuem solução. 
%
% author: raonifst at gmail dot com

function [n, error] = astar(M, h)

	error = false;
    g = h; % Ponteiro da função heurística h
	q = PriorityQueue(); % Fila de prioridades
	
	O = [1 2 3; 4 5 6; 7 8 9]; % Estado objetivo
	
	% Cria um novo nó __n__ com estado igual a matriz __M__  
	% (estado inicial) e custo 0 (zero).
 	n = Node(M, 0);
    
    % Insere o nó __n__ na fila de prioridades __q__. O custo deste  
    % nó é igual a: n.f + g(n.State). __g__ é um apontador para função 
    % heurística considerada
    q.insert(n.f + g(n.State), n);

    % Laço principal do algoritmo A-estrela - É interrompido quando 
    % a fila ficar vazia
    while ~q.isempty()
        
        n = q.extractMin(); % Remove um nó __m__ com a menor prioridade na fila q

        % Verifica se o estado selecionado é o objetivo
        if isequal(n.State, O) 
            return;
        end
        
        % Verifica se o estado selecionado é inválido, isto é, se não
        % possui solução
        if ~valitychecker(n.State) 
            error = true;
            return
        end
        
        % Array de peças disponíveis para movimento
        % Corresponde aos estados vizinhos de __m__
        moves = legal_moves(n.State);
        
        % Laço que explora todas os estados vizinhos de __m__
        for i=1:size(moves, 1)
        
            % Executa o modelo de transição para cada ação
            M = do_move(n.State, moves(i)); % Estado gerado
            
            mf = Node(M, n.f + 1); % Cria o nó filho de __m__ com o estado gerado
            mf.Prev = n; % Liga o nó filho ao nó __m__
            
            % Verifica se o estado anterior de __m__ é também estado
            % vizinho, para só assim adicioná-lo à fila
            % Evita loop infinito
            if isempty(n.Prev) || ~isequal(n.Prev.State, mf.State)
                q.insert(mf.f + g(mf.State), mf);
            end
            
        end
        
    end

end
