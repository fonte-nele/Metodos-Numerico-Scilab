clear; clc;
function y = metodoLagrange(x, fx, valor, tam)
	y = 0
    somaNumerador = 1
    somaDenominador = 1
    for i = 1:tam
        for j= 1:tam
            if (j <> i) // i tem que ser diferente de j
                somaNumerador = somaNumerador * (valor - x(j))    // Produtório da fórmula!
                somaDenominador = somaDenominador * (x(i) - x(j)) // Produtório da fórmula!
            end
        end
        Lx(i) = somaNumerador / somaDenominador
        somaNumerador = 1
        somaDenominador = 1
        printf("\nValor de L(%d) = %.5f", i, Lx(i));
    end
    for i = 1:tam
        y = y + fx(i)*Lx(i) // Somatório do polinômio interpolador!
    end
endfunction

function y = metodoDiferencasDivididas(x, fx, valor, tam)
    for j = 1:tam-1 // Ordem 1
        somaNumerador = fx(j+1)-fx(j)
        somaDenominador = x(j+1)-x(j)
        Dyi(j,1) = somaNumerador/somaDenominador
    end
    for k = 2:tam // Demais Ordens
        for j = 1:tam-k
            somaNumerador = Dyi(j+1,k-1)-Dyi(j,k-1)
            somaDenominador = x(j+k)-x(j)
            Dyi(j,k) = somaNumerador/somaDenominador
        end
    end
    printf("\nTabela das Ordens Diferença Divididas\n")
    disp(Dyi)
    y = fx(1)
    for j = 1:tam-1 // Fórmula da Diferença Divididas
        mult = 1
        for k = 1:j
            mult = mult * (valor - x(k))
        end
        mult = mult * Dyi(1,j)
        y = y + mult
    end
endfunction

printf("\nTRABALHO CÁLCULO NUMÉRICO\n\n")
printf("\nTEMA: Consumo médio de um certo veículo mediante tabela de valores: velocidade e consumo médio\n\n")

tam = input("Quantos dados deseja adicionar? ")

for i = 1:tam
    printf("\n\nDado %d", i)
    x(i) = input("Informe a velocidade: ")
    fx(i) = input("Informe o consumo médio para essa velocidade: ")
end
//disp(x)
//disp(fx)

xUser = input("Informe a velocidade que está interessado em descobrir o consumo médio: ")

printf("Método de Lagrange\n")
resultado = metodoLagrange(x,fx,xUser,tam)
printf("\nResultado pelo método de Lagrange: %.5f\n", resultado)

printf("\n\nMétodo das Diferenças Divididas\n")
resultado2 = metodoDiferencasDivididas(x,fx,xUser,tam)
printf("\nResultado pelo método das Diferenças Divididas: %.5f\n", resultado2)

