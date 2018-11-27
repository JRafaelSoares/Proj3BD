<html>
    <body>
<?php
    $primaryKeys = ['Local' => ['moradalocal'], 'EventoEmergencia' => ['numtelefone', 'instantechamada'], 'ProcessoSocorro' => ['numprocessosocorro'], 'Meio' => ['nummeio'], 'EntidadeMeio' => ['nomeentidade']];

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
