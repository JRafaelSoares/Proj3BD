<html>
    <body>
<?php
    $primaryKeys = ['Local' => ['moradalocal'], 'EventoEmergencia' => ['numtelefone', 'instantechamada', 'nomepessoa', 'moradalocal', 'numprocessosocorro'], 'ProcessoSocorro' => ['numprocessosocorro'], 'Meio' => ['nummeio', 'nomeentidade'], 'EntidadeMeio' => ['nomeentidade'], 'MeioCombate' => ['nummeio', 'nomeentidade'], 'MeioApoio' => ['nummeio', 'nomeentidade'], 'MeioSocorro' => ['nummeio', 'nomeentidade']];

    $tables = [
            'Local' => ['Morada do Local'],
            'EventoEmergencia' => ['Numero de Telefone', 'Instante de Chamada', 'Nome da Pessoa', 'Morada do Local', 'Numero do Processo de Socorro'],
            'ProcessoSocorro' => ['Numero do Processo de Socorro'],
            'EntidadeMeio' => ['Morada do Local'],
            'Meio' => ['Numero do Meio', 'Nome do Meio', 'Nome da Entidade'],
            'MeioCombate' => ['Numero do Meio', 'Nome da Entidade'],
            'MeioSocorro' => ['Numero do Meio', 'Nome da Entidade'],
            'MeioApoio' => ['Numero do Meio', 'Nome da Entidade']
        ];
    $EditPermissions = ['MeioCombate', 'MeioApoio', 'MeioSocorro'];

    function printTable($column_names, $content, $table_name = '', $last_row_id = ''){
        echo("<table class = 'table " . $table_name . "' border=\"1\">\n");
        
        $array_size = count($column_names);

        //Nomes das colunas

        echo("<tr class = 'tableHeaderRow " . $table_name . "HeaderRow'>");
        
        foreach($column_names as $column_name){
            echo("<th class = 'tableHeaderCell " . $table_name . "HeaderCell'>");
            echo($column_name);
            echo("</th>");
        }
        echo("</tr>");

        //Objetos
        foreach ($content as $row) {
            echo("<tr class = 'tableRow " . $table_name . "Row'>");
            $i = 0;
            while($i < $array_size){
                echo("<td class = 'tableCell " . ($i == $array_size - 1 ? $last_row_id : "") . " " . $table_name . "Cell'>");
                echo($row[$i]);
                echo("</td>");
                $i = $i + 1;
            }
            echo("</tr>");
        }
        echo("</table>\n");
    }

?>
    </body>
</html>
