<html>
    <body>
<?php
    $type = $_REQUEST['type'];
    $pk = eval("return " . $_REQUEST['pk'] . ";");
    include "functions.php";

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
        foreach ($primaryKeys[$type] as $key) {
            if($i != 0) {
                $sql = $sql . " AND ";
            }
	    
    	    if($key == 'moradalocal' || $key == 'nomeentidade' || $key == 'nomepessoa'){
    		    $sql = $sql . $key . " like " . " '" . $pk[$i] . "' ";
    	    }
    	
    	    else 
                if($key == 'instantechamada'){
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
        
        $result = $result->fetchAll();
        
        printTable(['Numero de Telefone', 'Instante de Chamada', 'Nome da Pessoa', 'Morada do Local', 'Numero do Processo de Socorro'], $result);
        
        $db = null;
    }
    catch (PDOException $e)
    {
        echo("<p>ERROR: {$e->getMessage()}</p>");
    }
?>
    </body>
</html>
