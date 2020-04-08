/// UNIVERSIDADE DO ESTADO DO RIO DE JANEIRO
/// DISCIPLINA: CALCULO NUMERICO
/// PROF. SILVIA CAMPOS
/// ESTUDANTES: MARCOS BUSSINGER, PEDRO COELHO, WALLACE MACHADO.

/// MÉTODO DOS TRAPÉZIOS

#include <iostream>
#include <cmath> // ou <math.h>
using namespace std;

//Definindo a Função

double funcao( double x ){

return(1/(pow(x, 2)));

}

//Derivada Segunda da Função

double d2_funcao(double x){

return (6/(pow(x, 4)));

}

main(){
int i, n, c;
double a, b, aux;
cout<<"                              METODO DO TRAPEZIO"<<endl;
cout<<"Digite o valor de a"<<endl;
cin>>a;
cout<<"Digite o valor de b"<<endl;
cin>>b;
cout<<"Digite o valor de n"<<endl;
cin>>n;
if(a>b){ //Condição para que o valor de b seja sempre o maior valor
        aux=a;
        a=b;
        b=aux;
    }
double x[n], y[n], h, ddy, I, E;
//Calculando a altura
h=(b-a)/n;
for(i=0;i<=n;i++){
    if (i==0 || i==n)
    {
        c=1;
        }else {
            c=2;
    }
    x[i]=a+i*h;
    y[i]=funcao(x[i]);
}
I=(y[0]+y[n])/2;

//Somatório
for(i=1;i<n;i++){
 I=I+(c*y[i]);
}

for(i=a;i<=b;i++){
    ddy=d2_funcao(x[i]);
    if (d2_funcao(x[i]) > ddy)
    {
        ddy=d2_funcao(x[i]);
    }
        }

//Calculando a Integral
I=(h*I);
//Calculando o Erro
E=ddy * (pow(b-a, 3)/(12 * (pow(n, 2))));
cout<<"\nA aproximacao da integral numerica eh: "<<I<<endl;
cout<<"\nO erro eh: "<<E<<endl;
}
