clc; clear;

// Primeira Fase da corrida
a = 0
b = 1.5
m = 3
h = (b-a)/m
ti = [0 0.5 1 1.5] // Intervalos de tempo.
Ati = [0 0.35 0.55 0.9] // Aceleracao
valorAcumulado = 0  // Guardar a soma da multiplicação dos coeficientes com a aceleração
aux = 1; // Controlar a multiplicação dos coeficientes da Segunda Regra de Simpson
valorAcumulado = valorAcumulado + Ati(1) // Extremo = multiplica por 1 -- 02º Regra de Simpson
for i = 2:m
    if aux == 3 then
        valorAcumulado = valorAcumulado + (2 * Ati(i)) // Intermediários = multiplica por 2
        aux = 1;
    else
        valorAcumulado = valorAcumulado + (3 * Ati(i)) // Intermediários = multiplica por 3
        aux = aux + 1
    end
end
valorAcumulado = valorAcumulado + Ati(m+1) // Extremo = multiplica por 1
integral = (3 * h / 8) * valorAcumulado // Fórmula da 02º Regra de Simpson
printf("A velocidade na Primeira Fase da corrida usando a Segunda Regra de Simpson eh %.6f segundos.\n", integral)

function [y]=f(x);   
    y = 0.5*x^2 - 0.15*x; // Função da Segunda Fase da Corrida
endfunction;

a = 1.5
b = 7.5
// Erro de Truncamento
m = ((b-a)^3 * 1) / (12 * 0.3) // Fórmula Erro
m = sqrt(m)
m = round(m) // Arredondamento do numero para inteiro
printf("\nUsando a formula do erro de truncamento descobrimos o valor de m = %d\n", m)
h = (b-a)/m // Começo método dos Trapézios
xi = a
valorAcumulado = f(xi)
xi = a + h
for i = 2:m
    valorAcumulado = valorAcumulado + 2*f(xi)
    xi = xi + h
end
valorAcumulado = valorAcumulado + f(xi)
integral = (h/2) * valorAcumulado // Fórmula
printf("\nA velocidade na Segunda Fase da corrida usando a Regra dos Trapézios eh %.6f segundos.\n", integral)
