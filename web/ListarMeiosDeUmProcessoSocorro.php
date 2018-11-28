<html>
    <head>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
<?php
    
    include "functions.php";
    $ListOfAssociation = ["ProcessoSocorro", "Acciona", "Meio"];
    try
    {
        $host = "db.ist.utl.pt";
        $user ="ist187666";
        $password = "joana0101";
        $dbname = $user;
        
        $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $sql = "SELECT numMeio, nomeMeio, nomeEntidade FROM ";
        
        $type1 = "ProcessoSocorro";
        $type2 = "Meio";

        $columnNum1 = count($tables[$type1]);
        $columnNum2 = count($tables[$type2]);

        $processo1 = isset($_POST[$type1 . 'Select']);
        $numProcessoSocorro2 = $_POST['selectedProcess'];

        if($processo1 || $numProcessoSocorro2 != ""){
            $numProcessoSocorro1 = $_POST[$type1 . 'Select'];
            if($processo1 && $numProcessoSocorro2 != "")
                if($numProcessoSocorro1 == $numProcessoSocorro2)
                    $numProcessoSocorro = $numProcessoSocorro1;
                else{
                    echo('Seleccionado um processo diferente do escrito');
                    return;
                }
            else
                $numProcessoSocorro = $processo1 ? $numProcessoSocorro1 : $numProcessoSocorro2;

            for($i = 0; $i < count($ListOfAssociation); $i++){
                if($i == count($ListOfAssociation) - 1){
                    $sql = $sql . $ListOfAssociation[$i];
                    break;
                }
                $sql = $sql . $ListOfAssociation[$i] . " NATURAL JOIN ";
            }
            $sql = $sql . " WHERE numProcessoSocorro = " . $numProcessoSocorro . ";";

            $result2 = $db->prepare($sql);
            $result2->execute();
            $result2 = $result2->fetchAll();

            echo("<div class = 'ColumnRight'>");

            foreach($result2 as $key => $row){

                $value = "";

                for($i = 0; $i < $columnNum2; $i++){
                    $value .= $row[$i] . ",";
                }

                //array_push($result2[$key], sprintf($selectionType2, substr($value, 0, -1)));
            }

            //array_push($tables[$type2], "");

            printTable($tables[$type2], $result2, $type2, "selectionCell");
            echo("</div></form>");
        }

        $sql = "SELECT * FROM " . $type1 . ";";

        $result = $db->prepare($sql);

        $result->execute();
        $result = $result->fetchAll();
        
        $resultCount = count($result);

        $selection = "
            <input type = 'radio' name = '" . $type1 . "Select' class = 'radioSelect' value = '%s'>
        ";

        $selectByTyping = "
                    <input type = 'text' name = 'selectedProcess'>";

        echo("<form method = 'post'>
                <input class = 'confirmButtonAssocia' type='submit' value='Confirmar'>
        ");

        echo("<div class = 'ColumnLeft'>");

        foreach($result as $key => $row){

            $value = "";

            for($i = 0; $i < $columnNum1; $i++){
                $value .= $row[$i] . ",";
            }

            array_push($result[$key], sprintf($selection, substr($value, 0, -1)));
        }
        array_push($tables[$type1], "");

        array_unshift($result, [$selectByTyping]);

        printTable($tables[$type1], $result, $type1, "selectionCell");

        echo("</div>");

        
        $db = null;
    }
    catch (PDOException $e)
    {
        echo("<p>ERROR: {$e->getMessage()}</p>");
    }
?>
    </body>
</html>
