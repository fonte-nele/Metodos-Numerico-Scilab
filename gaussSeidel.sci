clear;clc
function [ X ] = gaussSeidel( A, B )

    // Gauss Seidel
    n = length(B);
    mensagens = 1;
    
    // Estimativa inicial de X e X da iteracao anterior
    X = zeros(n,1);
        
    // Criterios de parada
    maxIter = 100;
    minDelta = 10e-10;
    
    // Contadores
    k = 0;
    delta = 2*minDelta;
    
    if mensagens == 1
        disp('Funcao de iteracao:');
        for i=1:n
            //disp(['X(',num2str(i),') = ',num2str(1/A(i,i)), ' * (', num2str(B(i)),' - sum([',num2str(A(i,[1:i-1,i+1:n])), '].*X([', num2str([1:i-1,i+1:n]), '])''))']);
        end
        disp(' ');
        //disp(['K = ', num2str(k), ' - X = [ ', num2str(X'), ' ] - Delta = --------']);
    end
    
    // enquanto nao ocorrer o criterio
    while ((k < maxIter) && (delta > minDelta))
        // para cada elemento de X
        for i=1:n
            Xant = X(i);
            soma = 0;
            for j=1:n
                if j ~= i then
                    soma = soma + A(i, j)* X(j);
                end
            end
            // atualiza o X corrente
            X(i) = (1/A(i,i))*(B(i)- soma);
        end
        // calcula o erro como maior diferenca entre os valores de X
        delta = max(abs(X-Xant));
        // atualiza o numero de iteracoes
        k = k + 1;
        // mensagem
        if mensagens
            //disp(['K = ', num2str(k), ' - X = [ ', num2str(X'), ' ] - Delta = ', num2str(delta)]);
        end
    end
endfunction

A= [22 1 4;1 8 3;2 1 23]
B= [3; 2; 1]
retorno = gaussSeidel(A,B)
disp("Resultado")
disp(retorno)
