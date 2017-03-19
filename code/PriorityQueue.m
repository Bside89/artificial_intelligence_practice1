% Universidade Federal de Mato Grosso
% Instituto de Engenharia
% Intelig�ncia Artificial - 2016/2
%
% Classe Octave/MATLAB que implementa a fila de prioridades.
%
% Para criar um fila de prioridades vazia, fa�a:
% q = PriorityQueue();
%
% Para inserir um n� n com prioridade p em uma fila q j� criada, fa�a:
% q.insert(p, n);
% 
% Para remover um n� m com a menor prioridade, � s� utilizar a fun��o
% extracMin assim:
% 
% m = q.extractMin();
% 
% author: raonifst at gmail dot com


classdef PriorityQueue
    properties
        T
    end
    
    methods
        function this = PriorityQueue()
            this.T = RedBlackTree();
        end
        
        function insert(this, priority, node)
            this.T.Insert(priority, node);
        end
        
        function node = extractMin(this)
            elem = this.T.Minimum();
            node = elem.value;
            this.T.Delete(elem);
            
        end
        
        function bool = isempty(this)
            bool = this.T.IsEmpty() ;
        end
    end
    
end

