//RUNGE-KUTTA DE 4ª ORDEM - ARIEL E PEDRO COELHO (GRUPO 8) - MÉTODOS NUM. EQ. DIF.
//IPRJ-UERJ                           2019/1              PROF. GRAZIONE DE SOUZA

//Limpeza de variáveis e do console
clc;
clear;
clearglobal;

//Variáveis globais
global('t','q','i');
t(1) = 0;             //Valor inicial de 't'
q(1) = 0;             //Valor inicial de 'q'
i(1) = 0;             //Valor inicial de 'i'

delta_t = 0.5;        //Incremento de tempo
t_max = 12.5;          //Valor máximo de 't'. 't' vai de 't(1)' até 't_max'


//Valores do grupo
L = 1;                //Indutância (H)
R = 6;                //Resistência (Ω)
C = 0.25;             //Capacitância (F)
E_0 = 12;             //Voltagem inicial (V)
omega = sqrt(1.5);    //ω - Utilizado na solução analítica
p = 1/((L*C)^0.5);    //p - Utilizado na solução analítica


//Função analítica para comparação
function result = analitica(t)
    result = -E_0/(L*(p^2-omega^2))*omega/p*sin(p*t)+E_0/(L*(p^2-omega^2))*sin(omega*t);
endfunction

//Função dq/dt
function result = q_linha(T,Q,I)
    result = I;
endfunction

//Função di/dt
function result = i_linha(T,Q,I)
    result = (C*(E_0*sin( omega*T))-Q-C*R*I)/(C*L);
endfunction


//Função que calcula o Runge-Kutta para uma dada iteração 'n'
function RungeKutta(n)
    global('t','q','i');

    k11 = q_linha(t(n),q(n),i(n));
    k12 = i_linha(t(n),q(n),i(n));
    k21 = q_linha(t(n)+delta_t/2, q(n)+(k11*delta_t)/2, i(n)+(k12*delta_t)/2);
    k22 = i_linha(t(n)+delta_t/2, q(n)+(k11*delta_t)/2, i(n)+(k12*delta_t)/2);
    k31 = q_linha(t(n)+delta_t/2, q(n)+(k21*delta_t)/2, i(n)+(k22*delta_t)/2);
    k32 = i_linha(t(n)+delta_t/2, q(n)+(k21*delta_t)/2, i(n)+(k22*delta_t)/2);
    k41 = q_linha(t(n)+delta_t, q(n)+(k31*delta_t), i(n)+(k32*delta_t));
    k42 = i_linha(t(n)+delta_t, q(n)+(k31*delta_t), i(n)+(k32*delta_t));

    q(n+1) = q(n)+1/6*(k11+2*k21+2*k31+k41)*delta_t;
    i(n+1) = i(n)+1/6*(k12+2*k22+2*k32+k42)*delta_t;
endfunction


// Função principal
function main()
    global('t','i','q');
    
    //Calcula o Runge-Kutta (R = 6) para cada iteração até alcançar o tempo máximo
    for n = 1:t_max/delta_t;
        t(n+1) = n*delta_t;
        RungeKutta(n);
    end
    
    //Impressão da tabela de valores para R = 6
    mprintf("\n\tMétodo de Runge-Kutta Clássico de 4ª Ordem \n\tpara R = %d\n\n", R);
    mprintf("Iteração [n]\tTempo [t]\tCarga [q]\tCorrente [i]\n");
    for n = 0:t_max/delta_t;
        mprintf("%d\t\t%.2f\t\t%.3f\t\t%.3f\n", n, t(n+1), q(n+1), i(n+1));
    end
    
    //Plotando o gráfico da função encontrada por Runge-Kutta para R = 6
    plot(t, q, "g.-", "linewidth", 2);
    xgrid();
    
    //===================================================================================
    
    //Ajusta limites da área de exibição do gráfico (remover para exibir a área completa)
    gca().tight_limits = ["on", "on"]; 
    gca().data_bounds = [0, -20; t_max, 20];
    gca().font_size = 4;
    
    //Título do gráfico e caixa de legenda
    title("Runge-Kutta 4ª Ordem", "fontsize", 4);
    xlabel("tempo [t] (segundos)", "fontsize", 4);
    ylabel("carga [q] (Coulombs)", "fontsize", 4);
    legend("RK4 com R=6Ω");
    
    //Aguarda entrada para continuar o processamento
    halt("\nNÃO FECHE A JANELA GRÁFICA\nPressione ENTER para calcular para R = 0 e Analítica");
    
    //===================================================================================
    
    //Calcula o Runge-Kutta (R = 0) para cada iteração até alcançar o tempo máximo
    R = 0;
    for n = 1:t_max/delta_t;
        t(n+1) = n*delta_t;
        RungeKutta(n);
    end
    
    //Impressão da tabela de valores para R = 0
    mprintf("\n\tMétodo de Runge-Kutta Clássico de 4ª Ordem \n\tpara R = %d\n\n", R);
    mprintf("Iteração [n]\tTempo [t]\tCarga [q]\tCorrente [i]\n");
    for n = 0:t_max/delta_t;
        mprintf("%d\t\t%.2f\t\t%.3f\t\t%.3f\n", n, t(n+1), q(n+1), i(n+1));
    end
    
    //Plotando o gráfico da função encontrada por Runge-Kutta para R = 0
    plot(t, q, "r.-", "linewidth", 2);
    
    //===================================================================================
    
    //Plotando o gráfico da função analítica com resolução de 0.001s
    x = 0:0.001:t_max;
    plot(x, analitica(x), "linewidth", 2);
    
    //=================================================================================== 
    
    //Título do gráfico e caixa de legenda
    title("Runge-Kutta 4ª Ordem X Solução Analítica", "fontsize", 4);
    legend("RK4 com R=6Ω", "RK4 com R=0Ω", "Analítica");
endfunction

main();     //Executa a função principal


