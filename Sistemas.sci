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
//A = [0.8 0.8 0.9; 0.05 0.9 0.9; 0.02 0.02 0.05];
//b = [500 300 200];
A = [-130 30 0; 90 -90 0; 40 60 -120];
b = [-200 0 -500]
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

// resolve U*x = y: substituicao regressiva
x(n) = y(n)/U(n,n);
for i=n-1:-1:1
    soma = 0.0;
    for j=i+1:n
        soma = soma + U(i,j)*x(j);
    end
    x(i) = (y(i)-soma)/U(i,i);
end
printf('\nResultados pelo método da Decomposição LU: \n')
disp(x)

function [x, erro] = Jacobi(A, b, n, x)
    xAnt = x
    erro = 0.0
    for i = 1:n
        soma = 0.0
        for j = 1:n
            if (j <> i) then
                soma = soma + (A(i, j)*xAnt(j))
            end
        end
        x(i) = (b(i) - soma)/A(i, i)
        if (abs(x(i) - xAnt(i)) > erro)
            erro = abs(x(i) - xAnt(i))
        end
    end
endfunction

precisao = 0.001 // Critério de parada!
maxIter = 100    // Critério de parada!
k = 1
erro = 1000
x = [0; 0; 0] // Solução Inicial

while (k < maxIter & erro > precisao) then 
    [x, erro] = Jacobi(A, b, n, x)
    k = k + 1
end
printf("\nResultados pelo método iterativo Jacobi: \n")
disp(x)
