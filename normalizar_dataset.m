% Retorna dataset normalizado
function dataset = normalizar_dataset( dataset )
    % Normalização
    for atributo = 1:size( dataset, 2 )
        min_atrib = min( dataset( :, atributo ) );
        max_atrib = max( dataset( :, atributo ) );
        if min_atrib ~= max_atrib
            dataset( :, atributo ) = ( dataset( :, atributo ) - min_atrib )/( max_atrib - min_atrib );
        end
    end
end