<html>
    <body>
<?php
    $primaryKeys = ['Local' => ['moradalocal'], 'EventoEmergencia' => ['numtelefone', 'instantechamada'], 'ProcessoSocorro' => ['numprocessosocorro'], 'Meio' => ['nummeio', 'nomeentidade'], 'EntidadeMeio' => ['nomeentidade']];

    function printTable($column_names, $content, $table_name = ''){
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
                echo("<td class = 'tableCell " . $table_name . "Cell'>");
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
