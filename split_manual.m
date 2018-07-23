%Quebra manual do conjunto de dados em teste e treino baseado no número
function [dados_treino, dados_teste] = split_manual( ds_norm, inicio, fim )
    temp = inicio + fim;
    dados_treino(1:inicio,:) = ds_norm(  1:inicio, : );
    inicio = inicio + 1;
    dados_teste( 1:fim ,:) = ds_norm(  inicio:temp, : ); 
end