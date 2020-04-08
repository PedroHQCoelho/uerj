/// UNIVERSIDADE DO ESTADO DO RIO DE JANEIRO
/// DISCIPLINA: CALCULO NUMERICO
/// PROF. SILVIA CAMPOS
/// ESTUDANTES: MARCOS BUSSINGER, PEDRO COELHO, WALLACE MACHADO.

/// M�TODO DAS DIFEREN�AS FINITAS

#include <iostream>
#include <cmath> // ou <math.h>
using namespace std;

//Definindo a Fun��o
double funcao(double x){

return cos(x);

}

main (){
double x, h;

//Declarando os valores das vari�veis
cout<<"                              METODO DAS DIFEREN�AS FINITAS"<<endl;
cout<<"Digite o valor de x"<<endl;
cin>>x;
cout<<"Digite o valor de h"<<endl;
cin>>h;


//Calculando as diferen�as finitas
double dp, dr, dc;
//Diferen�a Progressiva
dp=(funcao(x+h)-funcao(x))/h;

//Diferen�a Regressiva
dr=(funcao(x)-funcao(x-h))/h;

//Diferen�a Centrada
dc=(funcao(x+h)-funcao(x-h))/2*h;

cout<<"A diferenca progressiva eh: "<<dp<<endl;
cout<<"A diferenca regressiva eh: "<<dr<<endl;
cout<<"A diferenca centrada eh: "<<dc<<endl;
}
