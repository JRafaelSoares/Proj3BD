<html>
    
    <head>
        <link rel="stylesheet" href="styles.css">
    </head>

    <body>
        <?php

            include "functions.php";

            try
            {

                $host = "db.ist.utl.pt";
                $user ="ist187666";
                $password = "joana0101";
                $dbname = $user;
                
                $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
                $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


                $type1 = "ProcessoSocorro";
                $type2 = "Meio";


                $columnNum1 = count($tables[$type1]);
                $columnNum2 = count($tables[$type2]);

                $type = "acciona";

                if(isset($_POST['ProcessoSelect']) && isset($_POST['MeioSelect'])){
                    $sql = "INSERT INTO " . $type . " VALUES(";

                    $valuesProc = explode(",", $_POST['ProcessoSelect']);
                    $valuesMeio = explode(",", $_POST['MeioSelect']);

                    $columnNumType = count($tables[$type]);

                    for($i = 0; $i < $)

                    for($i = 0; $i < $columnNum1; $i++){

                        if()


                        if($i == $columnNum1 - 1){
                            $sql .= toCorrectType($tables[$type][$i], $_POST[$i]) . ");";
                            break;
                        }

                        $sql .= toCorrectType($tables[$type][$i], $_POST[]) . ", ";
                    }

                    for($i = 0; $i < $columnNum2; $i++){
                        if($i == count($tables[$type]) - 1){
                            $sql .= toCorrectType($tables[$type][$i], $_POST[str_replace(' ', '', $tables[$type][$i])]) .");";
                            break;
                        }

                        $sql .= toCorrectType($tables[$type][$i], $_POST[str_replace(' ', '', $tables[$type][$i])]) . ", ";
                    }

                    echo($sql);

                    $result = $db->prepare($sql);

                    $result->execute();
                }
                
                $sql1 = "SELECT * FROM ProcessoSocorro;";
                $sql2 = "SELECT * FROM Meio;";


                $result1 = $db->prepare($sql1);
                $result2 = $db->prepare($sql2);

                $result1->execute();
                $result2->execute();

                $result1 = $result1->fetchAll();
                $result2 = $result2->fetchAll();

                $result1Count = count($result1);
                $result2Count = count($result2);


                $selectionProcesso = "
                    <input type = 'radio' name = 'ProcessoSelect' class = 'radioSelect' value = '%s'>
                ";

                $selectionMeio = "
                    <input type = 'radio' name = 'MeioSelect' class = 'radioSelect' value = '%s'>
                ";

                echo("<form action = 'associaProcesso.php' method = 'post'>
                        <input class = 'confirmButtonAssocia' type='submit' value='Confirmar'>
                ");

                echo("<div class = 'ColumnLeft'>");

                foreach($result1 as $key => $row){

                    $value = "";

                    for($i = 0; $i < $columnNum1; $i++){
                        $value .= $row[$i] . ",";
                    }

                    array_push($result1[$key], sprintf($selectionProcesso, substr($value, 0, -1)));
                }

                array_push($tables['ProcessoSocorro'], "");

                printTable($tables['ProcessoSocorro'], $result1, "ProcessoSocorro", "selectionCell");

                echo("</div>");

                echo("<div class = 'ColumnRight'>");

                foreach($result2 as $key => $row){

                    $value = "";

                    for($i = 0; $i < $columnNum2; $i++){
                        $value .= $row[$i] . ",";
                    }

                    array_push($result2[$key], sprintf($selectionMeio, substr($value, 0, -1)));
                }

                array_push($tables['Meio'], "");

                printTable($tables['Meio'], $result2, "Meio", "selectionCell");
                echo("</div></form>");

                $db = null;
            }
            catch (PDOException $e)
            {
                echo("<p>ERROR: {$e->getMessage()}</p>");
            }
        ?>
    </body>
</html>