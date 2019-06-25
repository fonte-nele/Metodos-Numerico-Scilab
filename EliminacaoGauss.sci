clear;clc
function y=elimin_gauss(a,n)
    for i=1:n
        w=abs(a(i,i)) // Pegando o primeiro elemento como o maior
        r=i
        for j=i:n   // Analisando o maior elemento da coluna
            if abs(a(j,i)) > w then 
                w= abs(a(j,i))
                r=j
            end
        end
        troca = a(i, :) // Fazendo a troca da linha do pivô com a maior em módulo
        a(i, :) = a(r, :)
        a(r, :) = troca
        /*for j=i:n+1   // Outra forma para trocar as linhas!
            t=a(i,j)
            a(i,j)=a(r,j)
            a(r,j)=t 
        end*/
        
        for k=i+1:n // Fazendo a eliminação de Gauss
            mult=-a(k,i)/a(i,i)
            for p=i:n+1
                a(k,p)=a(k,p)+mult*a(i,p)
            end
        end
    end 
    y=a
endfunction

function y=substituicaoRetroativa(a, n)
    pos = 2
    x(n) = a(n,n+1) / a(n,n) // Cálculo do último x
    for i = n-1:-1:1    // Cálculo dos demais x
        soma = 0
        for j = i+1:n // Somatório da substituição retroativa
            soma = soma + a(i,j) * x(j) 
        end
        x(i) = (a(i,i+pos) - soma) / a(i,i)
        pos = pos + 1
    end
    y = x
endfunction

A= [-2 3 1;2 1 -4;4 10 -6]
b= [-5; -9; 2]
ma= [A b]
n= length(b)
retorno= elimin_gauss(ma,n)
printf("O sistema triangular superior resultante é:\n")
disp(retorno)

printf("\nResolvendo o sistema pelo metodo de substituição retroativas\n")
resultado= substituicaoRetroativa(retorno, n)
disp(resultado)
