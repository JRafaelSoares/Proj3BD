<html>
    <body>
<?php
    $type = $_REQUEST['type'];
    $pk1 = $_REQUEST['pk1'];
    $pk2 = $_REQUEST['pk2'];

    $pk = [$pk1, $pk2];

    $columskeys = ['Local' => ['moradalocal'], 'EventoEmergencia' => ['numtelefone', 'instantechamada'], 'ProcessoSocorro' => ['numprocessosocorro'], 'Meio' => ['nummeio'], 'EntidadeMeio' => ['nomeentidade']];

    try
    {
        $host = "db.ist.utl.pt";
        $user ="ist187666";
        $password = "joana0101";
        $dbname = $user;
        $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $sql = "SELECT * FROM " . $type . " WHERE ";
	
        $i = 0;
	
        foreach ($columskeys[$type] as $key) {
	    echo($key);
            if($i != 0) {
                $sql = $sql . " AND ";
            }
	    
	    if($key == 'moradalocal' || $key == 'nomeentidade'){
		$sql = $sql . $key . " like " . " '" . $pk[$i] . "' ";
	    }
	
	    else if($key == 'instantechamada'){
		$sql = $sql . $key . " = " . " '" . $pk[$i] . "' ";
	    }

	    else{
            	$sql = $sql . $key . " = " . $pk[$i];
	    }
		
	    $i = $i + 1;
        }
	
        $sql = $sql . ";";

        echo("<p>$sql</p>");

        $result = $db->prepare($sql);
        $result->execute();
        
        $db = null;

        //PRINTING SQL

        echo("<table border=\"1\">\n");
        
        $result = $result->fetchAll();

        $column_names = array_keys($result[0]);
        $array_size = count($column_names);
        //Nomes das colunas
        echo("<tr>");
        $i = 0;
        while($i < $array_size){
            echo("<td>");
            echo($column_names[$i]);
            echo("</td>");
            $i = $i + 2;
        }
        echo("</tr>");
        //Objetos
        foreach ($result as $row) {
            echo("<tr>");
            $i = 0;
            while($i < $array_size/2){
                echo("<td>");
                echo($row[$i]);
                echo("</td>");
                $i = $i + 1;
            }
            echo("</tr>");
        }
        echo("</table>\n");
        
        $db = null;
    }
    catch (PDOException $e)
    {
        echo("<p>ERROR: {$e->getMessage()}</p>");
    }
?>
    </body>
</html>
