% Universidade Federal de Mato Grosso
% Instituto de Engenharia
% Intelig�ncia Artificial - 2016/2
%
% Fun��o Octave/MATLAB que deve implementar o algoritmo A-estrela.
% A fun��o deve receber uma matriz __M__ com estado inicial do  
% quebra-cabe�a, o apontador para a fun��o heur�stica __h__ e devolver um 
% n� de busca __n__ com o estado objetivo. Para que seja poss�vel  
% reconstruir o caminho percorrido at� a solu��o, cada n� produzido pelo  
% algoritmo de busca deve conter umarefer�ncia para o n� que o descobriu 
% (i.e., n� visitado no passo anterior).
%
% Para executar o algoritmo para um estado S com heur�stica de hamming por 
% exemplo pode-ser fazer:
% S = [4 1 3; 9 2 5; 7 8 6];
% node = astar(S, @hamming);
% 
% Extra: A vari�vel __error__ deve ser utilizada para identificar jogos  
% que n�o possuem solu��o. 
%
% author: raonifst at gmail dot com

function [n, error] = astar(M, h)

	error = false;
    g = h; % Ponteiro da fun��o heur�stica h
	q = PriorityQueue(); % Fila de prioridades
	
	O = [1 2 3; 4 5 6; 7 8 9]; % Estado objetivo
	
	% Cria um novo n� __n__ com estado igual a matriz __M__  
	% (estado inicial) e custo 0 (zero).
 	n = Node(M, 0);
    
    % Insere o n� __n__ na fila de prioridades __q__. O custo deste  
    % n� � igual a: n.f + g(n.State). __g__ � um apontador para fun��o 
    % heur�stica considerada
    q.insert(n.f + g(n.State), n);

    % La�o principal do algoritmo A-estrela - � interrompido quando 
    % a fila ficar vazia
    while ~q.isempty()
        
        n = q.extractMin(); % Remove um n� __m__ com a menor prioridade na fila q

        % Verifica se o estado selecionado � o objetivo
        if isequal(n.State, O) 
            return;
        end
        
        % Verifica se o estado selecionado � inv�lido, isto �, se n�o
        % possui solu��o
        if ~valitychecker(n.State) 
            error = true;
            return
        end
        
        % Array de pe�as dispon�veis para movimento
        % Corresponde aos estados vizinhos de __m__
        moves = legal_moves(n.State);
        
        % La�o que explora todas os estados vizinhos de __m__
        for i=1:size(moves, 1)
        
            % Executa o modelo de transi��o para cada a��o
            M = do_move(n.State, moves(i)); % Estado gerado
            
            mf = Node(M, n.f + 1); % Cria o n� filho de __m__ com o estado gerado
            mf.Prev = n; % Liga o n� filho ao n� __m__
            
            % Verifica se o estado anterior de __m__ � tamb�m estado
            % vizinho, para s� assim adicion�-lo � fila
            % Evita loop infinito
            if isempty(n.Prev) || ~isequal(n.Prev.State, mf.State)
                q.insert(mf.f + g(mf.State), mf);
            end
            
        end
        
    end

end
