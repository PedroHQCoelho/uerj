/// UNIVERSIDADE DO ESTADO DO RIO DE JANEIRO
/// DISCIPLINA: CALCULO NUMERICO
/// PROF. SILVIA CAMPOS
/// ESTUDANTES: MARCOS BUSSINGER, PEDRO COELHO, WALLACE MACHADO.

/// MÉTODO DAS DIFERENÇAS FINITAS

#include <iostream>
#include <cmath> // ou <math.h>
using namespace std;

//Definindo a Função
double funcao(double x){

return cos(x);

}

main (){
double x, h;

//Declarando os valores das variáveis
cout<<"                              METODO DAS DIFERENÇAS FINITAS"<<endl;
cout<<"Digite o valor de x"<<endl;
cin>>x;
cout<<"Digite o valor de h"<<endl;
cin>>h;


//Calculando as diferenças finitas
double dp, dr, dc;
//Diferença Progressiva
dp=(funcao(x+h)-funcao(x))/h;

//Diferença Regressiva
dr=(funcao(x)-funcao(x-h))/h;

//Diferença Centrada
dc=(funcao(x+h)-funcao(x-h))/2*h;

cout<<"A diferenca progressiva eh: "<<dp<<endl;
cout<<"A diferenca regressiva eh: "<<dr<<endl;
cout<<"A diferenca centrada eh: "<<dc<<endl;
}
