clc;clear;

printf("\nBalanço de Massa\nMétodos Decomposição LU e Jacobi\n\n")
/*ordem = input("Qual a ordem da matriz? ")
printf("Preencha os valores da matriz dos coeficientes:\n")
for i = 1:ordem
    printf("Linha %d\n", i)
    for j = 1:ordem
        printf("Coluna %d", j)
        A(i, j) = input("Valor: ")
    end
end
printf("Preencha os valores dos termos independentes:\n")
for i = 1:ordem
    B(i) = input("Termo: ")
end*/
n = 3;
A = [0.8 0.8 0.9; 0.05 0.9 0.9; 0.02 0.02 0.05];
b = [500; 300; 200];
L = zeros(n,n); // Matriz triangular inferior com os coeficientes
U = zeros(n,n); // Matriz que resta da eliminação de Gauss
// Decomposição LU
for j = 1:n
    L(j,j) = 1; // diagonal principal com 1
    for i = 1:j
        soma = 0.0;
        for k=1:i-1
            soma = soma + L(i,k)*U(k,j);
        end
        U(i,j) = A(i,j) - soma; // Cálculo da matriz U  
    end
    for i = j+1:n
        soma = 0.0;
        for k=1:j-1
            soma = soma + L(i,k)*U(k,j);
        end
        L(i,j) = (A(i,j)-soma)/U(j,j); // Cálculo da matriz L
    end
end
printf('Matriz L: \n')
disp(L)
printf('\nMatriz U: \n')
disp(U)

// resolve L*y = b: substituicao progressiva
y = zeros(1,n);
y(1) = b(1)/L(1,1);
for i=2:n
    soma = 0.0;
    for j=1:i-1
        soma = soma + L(i,j)*y(j);
    end
    y(i) = (b(i)-soma)/L(i,i);
end

// resolve U*x = y: substituicao retroativa
x(n) = y(n)/U(n,n);
for i=n-1:-1:1
    soma = 0.0;
    for j=i+1:n
        soma = soma + U(i,j)*x(j);
    end
    x(i) = (y(i)-soma)/U(i,i);
end

// Eliminação de Gauss
function y = eliminacaoGauss(A, n)
    for i = 1:n
        w = abs(A(i,i)) // Pegando o primeiro elemento como o maior
        r = i
        for j = i:n   // Analisando o maior elemento da coluna
            if abs(A(j,i)) > w then 
                w = abs(A(j,i))
                r = j
            end
        end
        troca = A(i, :) // Fazendo a troca da linha do pivô com a maior em módulo
        A(i, :) = A(r, :)
        A(r, :) = troca
        
        for k = i+1:n // Fazendo a eliminação de Gauss
            mult = -A(k,i)/A(i,i)
            for p = i:n+1
                A(k,p)=A(k,p)+mult*A(i,p)
            end
        end
    end 
    y = A
endfunction

function y=subRetroativa(A, n)
    pos = 2
    x(n) = A(n,n+1) / A(n,n) // Cálculo do último x
    for i = n-1:-1:1        // Cálculo dos demais x
        soma = 0
        for j = i+1:n // Somatório da substituição retroativa
            soma = soma + A(i,j) * x(j) 
        end
        x(i) = (A(i,i+pos) - soma) / A(i,i)
        pos = pos + 1
    end
    y = x
endfunction


matrizAumentada = [A b]
matrizAumentada = eliminacaoGauss(matrizAumentada,n)
printf("\nO sistema triangular superior resultante é:\n")
disp(matrizAumentada)

printf('\nResultados pelo método da Decomposição LU: \n')
disp(x)

printf("\nResultados pelo método da Eliminação de Gauss com pivotação parcial: \n")
x2 = subRetroativa(matrizAumentada, n)
disp(x2)
