%Retorna o qu�o parecidos s�o os indices sorteados dos vetores que
%determinar�o os registros de teste e treino
function taxa = calcular_homogeneidade_sorteio (  sort_trei , sort_teste )
qtd = 0;
    for i = 1:size(sort_trei,1)
        if ( sort_trei( i ) == sort_teste(i) )
            qtd = qtd + 1;  
        end
    end
end
