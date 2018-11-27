<html>
    <body>
<?php
    $primaryKeys = ['Local' => ['moradalocal'], 'EventoEmergencia' => ['numtelefone', 'instantechamada'], 'ProcessoSocorro' => ['numprocessosocorro'], 'Meio' => ['nummeio', 'nomeentidade'], 'EntidadeMeio' => ['nomeentidade']];
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

    function printTable($column_names, $content){
        echo("<table border=\"1\">\n");
        
        $array_size = count($column_names);
        //Nomes das colunas
        echo("<tr>");
        $i = 0;
        foreach($column_names as $column_name){
            echo("<td>");
            echo($column_name);
            echo("</td>");
        }
        echo("</tr>");
        //Objetos
        foreach ($content as $row) {
            echo("<tr>");
            $i = 0;
            while($i < $array_size){
                echo("<td>");
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
