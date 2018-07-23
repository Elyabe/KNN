% Universidade Federal do Espírito Santo - Ceunes
% Autores: Luiz Henrique e Elyabe Alves
% k : número de vizinhos
% ind_classe : número da coluna do atributo a ser determinado

clear;
clc;
% nome_arquivo = 'enade_2014.csv';
nome_arquivo = 'teste3.csv';
dataset = csvread( nome_arquivo, 1, 1 );
[num_lin, num_col] = size( dataset );

% indice da coluna que representa classe
ind_classe = num_col;
k = 100;
qtd_reg_treino = 200;
qtd_reg_teste = 50000;


ds_norm = normalizar_dataset( dataset );
%ordenação por um atributo na coluna 6 para misturar os registros
ds_norm = sortrows( ds_norm, 6);


% Definição dos conjuntos de treinamento e teste
%==========================================================================
% Por sorteio
    % sort_trei = randi( size( ds_norm, 1 ), qtd_reg_treino, 1 );
    % sort_teste = randi( size( ds_norm, 1 ), qtd_reg_teste, 1 );
    % 
    % dados_teste( 1:qtd_reg_teste ,:) = ds_norm(  sort_teste(1:qtd_reg_teste), : ); 
    % dados_treino(1:qtd_reg_treino,:) = ds_norm(  sort_trei(1:qtd_reg_treino), : ); 

% Verificação distribuição os elementos dos conjuntos : (repetição no conj.
% teste e treino
%  taxa_homogeneidade = calcular_homogeneidade_sorteio( sort_trei, sort_teste );   
%==========================================================================
% Split manual :: Resultados mais adequados
 [dados_treino, dados_teste] = split_manual( ds_norm, qtd_reg_treino, qtd_reg_teste );


% Para cada registro na base
for registro = 1:qtd_reg_teste
   %Calcula distância euclidiana
   for amostra = 1: qtd_reg_treino
       dim = size( dados_teste, 2 ) - 1;
       dif_quad = ( dados_teste( registro, dim ) - dados_treino( amostra, dim ) ).^2;
       d( amostra ) = sum( dif_quad );
   end
   
   %Determina os k vizinhos mais próximos e suas posições
   [dist position] = sort( d,'ascend' );
   k_vizinhos = position( 1:k );
   k_dist_viz = dist( 1:k );
    
   % Determina moda de classe do i-esimo grupo 
   classe(1:k) = dados_treino( k_vizinhos(1:k), ind_classe );  
   classe_moda = mode( classe );
   
   dados_teste( registro, num_col + 1 ) = classe_moda;
end
%Grava num novo arquivo o dataset normalizado
% csvwrite('dataset_norm.csv', ds_n );
disp("Okay, Chuchu! :) ");
taxa_acertos = calcular_taxa_acertos( dados_teste, num_col ) 