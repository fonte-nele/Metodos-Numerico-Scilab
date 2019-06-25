// M�todo da Bisse��o
//
// encontra uma raiz no intervalo [xa,xb] da fun��o f(x)=x^3-9*x+3
//
deff('y=f(x)','y=x^3-9*x+3');        // fun��o f(x)
xa= 2.0;                             // valor inicial de xa
xb= 3.0;                             // valor inicial de xb
epsilon=0.0000001;                   // toler�ncia
Nmax=100;                            // n�mero m�ximo de itera��es
i=0;                                 // contador

while (abs(xb-xa)>epsilon) & (i<Nmax)
  i=i+1;
  xm=(xa+xb)/2;
  if f(xa)*f(xm)<0 then xb=xm; else xa=xm; end;
end;

disp(xm)        // exibe o �ltimo valor de xm calculado
disp(i)         // exibe o n�mero de itera��es executadas
