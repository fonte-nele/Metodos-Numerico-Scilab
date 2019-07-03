clc; clear;

function [y]=f(x);   
    y = 0.5*x^2 - 0.15*x; // Função da Integral
endfunction;

a = 1.5 // Limite inferior integração
b = 7.5 // Limite superior integração
m = 6   // Quantidade de intervalos
h = (b-a)/m

// Regra dos Trapézios
xi = a
soma = f(xi) // Soma da multiplicação dos coeficientes com o valor de f(x)
xi = a + h
for i = 2:m
    soma = soma + 2*f(xi)   // Elementos do meio multiplicado por 2
    xi = xi + h
end
soma = soma + f(xi) // Último multiplicado por 1
I = (h/2) * soma // Fórmula Regra dos Trapézios
printf("\nO valor da integral pela Regra dos Trapézios eh %.6f \n", I)

// 1º Regra de Simpson
xi = a  
soma = f(xi) // Multiplica por 1
xi = a + h
for i = 2:m
    if modulo(i, 2) == 0 then
        soma = soma + (4 * f(xi)) // Se for par multiplica por 4
    else
        soma = soma + (2 * f(xi)) // Se for ímpar multiplica por 2
    end
    xi = xi + h
end
soma = soma + f(xi) // Multiplica por 1
I = (h / 3) * soma // Fórmula 1º Regra de Simpson
printf("\nO valor da integral pela 1º Regra de Simpson eh %.6f \n", I)

// 2º Regra de Simpson
xi = a  
soma = f(xi)
xi = a + h
aux = 1
for i = 2:m
    if aux == 3 then
        soma = soma + (2 * f(xi)) // Intermediários = multiplica por 2
        aux = 1
    else
        soma = soma + (3 * f(xi)) // Intermediários = multiplica por 3
        aux = aux + 1
    end
    xi = xi + h
end
soma = soma + f(xi) // Multiplica por 1
I = (3 * h / 8) * soma// Fórmula 2º Regra de Simpson
printf("\nO valor da integral pela 2º Regra de Simpson eh %.6f \n", I)
