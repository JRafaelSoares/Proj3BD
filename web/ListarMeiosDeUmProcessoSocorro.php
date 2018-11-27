<html>
    <body>
<?php
    
    //$ListOfAssociation = eval("return " . $_REQUEST['ListOfAssociation'] . ";";
    $ListOfAssociation = ["ProcessoSocorro", "Acciona", "Meio"];
    $numProcessoSocorro = 1;
    try
    {
        $host = "db.ist.utl.pt";
        $user ="ist187666";
        $password = "joana0101";
        $dbname = $user;
        
        $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $sql = "SELECT numMeio, nomeEntidade FROM ";

        for($i = 0; $i < count($ListOfAssociation); $i++){
            if($i == count($ListOfAssociation) - 1){
                $sql = $sql . $ListOfAssociation[$i];
                break;
            }
            $sql = $sql . $ListOfAssociation[$i] . " NATURAL JOIN ";
        }
        $sql = $sql . " WHERE numProcessoSocorro = " . $numProcessoSocorro . ";";

        $result = $db->prepare($sql);
        $result->execute();

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
