clc; clear;
function y = funcao(valor)
    y = (valor^2);//formula da funcao
endfunction

function y2 = derivada(valor)
    y2 = (2*valor);//formula da derivada
endfunction

xi = 1;
iter = 0;
while(iter < 10)
    x = xi - (funcao(xi) / derivada(xi));

	erro = abs(funcao(xi));
	iter = iter + 1;
    xi = x;    
end

disp(x)
