%Retorna índice de acertos previsao-taxa
function qtd = calcular_taxa_acertos( dados_teste, num_col )
    qtd = 0;
    total_reg = size( dados_teste, 1 ); 
    for i = 1:total_reg
        if ( dados_teste(i, num_col ) == dados_teste(i, num_col + 1 ) )
            qtd = qtd + 1;
        end
    end
    qtd = qtd / total_reg;
end
