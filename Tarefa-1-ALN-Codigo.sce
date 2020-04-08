clear
clc

////Pontos - resultados de f(x)=x^2+y^2-1
x = [1,-1,0,0];
y = [0,0,1,-1];

//A = rand(2,2)
A= [2, 1; 1, 1];  //Matriz de Transformação
disp(A);
    
    
    //Vetores usados pelos eixos do plot
    Vx = [min(x):0.1:max(x)]
    Vy = [min(y):0.1:max(y)]
    tamx = length(Vx)
    tamy = length(Vy)
   
//Matriz da funcao do ciculo unitário z=(x,y)
    for i=1:(tamx)   
        for j=1:tamy
            MatrizXY(i,j) = (Vx(i))^2 + (Vy(j))^2 - 1;
        end
    end


//Função que plota os caminhos gerando as curvas de níveis da função
    
   [xc,yc] = contour2di(Vx,Vy,MatrizXY,[0,0])
    
    k=1;l=yc(k);aux=1;
    while k+yc(k)<size(xc,'*')          //Retirado de um exemplo do documento do scilab explicando a função contour2di
      l=yc(k);
     plot(xc(k+(1:l)),yc(k+(1:l)),'r') //'r' eh a cor a ser plotada pelo gráfico, neste caso eh a cor vermelha (red)
     xcf=xc(k+(1:l));                  //Conjunto de pontos 'x' que formam o círculo unitário.
     ycf=yc(k+(1:l));                  //Conjunto de pontos 'y' que formam o círculo unitário.
      aux=aux+1;
      k=k+l+1;
    end
 
    e = gca(); //definições da janela do gráfico
    e.isoview = 'on' // Posição centralizada na janela
    e.data_bounds = [min(x)-2,min(y)-2;max(x)+2,max(y)+2]
    e.x_location="middle"; //Posição do eixo, neste caso centralizado
    e.y_location="middle"; //Posição do eixo, neste caso centralizado
    
  

//____________________________________________________Segundo Plot - circulo transformado_________________________________________________________________________

    for i=1:length(xcf)
        P(1,i)= xcf(i);     // Matriz P na posição(1, i)= valores de x
        P(2,i)= ycf(i);     // Matriz P na posição(2, i)= valores de y
    end
    
    R = (A*P);               //Resultado dos valores de x e y transformados pela Matriz A
plot(R(1,:), R(2,:), ':k'); //Plota o cículo pertubado por pela matriz A
legend(['Círculo Unitário';'Circulo Unitário transformado pela Matriz Amxn'],4);
        

//____________________________________________________Terceiro Plot - circulo transformado pela função svd________________________________________________________


    [u,s,v]=svd(A);
    
    RU= u*P;
    RS= s*P;
    RV= v*P;
    disp(u);
    disp(s);
    disp(v);
plot(RU(1,:), RU(2,:), '--');             //Plota o círculo transformado pela matriz U
legend(['Círculo Unitário';'Circulo Unitário transformado pela Matriz Umxm'],4);
plot(RS(1,:), RS(2,:), '--');   // Plota o círculo transformado pela matriz S
legend(['Círculo Unitário';'Circulo Unitário transformado pela Matriz Smxn'],4);
plot(RV(1,:), RV(2,:), '--');           // Plota o círculo transformado pela matriz V
legend(['Círculo Unitário';'Circulo Unitário transformado pela Matriz Vnxn'],4);
    
    
    
